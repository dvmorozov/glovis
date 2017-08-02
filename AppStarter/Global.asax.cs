using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        public void Application_Error(object sender, EventArgs e)
        {
            string mess = "Error in Path :" + Request.Path;                         //Get the path of the page
            mess += "\n\n Error Raw Url :" + Request.RawUrl;                        //Get the QueryString along with the Virtual Path

            //Create an Exception object from the Last error that occurred on the server
            var myError = Server.GetLastError();

            mess += "\n\n Error Message :" + myError.Message;                       //Get the error message
            mess += "\n\n Error Source :" + myError.Source;                         //Source of the message
            mess += "\n\n Error Stack Trace :" + myError.StackTrace;                //Stack Trace of the error
            mess += "\n\n Error TargetSite :" + myError.TargetSite;                 //Method where the error occurred

            try
            {
                var myLog = new System.Diagnostics.EventLog { Source = "AppStarter" };  //Create a new EventLog object
                myLog.WriteEntry(mess, System.Diagnostics.EventLogEntryType.Error);     //Write the log
            }
// ReSharper disable EmptyGeneralCatchClause
            catch
// ReSharper restore EmptyGeneralCatchClause
            {
                //  Blocks all possible internal exceptions.
                //  evernote:///view/14501366/s132/fd4b3235-6d27-4985-a2de-57fac9839fe4/fd4b3235-6d27-4985-a2de-57fac9839fe4/
            }
        }
    }
}