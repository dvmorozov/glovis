using System;
using System.Collections.Generic;
using LibProcessLog;

namespace LibHttpClient
{
    //  evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
    public class PortalClient : HttpClient
    {
        private static readonly ProcessLog Pl = new ProcessLog();

        private static void SendCommandResult(Guid operationId, string message, string instanceIpAndPort, bool success)
        {
            var d = new Dictionary<string, string>
                {
                    {"operationid", operationId.ToString()},
                    {"message", message},
                    {"success", success.ToString()}
                };
            SendRequest(instanceIpAndPort, "Data", "OperationResult", d);
        }

        //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
        //  Must be static to be called from an exception handler.
        public static void UpdateCommandResult(Guid? commandId, string message, string portalDomain, int portalPort, bool success)
        {
            if (commandId == null) return;
            //  Works with local instance.
            var portalIpAndPort = portalDomain + ":" + portalPort;

            //  evernote:///view/14501366/s132/e21cec04-5ec5-4eee-8869-ec55b80b606c/e21cec04-5ec5-4eee-8869-ec55b80b606c/
            Pl.AddMessage("Sends result back to the portal.");
            SendCommandResult((Guid)commandId, message, portalIpAndPort, success);
        }
    }
}