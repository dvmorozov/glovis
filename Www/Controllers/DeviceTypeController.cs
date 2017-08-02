using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User, Developer")]
    public class DeviceTypeController : PersonalizedController
    {
        private IDeviceTypeRepository _repository;    //  data isolation level
        
        private void SetRepository(IDeviceTypeRepository r, GlovisMasterBaseEntities e)
        {
            _repository = r;
            _repository.SetEntities(e);
        }

        public DeviceTypeController() 
        {
            SetRepository(new DeviceTypeRepository(), Entities);
        }

        public DeviceTypeController(IDeviceTypeRepository r)
        {
            SetRepository(r, null);
        }
        
        [Authorize(Roles = "Administrator, Developer")]
        public ViewResult Index()
        {
            try
            {
                var viewgroupList = _repository.GetDeviceTypeList(GetUserId(), null);
                if (viewgroupList == null) throw new Exception("Returned list of device types is null.");
                return View(viewgroupList);
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
                ViewDeviceType viewdevicetype = _repository.GetDeviceType(id, GetUserId());
                return View(viewdevicetype);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create()
        {
            return View();
        } 

        [HttpPost]
        public ActionResult Create(ViewDeviceType viewdevicetype)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.AddDeviceType(viewdevicetype, GetUserId());
                    return RedirectToAction("Index");
                }

                return View(viewdevicetype);
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
                var viewdevicetype = _repository.GetDeviceType(id, GetUserId());
                return View(viewdevicetype);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewDeviceType viewdevicetype)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.UpdateDeviceType(viewdevicetype, GetUserId());
                    return RedirectToAction("Index");
                }
                return View(viewdevicetype);
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
                var viewdevicetype = _repository.GetDeviceType(id, GetUserId());
                return View(viewdevicetype);
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
                _repository.DeleteDeviceType(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateCustom(long id)
        {
            try
            {
                _repository.CreateCustomDeviceType(id, GetUserId());
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