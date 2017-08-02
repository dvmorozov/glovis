using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    //  The controller implements methods for rendering video fragments.
    //  evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
    public class RenderVideoController : BaseChartController
    {
        public RenderVideoController()
        {
            SetRepository(new BaseChartRepository(), Entities);
        }

        private void SetRepository(IBaseChartRepository b, GlovisMasterBaseEntities e)
        {
            BaseChartRepository = b;
            BaseChartRepository.SetEntities(e);
        }

        public ActionResult ShowChart(Int64 id/*chart id.*/)
        {
            try
            {
                var viewChart = FillSerieList(id, GetUserId());
                return View("ShowChart", viewChart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Update(Int64 id/*chart id.*/)
        {
            try
            {
                var viewChart = FillSerieList(id, GetUserId());
                return PartialView("ShowChartTable", viewChart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult ShowSerie(Int64 id/*chart id.*/, string serieId)
        {
            try
            {
                var userId = GetUserId();
                var viewchart = BaseChartRepository.GetChart(id, userId);
                ViewBag.ChartID = viewchart.ID;
                ViewBag.Width = viewchart.Width;
                ViewBag.Height = viewchart.Height;
                ViewBag.SerieID = serieId;

                return View("ShowChart", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  Starts downloading of the fragment.
        //  evernote:///view/14501366/s132/4e63229b-4ad2-499e-adf7-9df596b40a2a/4e63229b-4ad2-499e-adf7-9df596b40a2a/
        public FileResult Download(long id /*chart id.*/, string serieId)
        {
            return Download(id, serieId, GetUserId());
        }

        [HttpPost]
        public ActionResult DeleteSerie(long id/*chart id.*/, string serieId)
        {
            BaseChartRepository.DeleteSerie(serieId, GetUserId());
            return RedirectToAction("ShowChart", "RenderVideo", new {id});
        }
    }
}
