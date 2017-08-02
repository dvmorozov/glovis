
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading;
using LibExeCache;
using LibHttpClient;
using LibProcessLog;
using LibRecordingConfig;
using LibStarterModel.Models;
using RecordingConfigData;
using Process = System.Diagnostics.Process;

namespace AppStarterScript
{
    internal class Monitor
    {
        private class FileMonitoringAttrs
        {
            public string Name;
            public long Size;       //   The size of file at previous monitoring cycle.
        }

        private readonly string _monitoringFolder;
        private readonly LogRepository _logRepository;  //  Monitoring log.
        private readonly Guid _taskId;
        private readonly List<FileMonitoringAttrs> _fileAttrsList = new List<FileMonitoringAttrs>();

        public Monitor(string monitoringFolder, LogRepository logRepository, Guid taskId)
        {
            _monitoringFolder = monitoringFolder;
            _logRepository = logRepository;
            _taskId = taskId;
        }

        public bool IsChainWorksProperly()
        {
            if (_monitoringFolder == string.Empty) return false;

            var result = true;
            //  Checks for file sizes.
            bool createdNew;
            using (new Mutex(true, "VideoFragmentProcessingMutex", out createdNew))
            {
                Program.Pl.AddMessage("The folder to be monitored is: \"" + _monitoringFolder + "\".");
                var files = Directory.GetFiles(_monitoringFolder, "*.mp4");

                //  Does not release the mutex until checks all the files.
                if (files.Length != 0)
                {
                    foreach (var fileName in files)
                    {
                        var f = new FileInfo(fileName);
                        var now = DateTime.Now;

                        //  Checks file size and file age.
                        if (now.Subtract(f.CreationTime).Seconds > Program.GoodFileMinLifeTimeS &&
                            f.Length < Program.GoodFileMinSizeBytes)
                        {
                            //  Too small file. It is probably broken.
                            var reason = "Restarts because broken file: " + fileName + "\".";

                            //  Adds log record to the database.
                            Program.Pl.AddMessageAnyway(reason, Program.AppName);
                            try
                            {
                                _logRepository.AddMonitoringLog(_taskId, reason);
                            }
                            catch (Exception e)
                            {
                                //  Possible exceptions from the database server are not critical
                                //  for the monitoring process and consequently must not to go out
                                //  of here.
                                Program.Pl.AddMessageAnyway(ProcessLog.GetExceptionMessage(e), Program.AppName);
                            }
                            result = false;
                            break;
                        }
                        var name = fileName;
                        var prevAttrs = _fileAttrsList.Count(t => t.Name == name) != 0 ? _fileAttrsList.First(t => t.Name == name) : null;
                        if (prevAttrs != null)
                        {
                            if (prevAttrs.Size == f.Length)
                            {
                                result = false;
                                Program.Pl.AddMessageAnyway("Restarts because halt of: " + fileName + "\".", Program.AppName);
                                break;
                            }
                        }
                        else
                        {
                            //  Adds a new file name.
                            _fileAttrsList.Add(new FileMonitoringAttrs{Name = fileName, Size = f.Length});
                        }

                        //  Removes names of inexisting files from the list.
                        _fileAttrsList.RemoveAll(item => files.Count(t => t == item.Name) == 0); 
                    }
                }
            }
            return result;
        }
    }

    class TaskStarter
    {
        /// <summary>
        /// This is used only in Start() and Stop().
        /// </summary>
        private readonly Guid _taskId;

        private readonly string _taskFolder;

        private readonly LogRepository _logRepository = new LogRepository();

        private const string EventNamePrefix = "StopAppStarterScriptEvent_";

        public TaskStarter(Guid taskId)
        {
            _taskId = taskId;
            //  Creates a temporary folder.
            //  Gets path to the application executable.
            _taskFolder = Path.Combine(Path.GetDirectoryName(Path.GetFullPath(Assembly.GetExecutingAssembly().Location)) ?? "", _taskId.ToString());
            Directory.CreateDirectory(_taskFolder);
        }

        private const string YouTubeUploaderFolderName = "YouTubeUploader";
        private const string EventDetectorFolderName = "EventDetector";
        private const string VideoFragmentManifestMakerFolderName = "VideoFragmentManifestMaker";

        /// <summary>
        ///  Creates template file.
        ///  The file must not have the "xml" extension to avoid conflict with manifest file names.
        /// </summary>
        /// <param name="template"></param>
        /// <param name="folder"></param>
        private static string MakeTemplateFile(string template, string folder)
        {
            var templateFileName = Path.Combine(folder, "upload.template");
            using (var file = new StreamWriter(templateFileName))
            {
                file.Write(template);
            }
            return templateFileName;
        }

        /// <summary>
        /// Creates temporary directory and starts YouTubeUploader.
        /// </summary>
        /// <returns>Process identifier.</returns>
        private int StartYouTubeUploader(string template, RecordingConfig config, out string youTubeFolder)
        {
            Console.WriteLine("\nYouTubeUploader is starting...");
            Program.Pl.AddMessage("YouTubeUploader is starting...");
            //  Creates a temporary folder.
            youTubeFolder = Path.Combine(_taskFolder, YouTubeUploaderFolderName);
            Directory.CreateDirectory(youTubeFolder);

            var templateFileName = MakeTemplateFile(template, youTubeFolder);

            var portalDomainAndPort = config.PortalDomain + ":" + config.PortalPort;
            //  The first parameter must be the name of a folder to scan for files.
            //  The second parameter must be the name of device template file.
            //  The third parameter must be the domain name (and port) of web application.

            var cache = new ExeCache();
            var process = cache.FindPathAndExecute("YouTubeUploader.exe", "\"" + youTubeFolder + "\" " + "\"" + templateFileName + "\" " + "\"" + portalDomainAndPort + "\"");

            if (process != null) return process.Id;
            throw new Exception("The descriptor is null for process \"YouTubeUploader\".");
        }

        /// <summary>
        /// Creates incoming folder and starts event detector. 
        /// </summary>
        /// <param name="outgoingFolder">The input folder of next utility in processing chain.</param>
        /// <param name="eventDetectorFolder">The incoming folder.</param>
        /// <returns>Process identifier.</returns>
        private int StartEventDetector(string outgoingFolder, out string eventDetectorFolder)
        {
            Console.WriteLine("\nEvent detector is starting...");
            Program.Pl.AddMessage("Event detector is starting...");
            //  Creates incoming folder.
            eventDetectorFolder = Path.Combine(_taskFolder, EventDetectorFolderName);
            Directory.CreateDirectory(eventDetectorFolder);

            //  Starts event detector.
            var cache = new ExeCache();
            var process = cache.FindPathAndExecute("EventDetector.exe", "\"" + eventDetectorFolder + "\" " + "\"" + outgoingFolder + "\" " +
                (Program.UiVisible ? "--visible" : "--invisible")
                + " 50");

            if (process != null) return process.Id;
            throw new Exception("The descriptor is null for process \"EventDetector\".");
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/56dbceb1-1675-4071-99f7-380a036d48cd
        private static string GetSourceUrl(string domain, int port)
        {
            if (Program.DeviceNameAsDomain) return "\"" + domain + "\"";
            return Program.ProtocolType + (!Program.NoDomainAndPort ? domain + ":" + port : "");
        }

        /// <summary>
        /// Starts video proxy in accordance with given configuration.
        /// </summary>
        /// <param name="config">Current configuration.</param>
        /// <returns>Process identifier.</returns>
        private int StartVideoProxy(RecordingConfig config)
        {
            if (Program.NoVideoProxy)
            {
                Console.WriteLine("\nVideo proxy disabled.");
                Program.Pl.AddMessage("Video proxy disabled.");
                return 0;
            }
            Console.WriteLine("\nVideo proxy is starting...");
            Program.Pl.AddMessage("Video proxy is starting...");

            var domain = Program.SourceDomain != string.Empty ? Program.SourceDomain : config.SourceDomain;
            var port = Program.SourcePort != 0 ? Program.SourcePort : config.SourcePort;

            var sourceUrl = GetSourceUrl(domain, port);

            var par = (Program.UiVisible ? "" : "-I none ") +
                (config.ProxyCommandLine != string.Empty ?
                // Uses the given command line.
                      config.ProxyCommandLine :
                // Constructs the command line from parameters.
                      sourceUrl + " :network-caching=1000 " +
                // With these parameters the proxy crashes.
                //":sout=#transcode{vcodec=mp2v,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:" +
                // Is translating by HTTP.
                      ":sout=#transcode{vcodec=WMV2,vb=800,scale=1,acodec=wma2,ab=128,channels=2,samplerate=44100}:http{mux=asf,dst=:" +
                      config.VideoProxyPort + "/} :sout-keep" +
                // Is translating by RTP.
                //":sout=#transcode{vcodec=WMV2,vb=800,scale=1,acodec=wma2,ab=128,channels=2,samplerate=44100}:rtp{dst=localhost,port=" + config.VideoProxyPort + ",mux=ts,ttl=1} :sout-keep" +
                      (config.NoAudio ? " --no-sout-audio" : "") +
                      " --no-crashdump");
            //  Starts video proxy.
            var cache = new ExeCache();

            Console.WriteLine("\nProxy command line (VLC):\n" + par);
            Program.Pl.AddMessage("Proxy command line (VLC): " + par);

            var process = cache.FindPathAndExecute("vlc.exe", par);

            Console.Write("\nWaits while proxy is starting video capture");
            for (var i = 0; i < 20; i++)
            {
                Console.Write(".");
                Thread.Sleep(1000);
            }
            Console.WriteLine();

            if (process != null) return process.Id;
            throw new Exception("The descriptor is null for process \"vlc\".");
        }

        /// <summary>
        /// Creates temporary folder and starts recording prоcess.
        /// </summary>
        /// <param name="config">Current configuration.</param>
        /// <param name="outgoingFolder">The input folder of next utility in processig chain.</param>
        /// <param name="stopEventName"></param>
        /// <param name="template"></param>
        /// <returns>Process identifier.</returns>
        private int StartVideoFragmentManifestMaker(RecordingConfig config, string outgoingFolder, out string stopEventName, string template)
        {
            Console.WriteLine("\nVideo manifest maker is starting...");
            Program.Pl.AddMessage("Video manifest maker is starting...");
            //  Creates recording folder.
            _recordingFolder = Path.Combine(_taskFolder, VideoFragmentManifestMakerFolderName);
            Directory.CreateDirectory(_recordingFolder);

            stopEventName = Guid.NewGuid().ToString();
            var domain = Program.SourceDomain != string.Empty ? Program.SourceDomain : config.SourceDomain;
            var port = Program.SourcePort != 0 ? Program.SourcePort : config.SourcePort;

            var sourceUrl = Program.NoVideoProxy ?
                //  Doesn't use proxy.
                GetSourceUrl(domain, port) :
                //  Uses proxy.
                (Program.ProtocolType + "localhost:" + config.VideoProxyPort);

            string par;
            if (!Program.NoEventDetector)
            {
                //  VideoFragmentManifestMaker is starting in the chain with EventDetector.
                par = sourceUrl
                            + " \"" + _recordingFolder + "\" " + config.FragmentLength + " \"" + outgoingFolder +
                            "\" " + stopEventName;
            }
            else
            {
                //  VideoFragmentManifestMaker is starting alone.

                var templateFileName = MakeTemplateFile(template, _recordingFolder);

                var portalDomainAndPort = config.PortalDomain + ":" + config.PortalPort;

                par = sourceUrl +
                        " \"" + _recordingFolder + "\" " + config.FragmentLength + " \"" + portalDomainAndPort +
                        "\" " + stopEventName + " \"" + templateFileName + "\"";
            }
                
            //  evernote:///view/14501366/s132/e21cec04-5ec5-4eee-8869-ec55b80b606c/e21cec04-5ec5-4eee-8869-ec55b80b606c/
            Program.Pl.AddMessage("VideoFragmentManifestMaker is starting with params " + par);
            //  Starts VideoFragmentManifestMaker.
            var cache = new ExeCache();
            var process = cache.FindPathAndExecute("VideoFragmentManifestMaker.exe", par);

            if (process != null) return process.Id;
            throw new Exception("The descriptor is null for process \"VideoFragmentManifestMaker\".");
        }

        //  The field stores the path obtained in starting of YouTubeUploader. 
        private string _youTubeFolder = string.Empty;
        //  The field stores the path obtained in starting of VideoFragmentManifestMaker. 
        //  This path is used subsequently in the monitoring procedure.
        private string _recordingFolder = string.Empty;

        public void Start()
        {
            Program.Pl.AddMessage("Task is going to be started.");
            //  Reads task attributes.
            string config, template, process;
            using(var taskRepository = new TaskRepository())
                taskRepository.GetTaskAttributes(_taskId, out config, out template, out process);

            var serializer = new RecordingConfigSerializer();
            var recordingConfig = serializer.DeserializeFromString(config);

            var processSerializer = new ProcessConfigSerializer();
            var processConfig = processSerializer.DeserializeFromString(process);

            var incomingFolder = string.Empty;

            //  evernote:///view/14501366/s132/002d8292-f978-49e2-808f-1c8e92560a0b/002d8292-f978-49e2-808f-1c8e92560a0b/
            if (!Program.TestMode)
            {
                if (!Program.NoEventDetector)
                {
                    //  Starts task processes...
                    //  Starts YouTubeUploader.
                    processConfig.YouTubeUploaderPID = StartYouTubeUploader(template, recordingConfig,
                                                                            out _youTubeFolder);

                    //  Starts EventDetector.
                    processConfig.EventDetectorPID = StartEventDetector(_youTubeFolder, out incomingFolder);
                }

                //  Starts video proxy.
                processConfig.VideoProxyPID = StartVideoProxy(recordingConfig);

                //  Starts fragment recording.
                string stopEventName;
                processConfig.VideoFragmentManifestMakerPID = StartVideoFragmentManifestMaker(recordingConfig,
                                                                                              incomingFolder,
                                                                                              out stopEventName,
                                                                                              template);

                processConfig.VideoFragmentManifestMakerStopEvent = stopEventName;
            }
            //  Updates processes info.
            process = processSerializer.SerializeToString(processConfig);
            using(var taskRepository = new TaskRepository())
                taskRepository.UpdateProcess(_taskId, process, true);
            Program.Pl.AddMessage("Task had started.");
        }

        public void StartWithCallback()
        {
            Start();
            SuccessCallback();
        }

        //  Checks application state for terminating condition.
        private bool IsMonitoringTerminated()
        {
            //  Still forever.
            return false;
        }

        public void StartAndMonitor()
        {
            //  At this stage exceptions are allowed.
            if (Program.OperationId != null)
                StartWithCallback();
            else
                Start();

            //  Starts monitoring cycle.
            try
            {
                //  Must be created with "using" because is system resource.
                using (
                    var stopMonitoringEvent = new EventWaitHandle(false, EventResetMode.AutoReset, EventNamePrefix + _taskId))
                {
                    Program.Pl.AddMessageAnyway("Starts monitoring cycle.", Program.AppName);
                    var monitor = new Monitor(_recordingFolder, _logRepository, _taskId);
                    while (!IsMonitoringTerminated())
                    {
                        if (!monitor.IsChainWorksProperly())
                        {
                            //  Restarts the whole processing chain.
                            Program.Pl.AddMessageAnyway("Restarts the processing chain.", Program.AppName);
                            StopInternal();
                            Start();
                        }
                        //  Must be here to avoid "fast" cycling.
                        Program.Heartbeat.Beat();
                        //  The wait time determines minimum interval between start and checking for proper working.
                        //  This time must be enough.
                        if (stopMonitoringEvent.WaitOne(10000))
                        {
                            Program.Pl.AddMessageAnyway("Breaks monitoring cycle by event.", Program.AppName);
                            break;
                        }
                    }
                }
            }
            finally
            {
                //  Stops the task.
                StopInternal();
                //  There are no needs to send callback from this place, because
                //  it was sent at the beginning of the monitoring cycle. In the
                //  case of exception the callback will be sent from the main 
                //  procedure.
                //  Exits monitoring cycle.
                Program.Pl.AddMessageAnyway("Exits monitoring cycle.", Program.AppName);
            }
        }

        /// <summary>
        /// Removes the temporary task folder.
        /// </summary>
        private void StopYouTubeUploader(int processId)
        {
            Console.WriteLine("\nYouTubeUploader is stopped...");
            Program.Pl.AddMessage("YouTubeUploader is stopped...");
            KillProcess(processId);
            var folderName = Path.Combine(_taskFolder, YouTubeUploaderFolderName);
            Folder.DeleteFolderWithContent(folderName);
        }

        private void StopEventDetector(int processId)
        {
            Console.WriteLine("\nEvent detector is stopped...");
            Program.Pl.AddMessage("Event detector is stopped...");
            KillProcess(processId);
            var folderName = Path.Combine(_taskFolder, EventDetectorFolderName);
            Folder.DeleteFolderWithContent(folderName);
        }

        private void StopVideoProxy(int processId)
        {
            Console.WriteLine("\nVideo proxy is stopped...");
            Program.Pl.AddMessage("Video proxy is stopped...");
            //  The processId can be equal to 0 in the case 
            //  when proxy disabled (NoVideoProxy flag is set).
            if (processId != 0) KillProcess(processId);
        }

        private void StopVideoManifestMaker(int processId, string stopEventName)
        {
            Console.WriteLine("\nVideoFragmentManifestMaker is stopped...");
            Program.Pl.AddMessage("VideoFragmentManifestMaker is stopped...");
            try
            {
                var process = Process.GetProcessById(processId);
                try
                {
                    Program.Pl.AddMessage("Tries to open stop event " + stopEventName);
                    using (var stopEvent = EventWaitHandle.OpenExisting(stopEventName))
                    {
                        //  Sets the stop event and waits for termination.
                        Program.Pl.AddMessage("Sets stop event " + stopEventName);
                        stopEvent.Set();
                    }
                    //  This time is equal or more than the VLC recording cycle.
                    Program.Pl.AddMessage("Waits for stop of VideoFragmentManifestMaker.");
                    process.WaitForExit();
                }
                catch (Exception e)
                {
                    //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
                    Program.Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
                    KillProcess(processId);
                    Program.Pl.AddMessage("VideoFragmentManifestMaker killed.");
                }
            }
            catch (Exception e)
            {
                //  Ignores an exception when process does not exist.
                Program.Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
            }

            //  evernote:///view/14501366/s132/64590cba-1489-4d5e-b06e-0278583c8964/64590cba-1489-4d5e-b06e-0278583c8964/
            if (Program.DeleteFramgmentsOnStop)
            {
                var folderName = Path.Combine(_taskFolder, VideoFragmentManifestMakerFolderName);
                Folder.DeleteFolderWithContent(folderName);
            }
        }

        /// <summary>
        /// Waits for process termination and throws an exception in the case of timeout.
        /// </summary>
        /// <param name="processId">Process identifier to terminate.</param>
        private void KillProcess(int processId)
        {
            try
            {
                var process = Process.GetProcessById(processId);
                process.Kill();
                //  Waits for termination.
                process.WaitForExit();
            }
// ReSharper disable EmptyGeneralCatchClause
            catch
// ReSharper restore EmptyGeneralCatchClause
            {
                //  Ignores an exception when process does not exist.
            }
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/fbf34e04-daef-4416-ab37-e7ce398921e8
        private void StopInternal()
        {
            Program.Pl.AddMessageAnyway("TaskStarter.StopInternal", Program.AppName);
            //  Gets processes info.
            string config, template, process;
            using(var taskRepository = new TaskRepository())
                taskRepository.GetTaskAttributes(_taskId, out config, out template, out process);

            var processSerializer = new ProcessConfigSerializer();
            var processConfig = processSerializer.DeserializeFromString(process);

            //  evernote:///view/14501366/s132/002d8292-f978-49e2-808f-1c8e92560a0b/002d8292-f978-49e2-808f-1c8e92560a0b/
            if (!Program.TestMode)
            {
                //  Stops task processes by the order reversed relatively the starting order.
                //  Stops fragment recording.
                StopVideoManifestMaker(processConfig.VideoFragmentManifestMakerPID,
                                       processConfig.VideoFragmentManifestMakerStopEvent);
                processConfig.VideoFragmentManifestMakerPID = 0;

                //  Stops video proxy.
                StopVideoProxy(processConfig.VideoProxyPID);
                processConfig.VideoProxyPID = 0;

                //  Stops EventDetector.
                StopEventDetector(processConfig.EventDetectorPID);
                processConfig.EventDetectorPID = 0;

                //  Stops YouTubeUploader.
                StopYouTubeUploader(processConfig.YouTubeUploaderPID);
                processConfig.YouTubeUploaderPID = 0;
            }

            _youTubeFolder = string.Empty;
            _recordingFolder = string.Empty;
        }

        /// <summary>
        /// Stop or deletes the processes launched before. In the last case does not update the database record.
        /// </summary>
        public void Stop()
        {
            Program.Pl.AddMessageAnyway("TaskStarter.Stop, TestMode = " + Program.TestMode, Program.AppName);
            if (Program.TestMode) return;

            //  Stops a possible monitoring process (another instance of this application).
            try
            {
                using (
                    var stopMonitoringEvent = EventWaitHandle.OpenExisting(EventNamePrefix + _taskId))
                {
                    Program.Pl.AddMessageAnyway("Sets stop event.", Program.AppName);
                    stopMonitoringEvent.Set();
                    return;
                }
            }
            catch (Exception e)
            {
                Program.Pl.AddMessageAnyway(ProcessLog.GetExceptionMessage(e), Program.AppName);
            }
            //  If monitoring process not found, stops processes by itself.
            StopInternal();
        }

        private void SuccessCallback()
        {
            AppStarterClient.UpdateCommandResult(Program.OperationId, "Success.", Program.AppStarterDomain, Program.AppStarterPort, true);
            PortalClient.UpdateCommandResult(Program.OperationId, "Success.", Program.PortalDomain, Program.PortalPort, true);
        }

        public void StopWithCallback()
        {
            Stop();
            //  https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
            //  In any case must notify calling applications.
            SuccessCallback();
        }
    }
}