using System;
using System.Collections.Generic;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class ChartController : BaseChartController
    {
        static public String Last = "last";
        public List<String> DataSetTypes = new List<String>(new[] { Last });

        public ActionResult Index()
        {
            try
            {
                return View(BaseChartRepository.GetChartList(GetUserId()));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id)
        {
            try
            {
                var viewchart = BaseChartRepository.GetChart(id, GetUserId());
                var ct = new SelectList(ChartTypes, ChartTypes[0]);
                ViewBag.ChartTypes = ct;
                return View("DetailsCameraView", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public void SetCreateEditViewBag(ViewChart viewchart)
        {
            var chartType = new SelectList(new List<String>(ChartTypes), viewchart != null ? viewchart.ChartType.TrimEnd() : ChartTypes[0]);
            ViewBag.ChartType = chartType;
            var dataSetType = new SelectList(new List<String>(new[] { Last }), viewchart != null ? viewchart.DataSetType.TrimEnd() : ChartTypes[0]);
            ViewBag.DataSetType = dataSetType;
        }

        public ActionResult Create()
        {
            try
            {
                SetCreateEditViewBag(null);
                var viewchart = new ViewChart {DataSetType = Last, DataSetMaxCount = 2, ChartType = Video};
                return View("CreateCameraView", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Create(ViewChart viewchart)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    BaseChartRepository.AddChart(viewchart, GetUserId());
                    return RedirectToAction("Index");  
                }

                SetCreateEditViewBag(viewchart);
                return View("CreateCameraView", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        //
        // GET: /Chart/Edit/5
 
        public ActionResult Edit(long id)
        {
            try
            {
                ViewChart viewchart = BaseChartRepository.GetChart(id, GetUserId());
                SetCreateEditViewBag(viewchart);

                viewchart.DataSetType = Last;
                viewchart.DataSetMaxCount = 2;
                viewchart.ChartType = Video;
                return View("EditCameraView", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // POST: /Chart/Edit/5

        [HttpPost]
        public ActionResult Edit(ViewChart viewchart)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    BaseChartRepository.UpdateChart(viewchart, GetUserId());
                    return RedirectToAction("ShowChart", "Chart", new { viewchart.ID });
                }
                return View("EditCameraView", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // GET: /Chart/Delete/5
 
        public ActionResult Delete(long id)
        {
            try
            {
                ViewChart viewchart = BaseChartRepository.GetChart(id, GetUserId());
                return View(viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // POST: /Chart/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {            
            try
            {
                BaseChartRepository.DeleteChart(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult View(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RedirectToAction("ShowChart", "RenderSnapshot", new { id, width, height });
        }

        public ActionResult Update(Int64 id/*chart id.*/)
        {
            try
            {
                return RedirectToAction("RenderSrc", "Chart", new { id, width = -1, height = -1 });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                //  this view is showed in frame, so
                //  it should show error message by itself
                return View("Error");
            }
        }

        //  this method is used from chart set updating JScript
        public ActionResult UpdateWh(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            try
            {
                return RedirectToAction("RenderSrc", "Chart", new { id, width, height });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                //  this view is showed in frame, so
                //  it should show error message by itself
                return View("Error");
            }
        }

        public ActionResult ShowChart(Int64 id/*chart id.*/)
        {
            // evernote:///view/14501366/s132/bc7ca0ae-5972-4508-bb41-53381ad18dd1/bc7ca0ae-5972-4508-bb41-53381ad18dd1/
            var t = ChartRepository.GetChartType(id);
            if (t == Video)
                return RedirectToAction("ShowChart", "RenderVideo", new { id });
            if (t == Snapshot)
                // TODO return RedirectToAction("ShowChart", "RenderSnapshot", new { id });
                return RedirectToAction("ShowChart", "RenderVideo", new { id });
            return RedirectToAction("InvalidChartType", "BaseChart", new { id });
        }

        public ActionResult ShowSerie(Int64 id/*chart id.*/, string serieId)
        {
            // evernote:///view/14501366/s132/bc7ca0ae-5972-4508-bb41-53381ad18dd1/bc7ca0ae-5972-4508-bb41-53381ad18dd1/
            var t = ChartRepository.GetChartType(id);
            if (t == Video)
                return RedirectToAction("ShowSerie", "RenderVideo", new { id });
            if (t == Snapshot)
                //  TODO return RedirectToAction("ShowSerie", "RenderSnapshot", new { id });
                return RedirectToAction("ShowSerie", "RenderVideo", new { id });
            return RedirectToAction("InvalidChartType", "BaseChart", new { id });
        }

        /*
        public ActionResult XLSX(Int64 id/*chart id.* /)
        {
            try
            {
                //  here should be export to XLSX realization
                ViewChart viewchart = chartRepository.GetChart(id, GetUserID());
                return View(viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        */

        public ActionResult DataSet(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                var viewchart = BaseChartRepository.GetChart(id, GetUserId());
                ViewBag.Group = group;
                ViewBag.GroupID = groupId;
                ViewBag.Owner = owner;
                ViewBag.OwnerID = ownerId;
                ViewBag.Location = location;
                ViewBag.LocationID = locationId;
                ViewBag.Element = element;
                var v = BaseChartRepository.GetFilteredByDeviceTypeElements(ownerId, groupId, locationId, GetUserId(), id);
                ViewBag.ElementList = v;
                return View(viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("AddElement")]
        public ActionResult AddElementConfirm(Int64 id/*chart id.*/, Int64 elementId, String returnUrl)
        {
            try
            {
                if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1
                    && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                {
                    ChartRepository.AddElementToChart(elementId, id, GetUserId());
                    return Redirect(returnUrl);
                }
                return RedirectToAction("DataSet", new { id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("DeleteElement")]
        public ActionResult DeleteElementConfirm(Int64 id/*chart id.*/, Int64 elementId, String returnUrl)
        {
            try
            {
                if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1
                    && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                {
                    ChartRepository.DeleteElementFromChart(elementId, id, GetUserId());
                    return Redirect(returnUrl);
                }
                return RedirectToAction("DataSet", new { id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectGroup(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                var v = BaseChartRepository.GetElementGroupList(GetUserId());
                ViewBag.ChartID = id;
                ViewBag.Group = group;
                ViewBag.GroupID = groupId;
                ViewBag.Owner = owner;
                ViewBag.OwnerID = ownerId;
                ViewBag.Location = location;
                ViewBag.LocationID = locationId;
                ViewBag.Element = element;
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("SelectGroup")]
        public ActionResult SelectGroupConfirm(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                return RedirectToAction("DataSet", new { id, groupid = groupId, group, ownerid = ownerId, owner, locationid = locationId, location, element });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectOwner(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                var v = BaseChartRepository.GetElementOwnerList(GetUserId());
                ViewBag.ChartID = id;
                ViewBag.Group = group;
                ViewBag.GroupID = groupId;
                ViewBag.Owner = owner;
                ViewBag.OwnerID = ownerId;
                ViewBag.Location = location;
                ViewBag.LocationID = locationId;
                ViewBag.Element = element;
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("SelectOwner")]
        public ActionResult SelectOwnerConfirm(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                return RedirectToAction("DataSet", new { id, groupid = groupId, group, ownerId, owner, locationId, location, element });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectLocation(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                var v = BaseChartRepository.GetElementLocationList(GetUserId());
                ViewBag.ChartID = id;
                ViewBag.Group = group;
                ViewBag.GroupID = groupId;
                ViewBag.Owner = owner;
                ViewBag.OwnerID = ownerId;
                ViewBag.Location = location;
                ViewBag.LocationID = locationId;
                ViewBag.Element = element;
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("SelectLocation")]
        public ActionResult SelectLocationConfirm(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                return RedirectToAction("DataSet", new { id, groupId, group, ownerId, owner, locationId, location, element });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult RenderSrc(Int64 id/*chart id.*/, Int32 width, Int32 height)
        {
            return RedirectToAction("RenderSrcUnauthorized", "RenderSnapshot", new {id, width, height, controllerName = "Chart"});
        }

        public ActionResult SelectElement(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                var v = BaseChartRepository.GetElementInstanceNameList();
                ViewBag.ChartID = id;
                ViewBag.Group = group;
                ViewBag.GroupID = groupId;
                ViewBag.Owner = owner;
                ViewBag.OwnerID = ownerId;
                ViewBag.Location = location;
                ViewBag.LocationID = locationId;
                ViewBag.Element = element;
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("SelectElement")]
        public ActionResult SelectElementConfirm(Int64 id/*chart id.*/, long? groupId, String group, long? ownerId, String owner, long? locationId, String location, String element)
        {
            try
            {
                return RedirectToAction("DataSet", new { id, groupId, group, ownerId, owner, locationId, location, element });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}
