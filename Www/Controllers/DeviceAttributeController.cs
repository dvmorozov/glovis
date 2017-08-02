using System;
using System.Collections.Generic;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class DeviceAttributeController : PersonalizedController
    {
        IDeviceAttributeRepository _deviceAttributeRepository;
        IDeviceRepository _deviceRepository;
        IDeviceTypeRepository _deviceTypeRepository;
        ICosemObjectRepository _cosemObjectRepository;
        ICosemAttributeValueRepository _cosemAttributeRepository;

        private void SetRepository(IDeviceAttributeRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr,
            ICosemObjectRepository cor, ICosemAttributeValueRepository car, GlovisMasterBaseEntities e)
        {
            _deviceAttributeRepository = r;
            _deviceAttributeRepository.SetEntities(e);
            _deviceRepository = dr;
            _deviceRepository.SetEntities(e);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(e);
            _cosemObjectRepository = cor;
            _cosemObjectRepository.SetEntities(e);
            _cosemAttributeRepository = car;
            _cosemAttributeRepository.SetEntities(e);
        }

        public DeviceAttributeController() 
        {
            SetRepository(new DeviceAttributeRepository(), new DeviceRepository(), new DeviceTypeRepository(),
                new CosemObjectRepository(), new CosemAttributeValueRepository(), Entities);
        }

        public DeviceAttributeController(IDeviceAttributeRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr,
            ICosemObjectRepository cor, ICosemAttributeValueRepository car)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, dr, dtr, cor, car, null);
        }

        public ViewResult Index(long id/*logical object identifier*/, long deviceid/*physical device identifier*/, long logicaldeviceid)
        {
            try
            {
                ViewBag.DeviceID = deviceid;
                ViewBag.ObjectID = id;
                ViewBag.LogicalDeviceID = logicaldeviceid;

                var userId = GetUserId();

                var viewdevice = _deviceRepository.GetDevice(deviceid, userId);
                ViewBag.DeviceName = viewdevice.Name;

                var viewdevicetype = _deviceTypeRepository.GetDeviceType(viewdevice.TypeID, userId);
                ViewBag.DeviceTypeName = viewdevicetype.Description.TrimEnd();

                var viewcosemobject = _cosemObjectRepository.GetCosemObject(id, userId);
                ViewBag.ObjectName = viewcosemobject.COSEMLogicalName;

                var viewcosemattribute = _cosemAttributeRepository.GetCosemAttributeValueList(deviceid, viewcosemobject.ID, viewcosemobject.COSEMClassID, userId);
                return View(viewcosemattribute);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private List<ViewCOSEMAttributeValue> FillCurrentStateData(long id)
        {
            ViewBag.DeviceID = id;

            var userId = GetUserId();

            var viewdevice = _deviceRepository.GetDevice(id, userId);
            ViewBag.DeviceName = viewdevice.Name;
            ViewBag.DeviceGroupID = viewdevice.GroupID;

            var viewdevicetype = _deviceTypeRepository.GetDeviceType(viewdevice.TypeID, userId);
            ViewBag.DeviceTypeName = viewdevicetype.Description.TrimEnd();

            return _cosemAttributeRepository.GetCosemAttributeValueList(id, userId);
        }

        public ActionResult Update(long id)
        {
            try
            {
                var viewcosemattribute = FillCurrentStateData(id);
                return PartialView("TableCurrentState", viewcosemattribute);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult State(long id/*идентификатор физического устройства*/)
        {
            try
            {
                var viewcosemattribute = FillCurrentStateData(id);
                return View(viewcosemattribute);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult AddAttrToCollectList(long id/*attribute id*/, long deviceid/*physical device id*/, long logicaldeviceid, long objectid)
        {
            try
            {
                _deviceAttributeRepository.AddAttrToCollectList(deviceid, id, objectid, GetUserId());
                return RedirectToAction("Index", "DeviceAttribute", new { id = objectid, deviceid, logicaldeviceid});
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult DeleteAttrFromCollectList(long id/*attribute id*/, long deviceid/*physical device id*/, long logicaldeviceid, long objectid)
        {
            try
            {
                _deviceAttributeRepository.DeleteAttrFromCollectList(id, objectid, GetUserId());
                return RedirectToAction("Index", "DeviceAttribute", new { id = objectid, deviceid, logicaldeviceid });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult AddAllAttrToCollectList(long id/*physical device id*/, long logicaldeviceid, long objectid)
        {
            try
            {
                _deviceAttributeRepository.AddAllAttrToCollectList(id, objectid, GetUserId());
                return RedirectToAction("Index", "DeviceAttribute", new { id = objectid, deviceid = id, logicaldeviceid });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult DeleteAllAttrFromCollectList(long id/*physical device id*/, long logicaldeviceid, long objectid)
        {
            try
            {
                _deviceAttributeRepository.DeleteAllAttrFromCollectList(id, objectid, GetUserId());
                return RedirectToAction("Index", "DeviceAttribute", new { id = objectid, deviceid = id, logicaldeviceid });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}