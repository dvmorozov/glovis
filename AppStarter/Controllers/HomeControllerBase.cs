using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    public class TwitInfo
    {
        public string text;
        public string createdAt;
    }

    public class HomeControllerBase : PersonalizedController
    {
        public ActionResult About()
        {
            try
            {
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}
