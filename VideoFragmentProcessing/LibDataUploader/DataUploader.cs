using System;
using System.Globalization;
using System.IO;
using System.Net;

namespace LibDataUploader
{
    public class DataUploader
    {
        private readonly string _templateFileName;
        private readonly string _xmlFileName;
        private readonly string _domain;
        private readonly WebClient _client;

        private void SendRequest()
        {
            //  evernote:///view/14501366/s132/f311c96c-7c17-422d-9769-33f8f58d2986/f311c96c-7c17-422d-9769-33f8f58d2986/
            //  evernote:///view/14501366/s132/da087456-f927-44a1-836c-1faa6b8f52f7/da087456-f927-44a1-836c-1faa6b8f52f7/
            _client.UploadFile("http://" + _domain + "/Data/Upload", _xmlFileName);
        }

        /// <summary>
        /// Constructs object.
        /// </summary>
        /// <param name="templateFileName">The name of XML-template file, obtained from service.</param>
        /// <param name="xmlFileName">The name of temporary XML-file.</param>
        /// <param name="domain">The domain name of service.</param>
        public DataUploader(string templateFileName, string xmlFileName, string domain)
        {
            _templateFileName = templateFileName;
            _xmlFileName = xmlFileName;
            _domain = domain;

            _client = new WebClient {Proxy = WebRequest.DefaultWebProxy};
            //  this is to proxy pass through
            _client.Proxy.Credentials = CredentialCache.DefaultCredentials;
        }

        /// <summary>
        /// Uploads URL into the portal database.
        /// evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
        /// </summary>
        /// <param name="url">URL to the recorded video fragment.</param>
        public void Upload(string url)
        {
            Upload(url, "");
        }

        /// <summary>
        /// Uploads URL into the portal database with the "serie" identifier.
        /// evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
        /// </summary>
        /// <param name="url">URL to the recorded video fragment (or file name).</param>
        /// <param name="serieId">Unique identifier of the fragment.</param>
        public void Upload(string url, string serieId)
        {
            var r = File.OpenText(_templateFileName);
            var template = r.ReadToEnd();
            var now = DateTime.Now;

            //  evernote:///view/14501366/s132/cfb9a2c1-1378-49b9-9b62-19a6b496db70/cfb9a2c1-1378-49b9-9b62-19a6b496db70/
            template = template.ToLower();
            template = template.Replace("@@value_url_to_video@@", "0");         //  All fields must be filled.
            template = template.Replace("@@string_value_url_to_video@@", url);
            template = template.Replace("@@status_url_to_video@@", "0");
            template = template.Replace("@@units_url_to_video@@", serieId);
            template = template.Replace("@@year_url_to_video@@", now.Year.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@month_url_to_video@@", now.Month.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@day_of_month_url_to_video@@", now.Day.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@day_of_week_url_to_video@@", now.DayOfWeek.ToString());
            template = template.Replace("@@hour_url_to_video@@", now.Hour.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@minute_url_to_video@@", now.Minute.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@second_url_to_video@@", now.Second.ToString(CultureInfo.InvariantCulture));
            template = template.Replace("@@hundredths_of_second_url_to_video@@", (now.Millisecond / 10).ToString(CultureInfo.InvariantCulture));

            File.WriteAllText(_xmlFileName, template);
            SendRequest();
        }
    }
}