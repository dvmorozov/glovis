using System;
using System.Collections.Generic;
using OAuth;
using System.Web.Mvc;
using System.Xml.XPath;
using web.Models;

namespace web.Controllers
{
    public class HomeController : HomeControllerBase
    {
        public override Guid GetUserID()
        {
            return new Guid("4D3CA3B7-D41F-41DA-89A3-E0BBD7693775");
        }

        public ActionResult Index()
        {
            try
            {
                ViewBag.twits = GetOonzeTwits();
                // ViewBag.Title is filling in the ancestor
                ViewBag.Message = (String)ViewBag.Title + "!";

                long id = 189;
                Guid userID = GetUserID();
                ViewChartSet v = chartSetRepository.GetChartSet(id, userID);

                List<ViewChartSetsCharts> l = chartSetsChartsRepository.GetChartSetChartsList(id, userID);
                ViewBag.ChartSetsCharts = l;

                return View(/*"Demo_Index"*/"Demo_VideoTranslation", v /*model element*/);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  this method is used from chart set updating JScript
        public ActionResult RenderSnapshot(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RenderSnapshotUnauthorized(id, width, height);
        }

        //  this method is used from chart set updating JScript
        public ActionResult RenderSrc(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RenderSrcUnauthorized(id, width, height);
        }

        protected List<TwitInfo> GetOonzeTwits()
        {
            string screen_name = "Oonze";
            string oauth_token = "606881804-S64KMQKl9J7CegmPKWTCWuh0SiYpnhBfzyVGLkQp";
            string oauth_token_secret = "40N9n8FnV4X6ytLVEpxn15H4DJMSrBS7PHcOH1dAU";
            string consumerKey = "RkEUDpxqtEE5GKQsnBHflw";
            string consumerSecret = "mJ9nnUm8KkqiTBk8bTAkXnyQgId1HmG5zxhRyWQnVs";

            OAuthBase oAuth = new OAuthBase();
            string timeStamp = oAuth.GenerateTimeStamp();
            string nonce = oAuth.GenerateNonce();
            string normUri;
            string normParams;
            Uri uri = new Uri("https://api.twitter.com/1/statuses/user_timeline.xml");
            string sig = oAuth.GenerateSignature(
                uri, consumerKey, consumerSecret, oauth_token, oauth_token_secret, "GET",
                timeStamp, nonce, OAuth.OAuthBase.SignatureTypes.HMACSHA1, out normUri, out normParams);

            string requestURL = "https://api.twitter.com/1/statuses/user_timeline.xml?" +
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

        public ActionResult ViewChart(Int64 id/*chart id.*/, int width, int height)
        {
            try
            {
                ViewChart viewchart = FillChartData(id, width, height);
                return View(viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                //  this view is showed in frame, so
                //  it should show error message by itself
                return View();
            }
        }
    }
}
