using System;
using System.Threading;
using LibHttpClient;
using LibInstance.Model;
using LibProcessLog;

namespace LibInstance
{
    /// <summary>
    /// This class implements the business logic of task operations.
    /// </summary>
    public class TaskStarter
    {
        private readonly InstanceRepository _instanceRepository = new InstanceRepository();
        private readonly BaseInstance _ec2Instance;
        private readonly TaskRepository _taskRepository = new TaskRepository();
        private readonly InstanceClient _instanceClient = new InstanceClient();

        private readonly ProcessLog _log;

        /// <summary>
        /// The instance factory should be given from the outside. This is matter of calling application.
        /// </summary>
        /// <param name="ec2Instance">The instance factory.</param>
        public TaskStarter(BaseInstance ec2Instance)
        {
            _ec2Instance = ec2Instance;
        }

        public TaskStarter(BaseInstance ec2Instance, ProcessLog pl)
        {
            _ec2Instance = ec2Instance;
            _log = pl;
        }

        /// <summary>
        /// Searches for an instance having task number less than maximum.
        /// </summary>
        /// <returns>Instance id. (primary key value) or null if any instance was not found.</returns>
        private int? FindUnderloadedInstance(out string instanceIpAndPort)
        {
            return _instanceRepository.GetFirstUnderloadedInstanceId(out instanceIpAndPort);
        }


        //  Replaces EC2 instance id. for the local instance.
        private const string LocalInstanceId = "localhost";

        /// <summary>
        /// Searches for the identifier of the local instance.
        /// </summary>
        /// <returns>Instance id. (primary key value) or null if the row was not found.</returns>
        private int? FindLocalInstance()
        {
            return _instanceRepository.GetInstanceById(LocalInstanceId);
        }

        /// <summary>
        /// Starts a new instance.
        /// </summary>
        /// <returns>The instance EC2-identifier.</returns>
        private string StartNewInstance()
        {
            string instanceId;
            _ec2Instance.StartInstance(out instanceId);
            //  Waits for the instance is starting.
            var sleepCount = 0;
            while (!_ec2Instance.IsInstanceRunning(instanceId))
            {
                Thread.Sleep(10000);
                if(++sleepCount == 6)
                    throw new Exception("Instance starting timeout.\n" +
                                        "Image id.: " + _ec2Instance.ImageId + "\n" +
                                        "Type: " + _ec2Instance.InstanceType + "\n" +
                                        "Security group: " + _ec2Instance.SecurityGroup + "\n" +
                                        "Instance id.: " + instanceId);
            }
            return instanceId;
        }

        /// <summary>
        /// Stops the instance and deletes all associated data.
        /// </summary>
        /// <param name="instanceId"></param>
// ReSharper disable UnusedParameter.Local
        private static void StopInstance(string instanceId)
// ReSharper restore UnusedParameter.Local
        {
            //  TODO: IMPLEMENT THIS.
        }

        /// <summary>
        /// Requests instance domain from the instance factory (i.e. from Amazon).
        /// </summary>
        /// <param name="instanceId">Instance identifier.</param>
        /// <returns>Instance domain name and port.</returns>
        private string GetInstanceDomain(string instanceId)
        {
            return _ec2Instance.GetInstanceDomain(instanceId) + ":" + _ec2Instance.InstancePort;
        }

        private string GetLocalInstanceDomain()
        {
            return "localhost:" + _ec2Instance.InstancePort;
        }

        /// <summary>
        /// Adds a new record to the instance database.
        /// </summary>
        /// <param name="maxTaskNumber"></param>
        /// <param name="ipAndPort"></param>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="instanceId"></param>
        /// <param name="baseVideoProxyPort"></param>
        private int? AddInstanceToDatabase(int maxTaskNumber, string ipAndPort, string userName, string password, string instanceId, int baseVideoProxyPort)
        {
            return _instanceRepository.AddNewInstance(_ec2Instance.ImageId, _ec2Instance.InstanceType, _ec2Instance.KeyName, _ec2Instance.SecurityGroup,
                maxTaskNumber, ipAndPort, userName, password, instanceId, baseVideoProxyPort);
        }

        private void MarkTaskAsRunning(long task, Guid taskId)
        {
            _taskRepository.MarkAsRunning(task, taskId);
        }

        public void MarkTaskAsRunning(Guid taskId)
        {
            _taskRepository.MarkAsRunning(taskId);
        }

        /// <summary>
        /// Searches a task record which is not in "Running" state.
        /// </summary>
        /// <param name="instanceId">The instance id.</param>
        /// <param name="videoProxyPort">The proxy port assigned to the task record.</param>
        /// <returns>The task id.</returns>
        private long GetUnassignedProxyPort(int instanceId, out int videoProxyPort)
        {
            return _instanceRepository.GetUnassignedVideoProxyPort(instanceId, out videoProxyPort);
        }

        /// <summary>
        /// Starts a new task.
        /// </summary>
        /// <param name="taskId">Unique task identifier connecting the task with the main portal database.</param>
        /// <param name="sourceDomain">The data (video) source domain.</param>
        /// <param name="sourcePort">The data (video) source port.</param>
        /// <param name="xmlTemplate">The XML-template to transmit data back to the main portal.</param>
        /// <param name="instanceUserName"></param>
        /// <param name="instancePassword"></param>
        /// <param name="maxTaskNumber">The maximum number of task permissible for the instance.</param>
        /// <param name="portalDomain"></param>
        /// <param name="fragmentLength"></param>
        /// <param name="portalPort"></param>
        /// <param name="portalUserName"></param>
        /// <param name="portalPassword"></param>
        /// <param name="baseVideoProxyPort">The starting value for calculation of video proxy port numbers.</param>
        /// <param name="useLocalInstance"></param>
        /// <param name="instancePort">The instance web-application port (control port).</param>
        /// <param name="commandId">Unique operation identifier.</param>
        public void StartTask(Guid taskId, int fragmentLength, string sourceDomain, int sourcePort, 
            string xmlTemplate, string instanceUserName, string instancePassword, int maxTaskNumber,
            string portalDomain, int portalPort, string portalUserName, string portalPassword, int baseVideoProxyPort,
            //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
            Guid? commandId = null, 
            bool useLocalInstance = false, int instancePort = 80
            )
        {
            string instanceIpAndPort;
            int? instanceId;

            if (!useLocalInstance)
            {
                //  Works with EC2 instances.
                instanceId = FindUnderloadedInstance(out instanceIpAndPort);
                if (instanceId == null)
                {
                    //  Starts a new instance.
                    var ec2InstanceId = StartNewInstance();
                    try
                    {
                        //  Gets instance domain and port.
                        instanceIpAndPort = GetInstanceDomain(ec2InstanceId);
                        //  Adds the instance data to the database.
                        instanceId = AddInstanceToDatabase(maxTaskNumber, instanceIpAndPort, instanceUserName,
                                                           instancePassword, ec2InstanceId, baseVideoProxyPort);
                        if (instanceId == null)
                            throw new Exception("A new instance can't be added to the database.");
                    }
                    catch
                    {
                        StopInstance(ec2InstanceId);
                        throw;
                    }
                }
            }
            else
            {
                //  Works with local instance.
                instanceIpAndPort = GetLocalInstanceDomain();

                instanceId = FindLocalInstance();
                if (instanceId == null)
                {
                    //  Adds the instance data to the database.
                    instanceId = AddInstanceToDatabase(maxTaskNumber, instanceIpAndPort, instanceUserName,
                                                       instancePassword, LocalInstanceId, baseVideoProxyPort);
                    if (instanceId == null)
                        throw new Exception("A new instance can't be added to the database.");
                }
            }
            int videoProxyPort;
            var task = GetUnassignedProxyPort((int)instanceId, out videoProxyPort);

            //  Adds task identifier to the database before sending request to the starting application.
            //  evernote:///view/14501366/s132/0bf04101-3cd3-4b79-a579-a0cbdae980ba/0bf04101-3cd3-4b79-a579-a0cbdae980ba/
            MarkTaskAsRunning(task, taskId);
            _log.AddMessage("Try to start task at " + instanceIpAndPort);

            //  Adds the task to the instance.
            _instanceClient.StartTask(new CreateTaskModel
                {
                    TaskId = taskId,
                    FragmentLength = fragmentLength,
                    PortalDomain = portalDomain,
                    PortalPort = portalPort,
                    PortalUserName = portalUserName,
                    PortalPassword = portalPassword,
                    SourceDomain = sourceDomain,
                    SourcePort = sourcePort,
                    Template = xmlTemplate,
                    VideoProxyPort = videoProxyPort,
                    //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
                    OperationId = commandId.ToString()
                },
                instanceIpAndPort
                );
        }

        public void StartTaskWithCallback(Guid taskId, int fragmentLength, string sourceDomain, int sourcePort,
            string xmlTemplate, string instanceUserName, string instancePassword, int maxTaskNumber,
            string portalDomain, int portalPort, string portalUserName, string portalPassword, int baseVideoProxyPort,
            Guid commandId, bool useLocalInstance = false, int instancePort = 80)
        {
            //  Updates command results (must be always last stage).
            try
            {
                StartTask(taskId, fragmentLength, sourceDomain, sourcePort,
                    xmlTemplate, instanceUserName, instancePassword, maxTaskNumber,
                    portalDomain, portalPort, portalUserName, portalPassword, baseVideoProxyPort,
                    commandId, useLocalInstance, instancePort);

                PortalClient.UpdateCommandResult(commandId, "Success.", portalDomain, portalPort, true);
            }
            catch(Exception e)
            {
                //  Stops the task in the case of failure.
                StopTask(taskId);
                PortalClient.UpdateCommandResult(commandId, e.Message +  
                    (e.InnerException != null ? "; inner: " + e.InnerException.Message : ""), portalDomain, portalPort, false);
                throw;
            }
        }

        public void StopTask(Guid taskId, Guid? commandId = null)
        {
            //  Searches for an instance which is running the task.
            var ipAndPort = _taskRepository.GetIpAndPortOfTaskInstance(taskId);
            //  Send command to the instance to stop the task.
            if (ipAndPort != string.Empty)
                _instanceClient.StopTask(taskId, ipAndPort, commandId);
            else
            {
                //  If there is not any task with such identifier then write a message into the log.
                //  This is not an error but definitely the warning.
                //  evernote:///view/14501366/s132/155ccd45-4ea5-47e6-a9df-8f9abf34c17a/155ccd45-4ea5-47e6-a9df-8f9abf34c17a/
                _log.AddMessage("Task with identifier " + taskId + " was not found.");
            }
        }

        /// <summary>
        /// Stops the task.
        /// </summary>
        /// <param name="taskId">Task identifier.</param>
        /// <param name="portalDomain">Portal (main application) domain to send message about result of the operation.</param>
        /// <param name="portalPort">Portal port.</param>
        /// <param name="commandId">Current operation identifier obtained from the portal.</param>
        public void StopTaskWithCallback(Guid taskId, string portalDomain, int portalPort, Guid commandId)
        {
            try
            {
                //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
                StopTask(taskId, commandId);
                PortalClient.UpdateCommandResult(commandId, "Success.", portalDomain, portalPort, true);
            }
            catch (Exception e)
            {

                PortalClient.UpdateCommandResult(commandId, ProcessLog.GetExceptionMessage(e), portalDomain, portalPort, false);
                throw;
            }
        }

        public void DeleteTask(Guid taskId)
        {
            _log.AddMessage("Task with identifier " + taskId + " is deleted.");
            _taskRepository.DeleteTask(taskId);
        }
    }
}
