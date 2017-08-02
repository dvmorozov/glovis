using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class ObisGroupController : PersonalizedController
    {
        private IObisGroupRepository _obisGroupRepository;
        private IDeviceTypeRepository _deviceTypeRepository;

        private void SetRepository(IObisGroupRepository ogr, IDeviceTypeRepository dtr, GlovisMasterBaseEntities entities)
        {
            _obisGroupRepository = ogr;
            _obisGroupRepository.SetEntities(entities);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(entities);
        }

        public ObisGroupController() 
        {
            SetRepository(new ObisGroupRepository(), new DeviceTypeRepository(), Entities);
        }

        public ObisGroupController(IObisGroupRepository ogr, IDeviceTypeRepository dtr)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(ogr, dtr, null);
        }

        public ViewResult Index(String type)
        {
            try
            {
                if (null == type)
                {
                    var v = _obisGroupRepository.GetObisGroupList(GetUserId());
                    return View(v);
                }
                else
                {
                    var v = _obisGroupRepository.GetObisGroupList(type, GetUserId());
                    return View(v);
                }
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
                var viewobisgroup = _obisGroupRepository.GetObisGroup(id, GetUserId());
                return View(viewobisgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void FillAuxData()
        {
            ViewBag.DeviceTypeID = _deviceTypeRepository.GetDeviceTypes(GetUserId(), null);
            ViewBag.Type = new SelectList(new[] { "A", "B", "C", "D", "E", "F" });
        }

        public ActionResult Create()
        {
            try
            {
                FillAuxData();
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewOBISGroup viewobisgroup, Int64 deviceTypeId)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _obisGroupRepository.AddObisGroup(viewobisgroup, deviceTypeId, GetUserId());
                    //return RedirectToAction("Index");  
                }
                //  форма возвращается обратно с выбором пользователя
                FillAuxData();
                return View(viewobisgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult Edit(long id)
        {
            try
            {
                var viewobisgroup = _obisGroupRepository.GetObisGroup(id, GetUserId());
                return View(viewobisgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewOBISGroup viewobisgroup)
        {
            try
            {
                if (viewobisgroup != null)
                {
                    if (ModelState.IsValid)
                    {
                        _obisGroupRepository.UpdateObisGroup(viewobisgroup, GetUserId());
                        return View(viewobisgroup);
                        //return RedirectToAction("Index");
                    }
                }
                return View(viewobisgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Delete(long id)
        {
            try
            {
                var viewobisgroup = _obisGroupRepository.GetObisGroup(id, GetUserId());
                return View(viewobisgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            try
            {
                _obisGroupRepository.DeleteObisGroup(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}