using System;
using System.Globalization;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class CosemLogicalDeviceController : PersonalizedController
    {
        private ICosemLogicalDeviceRepository _cosemLogicalDeviceRepository;
        private IDeviceTypeRepository _deviceTypeRepository;

        private void SetRepository(ICosemLogicalDeviceRepository r, IDeviceTypeRepository dtr, GlovisMasterBaseEntities e)
        {
            _cosemLogicalDeviceRepository = r;
            _cosemLogicalDeviceRepository.SetEntities(e);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(e);
        }

        public CosemLogicalDeviceController() 
        {
            SetRepository(new CosemLogicalDeviceRepository(), new DeviceTypeRepository(), Entities);
        }

        public CosemLogicalDeviceController(ICosemLogicalDeviceRepository r, IDeviceTypeRepository dtr)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, dtr, null);
        }

        private void FillAuxData(long id/*идентификатор типа физического устройства*/)
        {
            var vdt = _deviceTypeRepository.GetDeviceType(id, GetUserId());
            ViewBag.DeviceTypeName = vdt.Description.TrimEnd();
            ViewBag.DeviceTypeID = id;
        }

        public ViewResult Index(long id/*идентификатор типа физического устройства*/)
        {
            try
            {
                FillAuxData(id);
                var vcld = _cosemLogicalDeviceRepository.GetCosemLogicalDeviceList(id, GetUserId());
                return View(vcld);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id/*идентификатор логического устройства*/)
        {
            try
            {
                var viewcosemlogicaldevice = _cosemLogicalDeviceRepository.GetCosemLogicalDevice(id, GetUserId());
                FillAuxData(viewcosemlogicaldevice.DeviceTypeID);
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create(long id/*идентификатор типа физического устройства*/)
        {
            try
            {
                FillAuxData(id); //  для заполнения обратной ссылки на страницу списка логических устройств
                //  View должен быть без параметров, чтобы обеспечить правильное создание объекта при возврате
                var v = new ViewCOSEMLogicalDevice {Name = _cosemLogicalDeviceRepository.GetCosemLogicalDeviceName(id)};
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Create(long id/*идентификатор физического устройства*/, ViewCOSEMLogicalDevice viewcosemlogicaldevice)
        {
            try
            {
                if (viewcosemlogicaldevice != null)
                {
                    if (ModelState.IsValid)
                    {
                        if (null == viewcosemlogicaldevice.Name)
                            throw new Exception("Name can't be empty");

                        viewcosemlogicaldevice.DeviceTypeID = id;
                        _cosemLogicalDeviceRepository.AddCosemLogicalDevice(viewcosemlogicaldevice, GetUserId());
                        return RedirectToAction("Index/" + id);
                    }

                    FillAuxData(id);
                }
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult Edit(long id/*идентификатор логического устройства*/)
        {
            try
            {
                var viewcosemlogicaldevice = _cosemLogicalDeviceRepository.GetCosemLogicalDevice(id, GetUserId());
                FillAuxData(viewcosemlogicaldevice.DeviceTypeID);
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewCOSEMLogicalDevice viewcosemlogicaldevice)
        {
            try
            {
                if (viewcosemlogicaldevice != null)
                {
                    if (ModelState.IsValid)
                    {
                        if (null == viewcosemlogicaldevice.Name)
                            throw new Exception("Name can't be empty");

                        _cosemLogicalDeviceRepository.UpdateCosemLogicalDevice(viewcosemlogicaldevice, GetUserId());
                        return RedirectToAction("Index/" + viewcosemlogicaldevice.DeviceTypeID.ToString(CultureInfo.InvariantCulture));
                    }
                    FillAuxData(ViewBag.DeviceTypeID);
                }
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Delete(long id/*идентификатор логического устройства*/)
        {
            try
            {
                var viewcosemlogicaldevice = _cosemLogicalDeviceRepository.GetCosemLogicalDevice(id, GetUserId());
                FillAuxData(viewcosemlogicaldevice.DeviceTypeID);
                return View(viewcosemlogicaldevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id/*идентификатор логического устройства*/)
        {            
            try
            {
                var userId = GetUserId();
                var vld = _cosemLogicalDeviceRepository.GetCosemLogicalDevice(id, userId);
                _cosemLogicalDeviceRepository.DeleteCosemLogicalDevice(id, userId);
                return RedirectToAction("Index/" + vld.DeviceTypeID.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}