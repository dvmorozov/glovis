using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    public class DownloadsController : Controller
    {
        protected IStatRepository StatRepository;
        protected GlovisMasterBaseEntities Entities;

        private void SetRepository(
            IStatRepository statRepository, GlovisMasterBaseEntities e)
        {
            StatRepository = statRepository;
            StatRepository.SetEntities(e);
        }

        public DownloadsController() 
        {
            SetRepository(
                new StatRepository(), Entities);
        }

        public DownloadsController(
            IStatRepository statRepository)
        {
            SetRepository(statRepository, null);
        }

        //  evernote:///view/14501366/s132/28e81751-18e7-4086-95d5-2b5d95d70e64/28e81751-18e7-4086-95d5-2b5d95d70e64/
        public FilePathResult ProvisionalPatentApplication()
        {
            StatRepository.IncStatCount("Downloads\\ProvisionalPatentApplication");

            return
                new FilePathResult(
                    "~/Downloads/The technology to improve protection of private data for using in visual surveillance systems.pdf",
                    "application/pdf");
        }

        public ActionResult Index()
        {
            throw new System.NotImplementedException();
        }
    }
}
