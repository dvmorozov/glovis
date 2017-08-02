using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class ChartSetChartsController : PersonalizedController
    {
        private IChartSetChartsRepository _chartSetsChartsRepository;
        private IChartSetRepository _chartSetRepository;

        private void SetRepository(IChartSetChartsRepository r, IChartSetRepository r1, GlovisMasterBaseEntities e)
        {
            _chartSetsChartsRepository = r;
            _chartSetsChartsRepository.SetEntities(e);
            _chartSetRepository = r1;
            _chartSetRepository.SetEntities(e);
        }

        public ChartSetChartsController() 
        {
            SetRepository(new ChartSetChartsRepository(), new ChartSetRepository(), Entities);
        }

        public ChartSetChartsController(IChartSetChartsRepository r, IChartSetRepository r1)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, r1, null);
        }

        //
        // GET: /ControllerChartSetCharts/

        public ViewResult Index(Int64 id/*chart set id.*/)
        {
            try
            {
                var userId = GetUserId();
                var v = _chartSetRepository.GetChartSet(id, userId);

                ViewBag.ChartSetName = v.Name;
                ViewBag.ChartSetID = v.ID;
                return View(_chartSetsChartsRepository.GetChartSetChartsList(id, userId));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(Int64 id/*chart set id*/, Int64 chartId)
        {
            try
            {
                var viewchartsetscharts = _chartSetsChartsRepository.GetChartSetChart(id, chartId, GetUserId());
                return View(viewchartsetscharts);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Edit(Int64 id/*chart set id*/, Int64 chartId)
        {
            try
            {
                //  when id == null this results in empty record set error - this is normal,
                //  because this link should be hidden when chart set is not linked
                var viewchartsetscharts = _chartSetsChartsRepository.GetChartSetChart(id, chartId, GetUserId());
                return View(viewchartsetscharts);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewChartSetsCharts viewchartsetscharts)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _chartSetsChartsRepository.UpdateChartSetsCharts(viewchartsetscharts, GetUserId());
                    return RedirectToAction("Index", new { id = viewchartsetscharts.ChartSetID });
                }
                return View(viewchartsetscharts);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult DeleteChart(Int64 id/*chart set id*/, Int64 chartId)
        {            
            try
            {
                _chartSetsChartsRepository.DeleteChartSetsCharts(id, chartId, GetUserId());
                return RedirectToAction("Index", new { id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult AddChart(ViewChartSetsCharts v)
        {
            try
            {
                _chartSetsChartsRepository.AddChartSetsCharts(v, GetUserId());
                return RedirectToAction("Index", new { id = v.ChartSetID });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}