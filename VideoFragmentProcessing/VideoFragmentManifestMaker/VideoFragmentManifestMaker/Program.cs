using System;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using LibDataUploader;
using LibProcessLog;
using LibVLC.NET;
using VideoFragmentData;
using LibVideoFragmentManifest;

namespace VideoFragmentManifestMaker
{
    class Program
    {
        private static int _fileSeqNum;
        private static int _prevTickCount;
        private static readonly ProcessLog Pl = new ProcessLog();
        private const int MaxLogCount = 100;

        /// <summary>
        /// Creates manifest file.
        /// </summary>
        /// <param name="fileName">Manifest file name.</param>
        private static void CreateManifest(string fileName)
        {
            var serializer = new VideoFragmentManifestSerializer();
            var manifest = new VideoFragmentManifest
                {
                    EventDetectorManifest = new EventDetectorManifestType
                        {
                            EventList = new EventType[0]
                        },
                    YouTubeManifest = new YouTubeManifestType
                        {
                            Category = "People", //  Uses "standard" category.
                            Description = "A video fragment containing surveillance event.",
                            DeveloperKey =
                                "AI39si6DuKs7tbc6L0UyWLPDvjsW3eNneiwg0GB__FAYP6t64Ny-tNXo7otmmoyUWvZ8pltkK9Ou0vv8J_12FJhLZMwnNfwjBw",
                            Keywords = "video surveillance",
                            Tags = "street, outdoor, webcam",
                            Title = "View from my south window.",
                            UserName = "dmitry.vl.morozov@gmail.com",
                            UserPass = "719vbn933"
                        }
                };

            //  Does request to database for user data...

            //  Serializes the manifest.
            serializer.Serialize(fileName, manifest);
        }

        public static bool GetDateFromAws = false;
        //  The fragment must be recorded as OGG to be playable by browser with HTML5 support.
        //  https://www.evernote.com/shard/s132/nl/14501366/a8cc1d6b-9812-432d-93cf-b72da97dcfe8
        public static string OutputFormat = ":sout=#transcode{vcodec=theo,vb=800,acodec=vorb,ab=128,channels=2,samplerate=44100}";
        public static string OutputExt = ".ogg";

        //  https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
        private static void ReadConfiguration()
        {
            var appSettings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            GetDateFromAws = bool.Parse(appSettings["GetDateFromAws"]);
            OutputFormat = appSettings["OutputFormat"];
            OutputExt = appSettings["OutputExt"];
        }

        static void Main(string[] args)
        {
            try
            {
                //  https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
                ReadConfiguration();
            }
            catch (Exception e)
            {
                //  https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
                Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
            }

            try
            {
                //  The last parameters is made optional for compatibility.
                if (args.Length < 4)
                    throw new Exception(
                        "Usage: " +
                        "\n\t<URL to capture video fragments or device name> <path to temporary folder> "+
                        "\n\t<fragment length (in secs)> {<path to output folder> | <domain name of web application>} " +
                        "\n\t[stop event name] [name of device template file]");

                var p = System.Diagnostics.Process.GetCurrentProcess();
                Pl.StartProcessLog(p.MainModule.FileName, args.Aggregate((s1, s2) => s1 + " " + s2), (short)p.Id, MaxLogCount);

                //  Sets up the URL.
                var url = args[0];
                var devName = args[0];
                //  Sets up the path to temporary folder.
                //  The check for null supresses subsequent warnings.
                var path = args[1] ?? "";
                //  Sets up the fragment length.
                var length = int.Parse(args[2]);
                //  Sets up the output folder or domain.
                var domain = args[3];
                var outputPath = args[3];
                var stopEvent = (args.Length > 4) ? new EventWaitHandle(false, EventResetMode.AutoReset, args[4]/*event name*/) : null;
                //  This parameter is used as a flag for choosing between "domain" and "output folder".
                var templateFile = (args.Length > 5) ? args[5] : null;
                DataUploader dataUploader = null;

                Pl.AddMessage("Starting with URL " + url + ", Path " + path + ", Fr. length " + length + ", St. event" + (args.Length > 4 ? args[4] : ""));

                if (templateFile != null)
                {
                    //  evernote:///view/14501366/s132/da087456-f927-44a1-836c-1faa6b8f52f7/da087456-f927-44a1-836c-1faa6b8f52f7/
                    var dir = Path.GetDirectoryName(templateFile) ?? "";
                    var filledTemplateFile = Path.Combine(dir, "filled_template.temporary.xml");

                    dataUploader = new DataUploader(templateFile, filledTemplateFile, domain);
                    Pl.AddMessage("Name of device template file: " + templateFile);
                }

                bool createdNew;
                using (var mutex = new Mutex(false, "VideoFragmentProcessingMutex", out createdNew))
                {
                    //  Fragment recording cycle.
                    var running = true;
                    while (running)
                    {
                        try
                        {
                            //  Creates fragment file name.
                            var dt = DateTime.Now;

                            //  Gets date from HTTP-request.
                            if (GetDateFromAws)
                            {
                                var req = (HttpWebRequest) WebRequest.Create("http://aws.amazon.com/");
                                try
                                {
                                    var res = req.GetResponse();

                                    var date = res.Headers.Get("Date");
                                    dt = DateTime.Parse(date);

                                    res.Close();
                                    req.Abort();
                                }
                                catch (Exception e)
                                {
                                    Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
                                }
                            }

                            var tickCount = Environment.TickCount;
                            var fileName = Path.Combine(path, dt.ToString("yy.MM.dd.HH.mm.ss") + OutputExt);

                            //  https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
                            //  This allows direct recording from USB-device.
                            var sourceLine = url.Contains("http")
                                                 ? url + 
                                                 " :network-caching=1000 :dshow-vdev= :dshow-adev=none :dshow-size=320x240 :live-caching=300" :
                                                 "dshow:// :dshow-vdev=\"" + devName + "\" :dshow-size=320x240 :dshow-adev=none :live-caching=300";

                            //  https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
                            var command = "-I none " + sourceLine + " " +
                                          OutputFormat +
                                          ":file{dst=" + fileName + "} :sout-keep" +
                                          //  It seems that this option doesn't work.
                                          //" --logfile " + Path.ChangeExtension(fileName, "log") +
                                          " --no-sout-audio --no-crashdump" +
                                          " --run-time=" + length +" vlc://quit";

                            Pl.AddMessage("VLC command line: " + command);

                            //  Starts fragment recording.
                            Pl.AddMessage(string.Format("{1} Recording of {0}, interval {2}", fileName, _fileSeqNum.ToString("D6"), 
                                _prevTickCount == 0 ? "unknown" : (tickCount - _prevTickCount).ToString("D10")));
                            _prevTickCount = tickCount;

                            //  Synchronous execution of VLC.
                            //  The process should be terminated before exit.
                            VlcExec.ExecVlcCommand(command);

                            //  Waits for stop or VLC termination.
                            //  evernote:///view/14501366/s132/40065847-19a8-48d7-85fd-a0500a6009be/40065847-19a8-48d7-85fd-a0500a6009be/
                            while (!VlcExec.HasExited())
                            {
                                //  Tests the stop event.
                                if (stopEvent != null)
                                {
                                    if(!stopEvent.WaitOne(1000))
                                        continue;
                                }
                                else
                                {
                                    Thread.Sleep(1000);
                                    continue;
                                }

                                //  To unblock exit in the case of exception.
                                running = false;

                                VlcExec.Kill();
                                //  Deletes the uncompleted file.
                                try
                                {
                                    File.Delete(fileName);
                                }
// ReSharper disable EmptyGeneralCatchClause
                                catch
// ReSharper restore EmptyGeneralCatchClause
                                {
                                    //  Ignores any filesystem exceptions.
                                }
                                return;
                            }

                            //  Creates a manifest.
                            var manifestFileName = Path.ChangeExtension(fileName, "xml");
                            CreateManifest(manifestFileName);

                            try
                            {
                                mutex.WaitOne();
                                
                                if (dataUploader == null)
                                {
                                    //  Moves files to the output folder.
                                    File.Move(fileName, Path.Combine(outputPath, Path.GetFileName(fileName)));
                                    File.Move(manifestFileName, Path.Combine(outputPath, Path.GetFileName(manifestFileName)));
                                }
                                else
                                {
                                    //  Upload link to the web-application.
                                    //  evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
                                    dataUploader.Upload(fileName, Guid.NewGuid().ToString());
                                }
                            }
                            finally 
                            {
                                mutex.ReleaseMutex();
                            }

                            _fileSeqNum++;

                            //  evernote:///view/14501366/s132/0bf04101-3cd3-4b79-a579-a0cbdae980ba/0bf04101-3cd3-4b79-a579-a0cbdae980ba/
                            //  Checks for exit signal.
                            if (stopEvent != null && stopEvent.WaitOne(0)) return;
                        }
                        catch (Exception e)
                        {
                            Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
                            //  Waits before next cycle to avoid too fast cycling.
                            var heartbeat = new ConsoleHeartbeat(10);
                            for (var i = 0; i < 10; i++)
                            {
                                heartbeat.Beat();
                                Thread.Sleep(1000);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
            }
        }
    }
}
