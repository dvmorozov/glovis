using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class DeviceLogicalDeviceController : PersonalizedController
    {
        private IDeviceLogicalDeviceRepository _deviceLogicalDeviceRepository;
        private IDeviceRepository _deviceRepository;
        private IDeviceTypeRepository _deviceTypeRepository;
        private ICosemLogicalDeviceRepository _cosemLogicalDeviceRepository;
        private IDeviceObjectRepository _deviceObjectRepository;

        private void SetRepository(IDeviceLogicalDeviceRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr,
            ICosemLogicalDeviceRepository cor, IDeviceObjectRepository dor, GlovisMasterBaseEntities e)
        {
            _deviceLogicalDeviceRepository = r;
            _deviceLogicalDeviceRepository.SetEntities(e);
            _deviceRepository = dr;
            _deviceRepository.SetEntities(e);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(e);
            _cosemLogicalDeviceRepository = cor;
            _cosemLogicalDeviceRepository.SetEntities(e);
            _deviceObjectRepository = dor;
            _deviceObjectRepository.SetEntities(e);
        }

        public DeviceLogicalDeviceController() 
        {
            SetRepository(new DeviceLogicalDeviceRepository(), new DeviceRepository(), new DeviceTypeRepository(), 
                new CosemLogicalDeviceRepository(), new DeviceObjectRepository(), Entities);
        }

        public DeviceLogicalDeviceController(IDeviceLogicalDeviceRepository r, IDeviceRepository dr, IDeviceTypeRepository dtr, 
            ICosemLogicalDeviceRepository cor, IDeviceObjectRepository dor)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, dr, dtr, cor, dor, null);
        }

        public ViewResult Index(long id/*идентификатор физического устройства*/)
        {
            try
            {
                var userId = GetUserId();

                var viewdevice = _deviceRepository.GetDevice(id, userId);
                ViewBag.DeviceTypeID = viewdevice.TypeID;
                ViewBag.DeviceName = viewdevice.Name;
                ViewBag.DeviceGroupID = viewdevice.GroupID;
                ViewBag.DeviceID = id;

                var viewdevicetype = _deviceTypeRepository.GetDeviceType(viewdevice.TypeID, userId);
                ViewBag.DeviceTypeName = viewdevicetype.Description.TrimEnd();

                var viewcosemlogicaldevice = _cosemLogicalDeviceRepository.GetCosemLogicalDeviceList(viewdevice.TypeID, userId);
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult AddDeviceAttrToCollectList(long id/*logical device identifier*/, long deviceid/*physical device identifier*/)
        {
            try
            {
                _deviceObjectRepository.AddAllObjectAttrToCollectList(deviceid, id, GetUserId());
                return RedirectToAction("Index/" + deviceid);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult DeleteDeviceAttrFromCollectList(long id/*logical device identifier*/, long deviceid/*physical device identifier*/)
        {
            try
            {
                _deviceObjectRepository.DeleteAllObjectAttrFromCollectList(deviceid, id, GetUserId());
                return RedirectToAction("Index/" + deviceid);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult AddAllDeviceAttrToCollectList(long id/*physical device id*/)
        {
            try
            {
                //  the method adds all atrributes of all logical devices for given physical device to collect list
                _deviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList(id, GetUserId());
                return RedirectToAction("Index/" + id);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult DeleteAllDeviceAttrFromCollectList(long id/*physical device id*/)
        {
            try
            {
                _deviceLogicalDeviceRepository.DeleteAllDeviceAttrFromCollectList(id, GetUserId());
                return RedirectToAction("Index/" + id);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}