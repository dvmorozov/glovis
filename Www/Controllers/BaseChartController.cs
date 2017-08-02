using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using LibProcessLog;
using web.Models;

namespace web.Controllers
{
    //  The controller implements common rendering methods of all special chart controllers.
    public class BaseChartController : PersonalizedController
    {
        protected IBaseChartRepository BaseChartRepository;
        protected IChartSetChartsRepository ChartSetsChartsRepository;
        protected IChartSetRepository ChartSetRepository;
        protected IChartRepository ChartRepository;

        private void SetRepository(IBaseChartRepository b, IChartRepository chartRepository, IChartSetChartsRepository r, IChartSetRepository r1, GlovisMasterBaseEntities e)
        {
            BaseChartRepository = b;
            BaseChartRepository.SetEntities(e);

            ChartRepository = chartRepository;
            ChartRepository.SetEntities(e);
            ChartSetsChartsRepository = r;
            ChartSetsChartsRepository.SetEntities(e);
            ChartSetRepository = r1;
            ChartSetRepository.SetEntities(e);
        }

        public BaseChartController() 
        {
            SetRepository(new BaseChartRepository(), new ChartRepository(), new ChartSetChartsRepository(), new ChartSetRepository(), Entities);
        }

        public BaseChartController(IBaseChartRepository b, IChartRepository chartRepository, IChartSetChartsRepository r, IChartSetRepository r1)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(b, chartRepository, r, r1, null);
        }

        //  Possible chart types. Are used to fill the database attribute.
        public static string Snapshot = "snapshot";
        //  evernote:///view/14501366/s132/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/9dd94c15-9b4b-4bcb-b9be-da91aea3d62e/
        public static string Video = "video";

        protected ViewChart FillSerieList(Int64 id/*chart id.*/, Guid userId)
        {
            var viewChart = BaseChartRepository.GetChart(id, userId);
            ViewBag.ChartID = viewChart.ID;
            ViewBag.Width = viewChart.Width;
            ViewBag.Height = viewChart.Height;
            //  Fills serie set.
            ViewBag.SerieList = BaseChartRepository.GetSerieList(id, userId);
            return viewChart;
        }

        //  This method is used from JScript updating chart set.
        public ActionResult RenderSrcUnauthorized(Int64 id /*chart id.*/, Int32 width, Int32 height,
                                                  String controllerName)
        {
            try
            {
                ViewBag.ChartID = id;
                ViewBag.Width = width;
                ViewBag.Height = height;
                ViewBag.ControllerName = controllerName;

                return View("RenderSrc");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        protected FileResult Download(long id /*chart id.*/, string serieId, Guid userId)
        {
            try
            {
                //  The "serie" consists only of single item.
                var filePath = BaseChartRepository.GetSerie(serieId, userId).First().StringValue;
                var fileBytes = System.IO.File.ReadAllBytes(filePath);
                var fileName = Path.GetFileName(filePath);
                return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
            }
            catch (Exception e)
            {
                //  Returns the error message as file.
                var msg = ProcessLog.GetExceptionMessage(e);
                //  https://www.evernote.com/shard/s132/nl/14501366/a6b0f507-853a-4365-9193-e34c9f7fa489
                return File(System.Text.Encoding.UTF8.GetBytes(msg), System.Net.Mime.MediaTypeNames.Application.Octet, "Exception.txt");
            }
        }

        public List<String> ChartTypes
        {
            get
            {
                return new List<String>(new[] { Snapshot, Video });
            }
        }

        public ActionResult InvalidChartType()
        {
            return View();
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
        //  Fills data necessary for video matrix rendering.
        protected ViewChartSet FillVideoMatrixData(long matrixId, Guid userId)
        {
            var result = ChartSetRepository.GetChartSet(matrixId, userId);
            ViewBag.ChartSetsCharts = ChartSetsChartsRepository.GetChartSetChartsListExt(matrixId, userId);
            return result;
        }
    }
}
