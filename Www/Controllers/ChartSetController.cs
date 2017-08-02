using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class ChartSetController : BaseChartController
    {
        public ActionResult Index()
        {
            try
            {
                var list = ChartSetRepository.GetChartSetList(GetUserId());
                return View(list);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Details(int id)
        {
            try
            {
                var v = ChartSetRepository.GetChartSet(id, GetUserId());
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create()
        {
            try
            {
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewChartSet v)
        {
            try
            {
                ChartSetRepository.AddChartSet(v, GetUserId());
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        public ActionResult Edit(int id)
        {
            try
            {
                var v = ChartSetRepository.GetChartSet(id, GetUserId());
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(int id, ViewChartSet v)
        {
            try
            {
                if (null != v)
                {
                    v.ID = id;
                    ChartSetRepository.UpdateChartSet(v, GetUserId());
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                var v = ChartSetRepository.GetChartSet(id, GetUserId());
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                ChartSetRepository.DeleteChartSet(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult View(int id)
        {
            try
            {
                return View(FillVideoMatrixData(id, GetUserId()));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}
