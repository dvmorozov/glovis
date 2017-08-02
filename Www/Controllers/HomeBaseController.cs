using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    public class TwitInfo
    {
        public string Text;
        public string CreatedAt;
    }

    //  evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
    public class HomeBaseController : BaseChartController
    {
        protected IStatRepository StatRepository;

        private void SetRepository(IStatRepository statRepository, GlovisMasterBaseEntities e)
        {
            StatRepository = statRepository;
            StatRepository.SetEntities(e);
        }

        public HomeBaseController() 
        {
            SetRepository(new StatRepository(), Entities);
        }

        public HomeBaseController(IStatRepository statRepository)
        {
            SetRepository(statRepository, null);
        }

        public virtual ActionResult About()
        {
            try
            {
                return View("About");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}
