using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;

namespace LibHttpClient
{
    public class InstanceClient : HttpClient
    {
        /// <summary>
        /// Starts the task by sending a request to the instance.
        /// </summary>
        /// <param name="taskModel">The set of parameters for HTTP-request.</param>
        /// <param name="instanceIpAndPort">Instance IP accompanied with a port number.</param>
        public void StartTask(CreateTaskModel taskModel, string instanceIpAndPort)
        {
            var d = new Dictionary<string, string>
                {
                    {"fragmentlength", taskModel.FragmentLength.ToString(CultureInfo.InvariantCulture)},
                    {"portaldomain", taskModel.PortalDomain},
                    {"portalport", taskModel.PortalPort.ToString(CultureInfo.InvariantCulture)},
                    {"portalusername", taskModel.PortalUserName},
                    {"portalpassword", taskModel.PortalPassword},
                    {"sourcedomain", HttpUtility.UrlEncode(StringCompressor.CompressString(taskModel.SourceDomain))},
                    {"sourceport", taskModel.SourcePort.ToString(CultureInfo.InvariantCulture)},
                    {"taskid", taskModel.TaskId.ToString()},
                    {"template", HttpUtility.UrlEncode(StringCompressor.CompressString(taskModel.Template))},
                    {"videoproxyport", taskModel.VideoProxyPort.ToString(CultureInfo.InvariantCulture)},
                    //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
                    {"operationid", taskModel.OperationId}
                };
            SendRequest(instanceIpAndPort, "Task", "CreateJ", d);
        }

        public void StopTask(Guid taskId, string instanceIpAndPort, Guid? commandId = null)
        {
            var d = new Dictionary<string, string>
                {
                    {"taskid", taskId.ToString()}
                };
            //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
            if(commandId != null)
                d.Add("operationid", ((Guid)commandId).ToString());
            SendRequest(instanceIpAndPort, "Task", "StopJ", d);
        }

        public void DeleteTask()
        {
        }
    }
}
