using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;

namespace LibAppStarter
{
    public class AppStarterRequestor
    {
        /// <summary>
        /// Domain (or IP) and port of the AppStarter application.
        /// </summary>
        private readonly string _appStarterUrl;
        private readonly string _userName;
        private readonly string _password;
        //private WebClient _client;
        private HttpWebRequest _request;
        private CookieContainer _cookie;

        public AppStarterRequestor(string appStarterUrl, string userName, string password)
        {
            _appStarterUrl = appStarterUrl;
            _userName = userName;
            _password = password;
            _cookie = new CookieContainer();
        }

        /// <summary>
        /// Sends authentication request.
        /// </summary>
        private void Authenticate()
        {
            /*
            var strLogOn = "username=" + _userName + "&password=" + _password + "&rememberme=false&returnUrl=\"\"";
            //  Resets previous request.
            _client = null;
            MakePostRequest(_appStarterUrl + "/Account/LogOn", strLogOn, new NameValueCollection() { { "username", _userName }, { "password", _password }, { "rememberme", "false" }, { "returnurl", "" } });
            */
        }

        private void LogOut()
        {
        }

        /// <summary>
        /// Makes POST request.
        /// </summary>
        /// <param name="url">Absolute URL to make a request.</param>
        /// <param name="content">Content of the request.</param>
        private void MakePostRequest(string url, NameValueCollection collection)
        {
            
            StreamWriter myWriter = null;

            //  Creates a new object when pass for the first time.
            //if(_request == null)
            //  Повторное изменение свойств объекта ниже приводит к ошибке.
                _request = (HttpWebRequest)WebRequest.Create(url);

            //  _request.Credentials = new NetworkCredential(username, password);
            //CredentialCache ch = new CredentialCache();
            //ch.Add(new Uri(url), "Basic", new NetworkCredential(_userName, _password));

            string content = string.Empty;
            for (var i = 0; i < collection.Count; i++)
            {
                content += collection.GetKey(i) + "=" + collection.Get(i);
                if (i < collection.Count - 1) content += "&";
            }

            _request.Method = "POST";
            _request.ContentLength = content.Length;
            _request.ContentType = "application/x-www-form-urlencoded";
            //_request.CookieContainer = _cookie;
            //_request.Credentials = ch;
            //_request.Headers["Authorization"] = "Basic " + Convert.ToBase64String(Encoding.Default.GetBytes(_userName + ":" + _password));

            _request.PreAuthenticate = true;

            try
            {
                myWriter = new StreamWriter(_request.GetRequestStream());
                myWriter.Write(content);
            }
            finally
            {
                if (myWriter != null) myWriter.Close();
            }

            /*
            //  Выводд принятого текста в консоль для проверки.
            var response = _request.GetResponse();
            var rStream = response.GetResponseStream();
            if (rStream != null)
                using (var streamReader = new StreamReader(rStream))
                {
                    Console.WriteLine(streamReader.ReadToEnd());
                }
             */

            /*
            if (_client == null)
                _client = new WebClient();

            _client.Credentials = //CredentialCache.DefaultCredentials;
                new NetworkCredential(_userName, _password); 
            _client.Proxy = WebRequest.DefaultWebProxy;
            //  Сервер не принимает запрос, переданный с помощью UploadString. UploadValues воспринимается!
            _client.UploadValues(url, collection);
             */
        }

        /// <summary>
        /// Creates a new task.
        /// </summary>
        /// <param name="taskId">Unique task identifier for subsequent reference.</param>
        /// <param name="config">XML configuration data for the task.</param>
        /// <param name="template">XML template for the task to upload data back to the main application (portal).</param>
        public void CreateTask(Guid taskId, string config, string template)
        {
            Authenticate();

            MakePostRequest(_appStarterUrl + "/Task/Create", new NameValueCollection() { { "taskid", taskId.ToString() }, { "config", config }, { "template", template } });

            LogOut();
        }

        public void DeleteTask(Guid taskId)
        {
            Authenticate();

            MakePostRequest(_appStarterUrl + "/Task/Delete", new NameValueCollection() { { "taskid", taskId.ToString() } });

            LogOut();
        }

        public void EditTask(Guid taskId, string process, bool running, bool terminated)
        {
            Authenticate();

            MakePostRequest(_appStarterUrl + "/Task/Edit", new NameValueCollection() { { "taskid", taskId.ToString() }, { "process", process }, { "running", running.ToString() }, { "terminated", terminated.ToString() } });

            LogOut();
        }

        public void GetTaskList()
        {
            Authenticate();

            MakePostRequest(_appStarterUrl + "/Task/Index", new NameValueCollection());

            LogOut();
        }
    }
}
