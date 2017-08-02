using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using LibProcessLog;

namespace LibHttpClient
{
    //  evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
    public class HttpClient
    {
        private static readonly ProcessLog Pl = new ProcessLog();

        protected static void SendRequest(string instanceIpAndPort, string controller, string method, Dictionary<string, string> parameters)
        {
            var reqStr = "http://" + instanceIpAndPort + "/" + controller + "/" + method;
            var parStr = "";

            var i = 0;
            foreach (var p in parameters)
            {
                parStr += p.Key + "=" + p.Value;
                if (i++ < parameters.Count()) { parStr += "&"; }
            }

            Pl.AddMessage("Request: " + reqStr);
            Pl.AddMessage("Parameters: " + parStr);

            // ReSharper disable AssignNullToNotNullAttribute
            // Create a request using a URL that can receive a post. 
            var r = reqStr + "?" + parStr;
            var request = WebRequest.Create(
                // This code throws an exception.
                // For more information see this "evernote:///view/14501366/s132/0a1be4fa-7d10-4537-b81b-50583814c9bc/0a1be4fa-7d10-4537-b81b-50583814c9bc/".
                //HttpUtility.UrlEncode(r)
                // This encodes only path part of the URL (no exception).
                //HttpUtility.UrlPathEncode(r)
                r
                );
            // ReSharper restore AssignNullToNotNullAttribute
            //  this is to proxy pass through
            request.Proxy = WebRequest.DefaultWebProxy;
            request.Proxy.Credentials = CredentialCache.DefaultCredentials;
            // Sets the Method property of the request to POST.
            request.Method = "POST";
            // This is required. Otherwise - error message.
            request.ContentLength = 0;

            // Gets the response.
            var response = request.GetResponse();

            // Displays the status.
            Pl.AddMessage("HTTP status: " + ((HttpWebResponse)response).StatusDescription);
            // Gets the stream containing content returned by the server.
            var dataStream = response.GetResponseStream();
            // Opens the stream using a StreamReader for easy access.
            if (dataStream != null)
            {
                // Tries to deserialize JSON-object.
                // evernote:///view/14501366/s132/a42a53cf-6930-4d3d-9a88-3da81a3fc880/a42a53cf-6930-4d3d-9a88-3da81a3fc880/
                var ser = new DataContractJsonSerializer(typeof(JsonReturn));
                var result = (JsonReturn)ser.ReadObject(dataStream);
                dataStream.Close();

                if(!result.Success)
                    //  Must create an exception to intterupt the process. 
                    throw new Exception(result.Message);
            }
            response.Close();
        }
    }
}
