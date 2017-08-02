using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Web;
using System.Net;
using System.IO;
using SeasideResearch.LibCurlNet;
using OAuth;
using System.Xml.XPath;

namespace WindowsFormsTestLibCurl
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        string user_id;
        string screen_name;

        private void button1_Click(object sender, EventArgs e)
        {
            System.IO.StreamReader file = new System.IO.StreamReader("c:\\_Projects\\oonze_twitter_keys.txt");
            screen_name = file.ReadLine();
            oauth_token = file.ReadLine();
            oauth_token_secret = file.ReadLine();
            consumerKey = file.ReadLine();
            consumerSecret = file.ReadLine();
            file.Close();

            HTTP http = new HTTP();
            http.CurlInit(); // Инициализация cURL'а 
            //CURLcode result;
            //string page = http.HTTPGet("https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=oonze&screen_name=oonze", "", out result); // URL и proxy 
            //textBox1.Text = page;

            HttpWebRequest Request;
            OAuthBase oAuth = new OAuthBase();
            timeStamp = oAuth.GenerateTimeStamp();
            nonce = oAuth.GenerateNonce();
            string normUri;
            string normParams;
            Uri uri = new Uri("https://api.twitter.com/1/statuses/user_timeline.xml");
            sig = oAuth.GenerateSignature(uri, consumerKey, consumerSecret, oauth_token, oauth_token_secret, "GET", timeStamp, nonce, OAuth.OAuthBase.SignatureTypes.HMACSHA1, out normUri, out normParams);


            string request_url = "https://api.twitter.com/1/statuses/user_timeline.xml?" +
                "screen_name=" + screen_name + 
                "&oauth_consumer_key=" + consumerKey +
                "&oauth_token=" + oauth_token + 
                "&oauth_nonce=" + nonce + 
                "&oauth_signature_method=HMAC-SHA1" +
                "&oauth_timestamp=" + timeStamp +
                "&oauth_signature=" + sig +
                "&count=20" +
                "&include_rts=true" +
                "&include_entities=true" +
                "&oauth_version=1.0";

                    
            HttpWebResponse Response;
            StreamReader Reader;

            Request = (HttpWebRequest)HttpWebRequest.Create(request_url);
            Response = (HttpWebResponse)Request.GetResponse();
            Reader = new StreamReader(Response.GetResponseStream(), Encoding.GetEncoding(1251));
            outline = Reader.ReadToEnd();
            
            XPathDocument xmldoc = new XPathDocument(request_url);
            XPathNavigator nav = xmldoc.CreateNavigator();

            foreach (XPathNavigator status in nav.Select("statuses/status"))
            {
                textBox1.Text += status.SelectSingleNode("text").Value + "\n";
            }
        }

        string oauth_token;
        string oauth_token_secret;
        string oauth_callback_confirmed;
        string consumerKey;
        string consumerSecret;
        string timeStamp;
        string nonce;
        string sig;
        string outline;
        char[] delimiterChars = { '&', '=' };

        private void button2_Click(object sender, EventArgs e)
        {
            /*
            string key = HttpUtility.UrlEncode("mJ9nnUm8KkqiTBk8bTAkXnyQgId1HmG5zxhRyWQnVs&");
            HMACSHA1 hmac = new HMACSHA1(System.Text.Encoding.ASCII.GetBytes(key));

            int unixTime = (int)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalSeconds;

            byte[] bytes = new byte[8];
            Random rnd = new Random();
            rnd.NextBytes(bytes);
            ulong salt = BitConverter.ToUInt64(bytes, 0);
            //string s1 = salt.ToString();
            string saltString = "4572616e48616d6d65724c61686176";

            string dataString = "GET&" +
                    HttpUtility.UrlEncode("https://api.twitter.com/oauth/request_token") + "&" +
                    HttpUtility.UrlEncode("oauth_consumer_key=RkEUDpxqtEE5GKQsnBHflw"
                    + "&oauth_nonce=" + saltString
                    + "&oauth_signature_method=HMAC-SHA1" 
                    + "&oauth_timestamp=" + unixTime.ToString()
                    + "&oauth_version=1.0");
            
            byte[] hashValue = hmac.ComputeHash(System.Text.Encoding.ASCII.GetBytes(dataString));
            string hashString = Convert.ToBase64String(hashValue);

            HTTP http = new HTTP();
            http.CurlInit(); // Инициализация cURL'а 
            string url = HttpUtility.UrlEncode("https://api.twitter.com/oauth/request_token?" +
                //"Authorization: OAuth realm=http://api.twitter.com/" + 
                //"&"
            "oauth_consumer_key=RkEUDpxqtEE5GKQsnBHflw" + 
                "&oauth_signature_method=HMAC-SHA1" +
                "&oauth_timestamp=" + unixTime.ToString() + 
                "&oauth_nonce=" + saltString +
                "&oauth_version=1.0" +
                "&oauth_signature=" + hashString
                );

            CURLcode result;
            string page = http.HTTPGet(url, "", out result); // URL и proxy 
            textBox1.Text = page;
             */ 

            // Создадим три переменные и присвоим им значения данных полученных на сайте твиттера:
            Uri uri = new Uri("http://api.twitter.com/oauth/request_token");
            consumerKey = "RkEUDpxqtEE5GKQsnBHflw";
            consumerSecret = "mJ9nnUm8KkqiTBk8bTAkXnyQgId1HmG5zxhRyWQnVs";
            // Теперь нам нужно сгенерировать значения оставшихся переменных и именно для этого нам нужен будет класс OAuthBase
            OAuthBase oAuth = new OAuthBase();
            // Генерация необходимых данных
            timeStamp = oAuth.GenerateTimeStamp();
            nonce = oAuth.GenerateNonce();
            string normUri;
            string normParams;
            sig = oAuth.GenerateSignature(uri, consumerKey, consumerSecret, string.Empty, string.Empty, "GET", timeStamp, nonce, OAuth.OAuthBase.SignatureTypes.HMACSHA1, out normUri, out normParams);
            // Формирование и вывод строки запроса
            string request_url = 
                "http://api.twitter.com/oauth/request_token"+"?" +
                "oauth_consumer_key=" + consumerKey + "&" +
                "oauth_signature_method=" + "HMAC-SHA1" + "&" +
                "oauth_signature=" + sig + "&" +
                "oauth_timestamp=" + timeStamp + "&" +
                "oauth_nonce=" + nonce + "&" +
                "oauth_version=" + "1.0";
            //Console.WriteLine("Req: " + request_url); // Выводим строку на экран
            //Console.WriteLine("--------------------------------------------------------");
            // Запрос на сервер    
            HttpWebRequest Request = (HttpWebRequest) HttpWebRequest.Create(request_url);
            HttpWebResponse Response = (HttpWebResponse)Request.GetResponse();      
            StreamReader Reader = new StreamReader(Response.GetResponseStream(), Encoding.GetEncoding(1251));
            outline = Reader.ReadToEnd();  
            //Console.WriteLine("Out: " + outline);
            //Console.WriteLine("--------------------------------------------------------");
            // Разбор выданной строки
        
            string[] words = outline.Split(delimiterChars);
            oauth_token = words[1];
            oauth_token_secret = words[3];
            oauth_callback_confirmed = words[5];
            // Вывод поллученных данных  
            //Console.WriteLine("oauth_token = " + oauth_token);  
            //Console.WriteLine("oauth_token_secret = " + oauth_token_secret);  
            //Console.WriteLine("oauth_callback_confirmed = " + oauth_callback_confirmed);
            //Console.WriteLine("--------------------------------------------------------");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // Строка открыв которую в браузере пользователю предложат открыть доступ к его учётке для приложения
            // При положительном ответе на экран ивыдадут PIN код который надо вбить в приложении
            string request_url = "http://api.twitter.com/oauth/authorize?oauth_token=" + oauth_token;
            //Console.WriteLine("Req: " + request_url);
            //Console.WriteLine("--------------------------------------------------------");
            System.Diagnostics.Process.Start(request_url); // Передаём ссылку на страницу браузеру по умолчанию и ждём пока пользователь введёт PIN-код
            //Console.Write("Enter PIN: ");
            //string oauth_verifier = Console.ReadLine(); // oauth_verifier — это полученный нами PIN-код.
            //Console.WriteLine("--------------------------------------------------------");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string oauth_verifier = pin.Text;
            // Формирование и вывод строки запроса
            string request_url =
              "http://api.twitter.com/oauth/access_token" + "?" +
              "oauth_consumer_key=" + consumerKey + "&" +
              "oauth_token=" + oauth_token + "&" +
              "oauth_signature_method=" + "HMAC-SHA1" + "&" +
              "oauth_signature=" + sig + "&" +
              "oauth_timestamp=" + timeStamp + "&" +
              "oauth_nonce=" + nonce + "&" +
              "oauth_version=" + "1.0" + "&" +
              "oauth_verifier=" + oauth_verifier;
            //Console.WriteLine("Req: " + request_url);
            //Console.WriteLine("--------------------------------------------------------");
            StreamReader Reader;
            HttpWebRequest Request;
            HttpWebResponse Response;
            // Запрос на сервер
            Request = (HttpWebRequest)HttpWebRequest.Create(request_url);
            Response = (HttpWebResponse)Request.GetResponse();
            Reader = new StreamReader(Response.GetResponseStream(), Encoding.GetEncoding(1251));
            outline = Reader.ReadToEnd();
            //Console.WriteLine("Out: " + outline);
            //Console.WriteLine("--------------------------------------------------------");
            // Разбор выданной строки и присвоение значений соответствующим переменным
            string[] words = outline.Split(delimiterChars);
            oauth_token = words[1];
            oauth_token_secret = words[3];
            user_id = words[5];
            screen_name = words[7];
            // Вывод полученных данных  
            //Console.WriteLine("oauth_token = " + oauth_token);
            //Console.WriteLine("oauth_token_secret = " + oauth_token_secret);
            //Console.WriteLine("user_id = " + user_id);
            //Console.WriteLine("screen_name = " + screen_name);
            
            System.IO.StreamWriter file = new System.IO.StreamWriter("c:\\_Projects\\oonze_twitter_keys.txt");
            file.WriteLine(screen_name);
            file.WriteLine(oauth_token);
            file.WriteLine(oauth_token_secret);
            file.WriteLine(consumerKey);
            file.WriteLine(consumerSecret);
            file.Close();
        }
    }
}
