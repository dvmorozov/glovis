using System;
using System.Web.Mvc;

namespace web.Controllers
{
    public class HomeController : HomeControllerBase
    {
        public ActionResult Index()
        {
            try
            {
                // ViewBag.Title is filling in the ancestor
                ViewBag.Message = (String)ViewBag.Title + "!";

                return View("Product_Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}
