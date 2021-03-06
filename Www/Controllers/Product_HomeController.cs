﻿
using System.Web.Mvc;
using System;
using System.Web.Security;

namespace web.Controllers
{
    public partial class HomeController : HomeBaseController
    {

        public HomeController()
        {
        }

        //  evernote:///view/14501366/s132/f3b75741-2872-43c8-8eae-4733e79625f9/f3b75741-2872-43c8-8eae-4733e79625f9/
        public ActionResult Index()
        {
            try
            {
                // ViewBag.Title is filled in the ancestor
                ViewBag.Message = (String)ViewBag.Title + "!";

                if (Roles.IsUserInRole(User.Identity.Name, "Administrator") ||
                    Roles.IsUserInRole(User.Identity.Name, "User"))
                {
                    return RedirectToAction("Index", "Device");
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
