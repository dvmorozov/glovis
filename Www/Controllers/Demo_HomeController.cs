using System;
using System.Web.Mvc;
#if _DEMO
using System.Collections.Specialized;
using System.Configuration;
using LibProcessLog;
#endif

namespace web.Controllers
{
    public partial class HomeController
    {
        //  https://www.evernote.com/shard/s132/nl/14501366/a4abd7f9-c6ec-4a1d-a267-7c97e517d977
#if _DEMO
        private readonly Guid _userId = new Guid("4D3CA3B7-D41F-41DA-89A3-E0BBD7693775"); //  demo user id

        private long _chartId;          //  demo chart id
        private long _chartSetId;

        private void ReadConfiguration()
        {
            var appSettings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            _chartId = long.Parse(appSettings["DemoChartId"]);
            _chartSetId = long.Parse(appSettings["DemoChartSetId"]);
        }

        public ActionResult Index()
        {
            try
            {
                StatRepository.IncStatCount("Home\\Index");
                /*
                try
                {
                    ViewBag.Twits = GetOonzeTwits();
                }
                catch(Exception e) 
                {
                    // Creates an empty list to avoid futher exceptions.
                    ViewBag.Twits = new List<TwitInfo>();
                }
                */
                // ViewBag.Title is filling in the ancestor
                ViewBag.Message = (String)ViewBag.Title + "!";

                var v = FillVideoMatrixData(_chartSetId, _userId);
                return View("Index", v /*model element*/);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Features()
        {
            try
            {
                return View("Features");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Components()
        {
            try
            {
                return View("Components");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult UseCases()
        {
            try
            {
                return View("UseCases");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CurrentState()
        {
            try
            {
                return View("CurrentState");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public JsonResult PollAnswer(string option)
        {
            var result = new JsonReturn();
            try
            {
                StatRepository.IncStatCount(option);

                result.Success = true;
                result.Message = "Ok.";
            }
            catch (Exception e)
            {
                result.Success = false;
                result.Message = "Exception: " + ProcessLog.GetExceptionMessage(e);
            }
            return new JsonResult { Data = result };
        }

        //  Must be named "ShowChart" to be suitable for common updating script.
        //  https://www.evernote.com/shard/s132/nl/14501366/a4abd7f9-c6ec-4a1d-a267-7c97e517d977
        public ActionResult ShowChart()
        {
            try
            {
                var v = BaseChartRepository.GetChart(_chartId, _userId);
                ViewBag.ChartID = v.ID;
                ViewBag.Width = v.Width;
                ViewBag.Height = v.Height;

                if (v.ChartType.Trim().ToLower() == Video.ToLower())
                {
                    //  Must be named "ShowChart" to be suitable for common updating script.
                    return View("ShowChart", v);
                }
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/a4abd7f9-c6ec-4a1d-a267-7c97e517d977
        public ActionResult Update()
        {
            try
            {
                var viewChart = FillSerieList(_chartId, _userId);
                return PartialView("ShowChartTable", viewChart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/a4abd7f9-c6ec-4a1d-a267-7c97e517d977
        public ActionResult DeleteSerie(long id/*chart id.*/, string serieId)
        {
            BaseChartRepository.DeleteSerie(serieId, _userId);
            return RedirectToAction("ShowChart", "Home");
        }

        //  Starts downloading of the fragment.
        //  https://www.evernote.com/shard/s132/nl/14501366/a4abd7f9-c6ec-4a1d-a267-7c97e517d977
        public FileResult Download(long id /*chart id.*/, string serieId)
        {
            return Download(_chartId, serieId, _userId);
        }

        public ActionResult Demo_Matrix()
        {
            try
            {
                var v = FillVideoMatrixData(_chartSetId, _userId);
                return View("Demo_Matrix", v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Demo()
        {
            return View("Demo");
        }
#endif

        //  this method is used from chart set updating JScript
        public ActionResult RenderSrc(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RenderSrcUnauthorized(id, width, height, "Home");
        }

        /*
        protected List<TwitInfo> GetOonzeTwits()
        {
            string screen_name = "oonze_news";
            string oauth_token = "458565546-YhXyP5DtCFP11iYSq9zlPM9MZIJvxJo12XQhSbtH";
            string oauth_token_secret = "Dn0BDK6iNSECEO5iNEinyaeD8bB28WgjNOuEms9CcUk";
            string consumerKey = "RkEUDpxqtEE5GKQsnBHflw";
            string consumerSecret = "mJ9nnUm8KkqiTBk8bTAkXnyQgId1HmG5zxhRyWQnVs";

            OAuthBase oAuth = new OAuthBase();
            string timeStamp = oAuth.GenerateTimeStamp();
            string nonce = oAuth.GenerateNonce();
            string normUri;
            string normParams;
            Uri uri = new Uri("https://api.twitter.com/1.1/statuses/user_timeline.xml");
            string sig = oAuth.GenerateSignature(
                uri, consumerKey, consumerSecret, oauth_token, oauth_token_secret, "GET",
                timeStamp, nonce, OAuth.OAuthBase.SignatureTypes.HMACSHA1, out normUri, out normParams);

            string requestURL = "https://api.twitter.com/1.1/statuses/user_timeline.xml?" +
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

            XPathDocument xmldoc = new XPathDocument(requestURL);
            XPathNavigator nav = xmldoc.CreateNavigator();

            List<TwitInfo> twits = new List<TwitInfo>();

            foreach (XPathNavigator status in nav.Select("statuses/status"))
            {
                TwitInfo ti = new TwitInfo();
                ti.text = status.SelectSingleNode("text").Value;
                ti.createdAt = status.SelectSingleNode("created_at").Value;

                twits.Add(ti);
            }
            return twits;
        }
        */

        public override ActionResult About()
        {
            return RedirectToAction("About", "HomeBase");
        }
    }
}
