using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using LibHttpClient;
using LibProcessLog;
using Process = System.Diagnostics.Process;

namespace AppStarterScript
{
    class Program
    {
        private static void ReadConfiguration()
        {
            var appSettings = (NameValueCollection) ConfigurationManager.GetSection("appSettings");
            UiVisible = bool.Parse(appSettings["UIVisible"]);
            MonitoringIntervalMs = int.Parse(appSettings["MonitoringIntervalMs"]);
            MonitoringDisabled = bool.Parse(appSettings["MonitoringDisabled"]);
            GoodFileMinSizeBytes = int.Parse(appSettings["GoodFileMinSizeBytes"]);
            NoVideoProxy = bool.Parse(appSettings["NoVideoProxy"]);
            NoEventDetector = bool.Parse(appSettings["NoEventDetector"]);
            NoDomainAndPort = bool.Parse(appSettings["NoDomainAndPort"]);
            DeviceNameAsDomain = bool.Parse(appSettings["DeviceNameAsDomain"]);
            ProtocolType = appSettings["ProtocolType"];
            SourceDomain = appSettings["SourceDomain"];
            SourcePort = int.Parse(appSettings["SourcePort"]);

            PortalDomain = appSettings["PortalDomain"];
            PortalPort = int.Parse(appSettings["PortalPort"]);
            PortalUserName = appSettings["PortalUserName"];
            PortalPassword = appSettings["PortalPassword"];

            AppStarterDomain = appSettings["AppStarterDomain"];
            AppStarterPort = int.Parse(appSettings["AppStarterPort"]);
            AppStarterUserName = appSettings["AppStarterUserName"];
            AppStarterPassword = appSettings["AppStarterPassword"];

            TestMode = bool.Parse(appSettings["TestMode"]);
            _maxLogCount = int.Parse(appSettings["MaxLogCount"]);
            DeleteFramgmentsOnStop = bool.Parse(appSettings["DeleteFramgmentsOnStop"]);
        }

        public static ConsoleHeartbeat Heartbeat = new ConsoleHeartbeat(10);
        public static bool UiVisible;
        public static int MonitoringIntervalMs = 1000;
        public static bool MonitoringDisabled = true;           //  https://www.evernote.com/shard/s132/nl/14501366/4c739755-07c0-4402-bb7c-918e327bcfe6
        public static int GoodFileMinSizeBytes = 10240;         //  Minimum allowed size of video fragment file to be valid.
        public static int GoodFileMinLifeTimeS = 2;             //  Minimum time (in seconds) allowed to go before checking size of the video fragment file.
        public static bool NoVideoProxy = false;
        public static bool NoEventDetector = false;             //  If true then the program is running in continuous mode without event detection.
                                                                //  In this case YouTubeUploader isn't started. Instead the S3Uploader is started.
        public static bool NoDomainAndPort = false;             //  If true then source domain and port are not used (for example, for dshow://).
        public static bool DeviceNameAsDomain = false;          //  https://www.evernote.com/shard/s132/nl/14501366/56dbceb1-1675-4071-99f7-380a036d48cd
        public static string ProtocolType = "http://";
        public static string SourceDomain = string.Empty;       //  When is set then overrides domain from task configuration.
        public static int SourcePort = 0;                       //  When is not zero then overrides port from task configuration.

        public static string PortalDomain = "localhost";
        public static int PortalPort = 2375;
        public static string PortalUserName = "Administrator";
        public static string PortalPassword = "dmitry!morozov";

        public static string AppStarterDomain = "localhost";
        public static int AppStarterPort = 2375;
        public static string AppStarterUserName = "Administrator";
        public static string AppStarterPassword = "dmitry!morozov";

        public static bool TestMode = false;
        private static int _maxLogCount = 100;
        public static bool DeleteFramgmentsOnStop = false;

        //  Operation identifier for which the process must update results.
        //  If empty then updating will not be performed.
        public static Guid? OperationId = null;
        public const string AppName = "AppStarterScript";

        public static readonly ProcessLog Pl = new ProcessLog();

        //  https://www.evernote.com/shard/s132/nl/14501366/4c739755-07c0-4402-bb7c-918e327bcfe6
        private static void Start(TaskStarter t)
        {
            try
            {
                if (OperationId != null)
                    t.StartWithCallback();
                else
                    t.Start();
            }
            catch (Exception)
            {
                t.Stop();
                throw;
            }
        }

        static void Main(string[] args)
        {
            if (args.Count() < 2)
            {
                Console.WriteLine("Please provide 3 parameters with following meanings:\n\t" +
                                  "0. Action: 'start', 'stop', 'start&monitor'.\n\t" +
                                  "1. Unique task identifier (ignored for 'restoreall', but must be).\n\t" +
                                  "3. Command identifier (optional, ignored for 'restoreall').");
                Console.WriteLine("Press any key to exit.");
                Console.ReadKey();
                return;
            }

            try
            {
                //  evernote:///view/14501366/s132/fc418675-1e63-44a0-be53-40ce394c5aa8/fc418675-1e63-44a0-be53-40ce394c5aa8/
                ReadConfiguration();
            }
            catch(Exception e)
            {
                //  evernote:///view/14501366/s132/fc418675-1e63-44a0-be53-40ce394c5aa8/fc418675-1e63-44a0-be53-40ce394c5aa8/
                Pl.AddMessage(e.Message + (e.InnerException != null ? "; inner: " + e.InnerException.Message : ""));
            }

            try
            {
                var p = Process.GetCurrentProcess();
                Pl.StartProcessLog(p.MainModule.FileName, args.Aggregate((s1, s2) => s1 + " " + s2), (short)p.Id, _maxLogCount);

                var action = args[0].ToLower();
                var taskId = args[1].ToLower();

                if (args.Count() > 2)
                {
                    Guid c;
                    if (Guid.TryParse(args[2], out c)) OperationId = c;
                }

                var t = new TaskStarter(Guid.Parse(taskId));

                Pl.AddMessage("Starting with action " + action + ", task " + taskId + ", operation " + (OperationId != null ? OperationId.ToString() : "null"));

                switch (action)
                {
                    case ("start"):
                        Start(t);
                        break;

                    case("start&monitor"):
                        //  Waits until task will be stopped.
                        if (!MonitoringDisabled)
                            t.StartAndMonitor();
                        else Start(t);
                        break;

                    case ("stop"):
                        if (OperationId != null)
                            t.StopWithCallback();
                        else
                            t.Stop();
                        break;

                    default:
                        throw new Exception("Unknown action.");
                }
            }
            catch (Exception e)
            {
                //  At first tries to save the message in the database.
                Pl.AddMessageAnyway(ProcessLog.GetExceptionMessage(e), AppName);

                if (OperationId == null) return;

                try
                {
                    //  Then tries to update status of the operation.
                    AppStarterClient.UpdateCommandResult(OperationId, ProcessLog.GetExceptionMessage(e), AppStarterDomain, AppStarterPort, false);
                }
                catch(Exception ei)
                {
                    Pl.AddMessageAnyway(ProcessLog.GetExceptionMessage(ei), AppName);
                }

                try
                {
                    //  Then tries to update status of the operation.
                    PortalClient.UpdateCommandResult(OperationId, ProcessLog.GetExceptionMessage(e), PortalDomain, PortalPort, false);
                }
                catch (Exception ei)
                {
                    Pl.AddMessageAnyway(ProcessLog.GetExceptionMessage(ei), AppName);
                }
            }
        }
    }
}
