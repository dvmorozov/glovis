using System;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using LibHttpClient;
using LibInstance;
using LibProcessLog;
using Process = System.Diagnostics.Process;

// Add using statements to access AWS SDK for .NET services. 
// Both the Service and its Model namespace need to be added 
// in order to gain access to a service. For example, to access
// the EC2 service, add:
// using Amazon.EC2;
// using Amazon.EC2.Model;

namespace InstanceStarter
{
    class Program
    {
        //  Configuration parameters.
        public static string PortalDomain = "localhost";
        public static int PortalPort = 2375;
        public static string PortalUserName = "Administrator";
        public static string PortalPassword = "dmitry!morozov";
        public static int FragmentLength = 20;
        public static string InstanceUserName = "Administrator";
        public static string InstancePassword = "dmitry!morozov";
        public static string ImageId;
        public static string InstanceType;
        public static string KeyName;
        public static string SecurityGroup;
        public static int InstancePort = 2376;
        public static int MaxTaskNumber = 4;
        public static int BaseVideoProxyPort = 8080;
        public static bool UseLocalInstance = true;
        public static bool AllowCallback = false;

        private static int _maxLogCount = 100;

        /// <summary>
        /// Reads parameters from the configuration file. Passing parameters through method output parameters 
        /// (instead of storing in object fields) makes the code more readable. All parameters are strings
        /// because of the configuration file stores key-value pairs as text.
        /// </summary>
        private static void ReadConfiguration()   
        {
            var appSettings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            PortalDomain = appSettings["PortalDomain"];
            PortalPort = int.Parse(appSettings["PortalPort"]);
            PortalUserName = appSettings["PortalUserName"];
            PortalPassword = appSettings["PortalPassword"];
            FragmentLength = int.Parse(appSettings["FragmentLength"]);
            InstanceUserName = appSettings["InstanceUserName"];
            InstancePassword = appSettings["InstancePassword"];
            ImageId = appSettings["ImageId"];
            InstanceType = appSettings["InstanceType"];
            KeyName = appSettings["KeyName"];
            SecurityGroup = appSettings["SecurityGroup"];
            InstancePort = int.Parse(appSettings["InstancePort"]);
            MaxTaskNumber = int.Parse(appSettings["MaxTaskNumber"]);
            BaseVideoProxyPort = int.Parse(appSettings["BaseVideoProxyPort"]);
            UseLocalInstance = bool.Parse(appSettings["UseLocalInstance"]);
            _maxLogCount = int.Parse(appSettings["MaxLogCount"]);
            AllowCallback = bool.Parse(appSettings["AllowCallback"]);
        }

        private static readonly ProcessLog Pl = new ProcessLog();

        public static void Main(string[] args)
        {
            //  Command identifier for which the process must update results.
            //  If empty then updating will not be performed.
            Guid? operationId = null;
            var p = Process.GetCurrentProcess();
            var pid = (ushort)p.Id;

            try
            {
                try
                {
                    //  Tries to write an informational message to the system log.
                    new System.Diagnostics.EventLog { Source = "InstanceStarter" }.WriteEntry("InstanceStarter has started.", System.Diagnostics.EventLogEntryType.Information, pid);
                }
                catch (Exception e)
                {
                    //  Blocks unimportant exceptions. Do not confuse with AddMessageAnyway.
                    try
                    {
                        //  Tries to write message to the database.
                        //  https://www.evernote.com/shard/s132/nl/14501366/28933c15-79a5-4f47-ba26-cb75193be411
                        Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
                    }
// ReSharper disable EmptyGeneralCatchClause
                    catch
// ReSharper restore EmptyGeneralCatchClause
                    {
                    }
                }

                //  This check must be before because of exception in the case when there are no parameters.
                if (args.Count() < 5)
                {
                    Console.WriteLine("Please provide 6 parameters with following meanings:\n\t" +
                                      "0. Action: 'start', 'stop', 'delete'.\n\t" +
                                      "1. Unique task identifier.\n\t" +
                                      "2. Source domain or IP.\n\t" +
                                      "3. Source port.\n\t" +
                                      "4. XML template (as string).\n\t" +
                                      "5. Command identifier (optional).");
                    Console.WriteLine("Press any key to exit.");
                    Console.ReadKey();
                    return;
                }

                Pl.StartProcessLog(p.MainModule.FileName, args.Aggregate((s1, s2) => s1 + " " + s2), (short) pid, _maxLogCount);

                try
                {
                    //  evernote:///view/14501366/s132/fc418675-1e63-44a0-be53-40ce394c5aa8/fc418675-1e63-44a0-be53-40ce394c5aa8/
                    //  Blocks possible exceptions to allow application of default values.
                    //  Must be before StartProcessLog to apply configured MaxLogCount.
                    ReadConfiguration();
                }
                catch(Exception e)
                {
                    //  Writes to log.
                    Pl.AddMessage(e.Message + (e.InnerException != null ? "; inner: " + e.InnerException.Message : ""));
                }
                
                var action = args[0].ToLower();

                Guid taskId;
                var taskIdParseResult = Guid.TryParse(args[1], out taskId);

                var sourceDomain = args[2];

                int sourcePort;
                var sourcePortParseResult = int.TryParse(args[3], out sourcePort);

                var xmlTemplate = args[4];

                if (args.Count() > 5)
                {
                    Guid c;
                    if (Guid.TryParse(args[5], out c)) operationId = c;
                }

                //  evernote:///view/14501366/s132/62ff2b5d-4016-44cb-a67c-918cc661253e/62ff2b5d-4016-44cb-a67c-918cc661253e/
                //  This is required to allow callback in the case of invalid parameter (commandId must be parsed before).
                if (!taskIdParseResult)
                    throw new InvalidDataException("Invalid value of task identifier.");

                if (!sourcePortParseResult)
                    throw new InvalidDataException("Invalid value of source port.");
#if DEBUG
                //  Outputs parameters to console.
                Console.WriteLine("Parameters");
                Console.WriteLine("");
                Console.WriteLine("Action: " + action);
                Console.WriteLine("TaskId: " + taskId);
                Console.WriteLine("SourceDomain: " + sourceDomain);
                Console.WriteLine("SourcePort: " + sourcePort);
                Console.WriteLine("XMLTemplate: " + xmlTemplate);
                //  Outputs configuration to console.
                Console.WriteLine("Configuraion");
                Console.WriteLine("");
                Console.WriteLine("PortalDomain: " + PortalDomain);
                Console.WriteLine("PortalPort: " + PortalPort);
                Console.WriteLine("PortalUserName: " + PortalUserName);
                Console.WriteLine("PortalPassword: " + PortalPassword);
                Console.WriteLine("FragmentLength: " + FragmentLength);
                Console.WriteLine("InstanceUserName: " + InstanceUserName);
                Console.WriteLine("InstancePassword: " + InstancePassword);
                Console.WriteLine("ImageId: " + ImageId);
                Console.WriteLine("InstanceType: " + InstanceType);
                Console.WriteLine("KeyName: " + KeyName);
                Console.WriteLine("SecurityGroup: " + SecurityGroup);
                Console.WriteLine("InstancePort: " + InstancePort);
                Console.WriteLine("MaxTaskNumber: " + MaxTaskNumber);
                Console.WriteLine("BaseVideoProxyPort: " + BaseVideoProxyPort);
                Console.WriteLine("UseLocalInstance: " + UseLocalInstance);
#endif

                var factory = UseLocalInstance ? (BaseInstance)new TestInstance(ImageId, InstanceType, KeyName, SecurityGroup, InstancePort) :
                    new Ec2Instance(ImageId, InstanceType, KeyName, SecurityGroup, InstancePort);

                var t = new TaskStarter(factory, Pl);

                switch (action)
                {
                    case ("start"):
                        Pl.AddMessage("Task is going to be started with id " + taskId + ", operation " + operationId + ".");

                        if (operationId != null && AllowCallback)
                            t.StartTaskWithCallback(taskId, FragmentLength, sourceDomain, sourcePort, xmlTemplate,
                                                    InstanceUserName, InstancePassword,
                                                    MaxTaskNumber, PortalDomain, PortalPort, PortalUserName,
                                                    PortalPassword, BaseVideoProxyPort, (Guid) operationId,
                                                    UseLocalInstance, InstancePort);
                        else
                            t.StartTask(taskId, FragmentLength, sourceDomain, sourcePort, xmlTemplate,
                                        InstanceUserName, InstancePassword,
                                        MaxTaskNumber, PortalDomain, PortalPort, PortalUserName, PortalPassword,
                                        BaseVideoProxyPort, operationId, UseLocalInstance, InstancePort);

                        Pl.AddMessage("Task had started.");
                        break;

                    case ("stop"):
                        if (operationId != null && AllowCallback)
                            t.StopTaskWithCallback(taskId, PortalDomain, PortalPort, (Guid) operationId);
                        else
                            t.StopTask(taskId, operationId);

                        Pl.AddMessage("Task had stopped.");
                        break;

                    case ("delete"):
                        t.DeleteTask(taskId);
                        break;

                    case ("mark_as_running"):
                        t.MarkTaskAsRunning(taskId);
                        break;

                    default:
                        throw new Exception("Unknown action.");
                }
            }
            catch (Exception e)
            {
                //  Writes to log.
                try
                {
                    Pl.AddMessage(ProcessLog.GetExceptionMessage(e));
                }
// ReSharper disable EmptyGeneralCatchClause
                catch
// ReSharper restore EmptyGeneralCatchClause
                {
                    //  Blocks all possible internal exceptions.
                    //  evernote:///view/14501366/s132/fd4b3235-6d27-4985-a2de-57fac9839fe4/fd4b3235-6d27-4985-a2de-57fac9839fe4/
                }
                //  Sends a message back to the portal.
                try
                {
                    if (operationId != null && AllowCallback)
                    {
                        PortalClient.UpdateCommandResult(operationId, ProcessLog.GetExceptionMessage(e), PortalDomain, PortalPort, false);
                    }
                }
// ReSharper disable EmptyGeneralCatchClause
                catch
// ReSharper restore EmptyGeneralCatchClause
                {
                    //  Blocks all possible internal exceptions.
                    //  evernote:///view/14501366/s132/fd4b3235-6d27-4985-a2de-57fac9839fe4/fd4b3235-6d27-4985-a2de-57fac9839fe4/
                }

                try
                {
                    var appLog = new System.Diagnostics.EventLog {Source = "InstanceStarter"};
                    appLog.WriteEntry(ProcessLog.GetExceptionMessage(e), System.Diagnostics.EventLogEntryType.Error, pid);
                }
// ReSharper disable EmptyGeneralCatchClause
                catch
// ReSharper restore EmptyGeneralCatchClause
                {
                    //  Blocks all possible internal exceptions.
                    //  evernote:///view/14501366/s132/fd4b3235-6d27-4985-a2de-57fac9839fe4/fd4b3235-6d27-4985-a2de-57fac9839fe4/
                }
            }
        }
    }
}