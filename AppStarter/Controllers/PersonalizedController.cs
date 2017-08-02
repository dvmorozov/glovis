using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using web.Models;
using System.Diagnostics;
using System.Transactions;

namespace web.Controllers
{
    public class PersonalizedController : Controller
    {
        public void ExceptionMessageToViewBag(Exception e)
        {
            ViewBag.ExceptionMessage = e.InnerException != null ? e.InnerException.Message : e.Message;
        }

        //  the method fills ViewBag with application name
        protected override void OnActionExecuting(ActionExecutingContext ctx)
        {
            String appName1, appName2;

            appName1 = "APP STARTER";
            appName2 = "";

            ViewBag.AppName = appName1 + " " + appName2;
            ViewBag.AppName1 = appName1;
            ViewBag.AppName2 = appName2;
            ViewBag.Title = "Welcome " + (String)ViewBag.AppName;
        }

        public virtual Guid GetUserID()
        {
            if (User != null)
            {   //  check for unit-testing mode
                MembershipUser mu = Membership.GetUser(User.Identity.Name);
                if (mu != null)
                {
                    return (Guid)mu.ProviderUserKey;
                }
                else
                {
                    Guid g = new Guid();
                    return g;
                }
            }
            else
            {
                Guid g = new Guid();
                return g;
            }
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}