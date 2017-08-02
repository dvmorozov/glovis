using System;
using System.Web.Mvc;
using System.Web.Security;

namespace web.Controllers
{
    public class HomeController : HomeControllerBase
    {
        public ActionResult Index()
        {
            try
            {
                // ViewBag.Title is filled in the ancestor
                ViewBag.Message = (String)ViewBag.Title + "!";

                if (Roles.IsUserInRole(User.Identity.Name, "Administrator") ||
                    Roles.IsUserInRole(User.Identity.Name, "User"))
                {
                    return RedirectToAction("Index", "Task");
                }
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
