using System;
using System.Web.Mvc;

namespace web.Controllers
{
    public partial class HomeController
    {
        //  this method is used from chart set updating JScript
        public ActionResult RenderSrc(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RenderSrcUnauthorized(id, width, height, "Home");
        }

        public override ActionResult About()
        {
            return RedirectToAction("About", "HomeBase");
        }
    }
}
