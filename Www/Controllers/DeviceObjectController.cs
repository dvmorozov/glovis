using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class DeviceObjectController : PersonalizedController
    {
        IDeviceObjectRepository _deviceObjectRepository;
        IDeviceRepository _deviceRepository;
        IDeviceTypeRepository _deviceTypeRepository;
        ICosemObjectRepository _cosemObjectRepository;

        private void SetRepository(IDeviceObjectRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr, ICosemObjectRepository cor, GlovisMasterBaseEntities e)
        {
            _deviceObjectRepository = r;
            _deviceObjectRepository.SetEntities(e);
            _deviceRepository = dr;
            _deviceRepository.SetEntities(e);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(e);
            _cosemObjectRepository = cor;
            _cosemObjectRepository.SetEntities(e);
        }

        public DeviceObjectController() 
        {
            SetRepository(new DeviceObjectRepository(), new DeviceRepository(), new DeviceTypeRepository(), new CosemObjectRepository(), Entities);
        }

        public DeviceObjectController(IDeviceObjectRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr, ICosemObjectRepository cor)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, dr, dtr, cor, null);
        }

        public ViewResult Index(long id/*logical device identifier*/, long deviceid/*physical device identifier*/)
        {
            try
            {
                ViewBag.DeviceID = deviceid;
                ViewBag.LogicalDeviceID = id;

                var userId = GetUserId();

                var viewdevice = _deviceRepository.GetDevice(deviceid, userId);
                ViewBag.DeviceName = viewdevice.Name;

                var viewdevicetype = _deviceTypeRepository.GetDeviceType(viewdevice.TypeID, userId);
                ViewBag.DeviceTypeName = viewdevicetype.Description.TrimEnd();

                var viewcosemobject = _cosemObjectRepository.GetCosemObjectList(id, userId);
                return View(viewcosemobject);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult AddObjectAttrToCollectList(long id/*object identifier*/, long deviceid/*physical device identifier*/, long logicaldeviceid)
        {
            try
            {
                _deviceObjectRepository.AddAllAttrToCollectList(id, deviceid, GetUserId());
                return RedirectToAction("Index", "DeviceObject", new { id = logicaldeviceid, deviceid });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult DeleteObjectAttrFromCollectList(long id/*object identifier*/, long deviceid/*physical device identifier*/, long logicaldeviceid)
        {
            try
            {
                _deviceObjectRepository.DeleteAllAttrFromCollectList(id, deviceid, GetUserId());
                return RedirectToAction("Index", "DeviceObject", new { id = logicaldeviceid, deviceid });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        //  first parameter should be named as "id"!
        public ActionResult AddAllObjectAttrToCollectList(long id/*physical device identifier*/, long logicaldeviceid)
        {
            try
            {
                _deviceObjectRepository.AddAllObjectAttrToCollectList(id, logicaldeviceid, GetUserId());
                return RedirectToAction("Index", "DeviceObject", new { id = logicaldeviceid, deviceid = id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        //  first parameter should be named as "id"!
        public ActionResult DeleteAllObjectAttrFromCollectList(long id/*physical device identifier*/, long logicaldeviceid)
        {
            try
            {
                _deviceObjectRepository.DeleteAllObjectAttrFromCollectList(id, logicaldeviceid, GetUserId());
                return RedirectToAction("Index", "DeviceObject", new { id = logicaldeviceid, deviceid = id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}