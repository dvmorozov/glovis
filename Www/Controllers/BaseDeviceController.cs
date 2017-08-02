using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using LibExeCache;
using LibProcessLog;
using web.Models;

namespace web.Controllers
{
    public class BaseDeviceController : PersonalizedController
    {
        protected IGroupRepository GroupRepository;    //  data isolation level
        protected IDeviceRepository DeviceRepository;
        protected IDeviceTypeRepository DeviceTypeRepository;
        protected IDeviceTypeAndOwnerRepository DeviceTypeAndOwnerRepository;
        protected IDeviceOwnerRepository DeviceOwnerRepository;
        protected IDeviceLogicalDeviceRepository DeviceLogicalDeviceRepository;
        protected IChartsDevicesRepository ChartsDevicesRepository;

        private void SetRepository(IGroupRepository r, IDeviceRepository dr, IDeviceTypeAndOwnerRepository dt, 
            IDeviceTypeRepository dtr, IDeviceOwnerRepository dor, IDeviceLogicalDeviceRepository or, IChartsDevicesRepository cdr,
            GlovisMasterBaseEntities e)
        {
            DeviceTypeAndOwnerRepository = dt;
            DeviceTypeAndOwnerRepository.SetEntities(e);
            DeviceTypeRepository = dtr;
            DeviceTypeRepository.SetEntities(e);
            GroupRepository = r;
            GroupRepository.SetEntities(e);
            DeviceRepository = dr;
            DeviceRepository.SetEntities(e);
            DeviceOwnerRepository = dor;
            DeviceOwnerRepository.SetEntities(e);
            DeviceLogicalDeviceRepository = or;
            DeviceLogicalDeviceRepository.SetEntities(e);
            ChartsDevicesRepository = cdr;
            ChartsDevicesRepository.SetEntities(e);
        }

        private readonly bool _disableInstanceStarter;

        public BaseDeviceController() 
        {
            SetRepository(new GroupRepository(), new DeviceRepository(), new DeviceTypeAndOwnerRepository(), new DeviceTypeRepository(), 
                new DeviceOwnerRepository(), new DeviceLogicalDeviceRepository(), new ChartsDevicesRepository(), Entities);

            //  https://www.evernote.com/shard/s132/nl/14501366/6aa6839d-f9e8-4ad0-b0ee-71b169cfde79
            //  Blocks execution of InstanceStarter.exe for debug purposes.
            var appSettings = (NameValueCollection) ConfigurationManager.GetSection("appSettings");
            bool.TryParse(appSettings["DisableInstanceStarter"], out _disableInstanceStarter);
        }

        public BaseDeviceController(IGroupRepository r, IDeviceRepository dr, IDeviceTypeAndOwnerRepository dt, 
            IDeviceTypeRepository dtr, IDeviceOwnerRepository dor, IDeviceLogicalDeviceRepository or, IChartsDevicesRepository cdr)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, dr, dt, dtr, dor, or, cdr, null);
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult Index()
        {
            return RedirectToAction("State");
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult State()
        {
            return RedirectToAction("DevicesWithCharts", "BaseDevice");
        }

        [Authorize(Roles = "Administrator, User")]
        public ViewResult DevicesWithCharts()
        {
            try
            {
                var userId = GetUserId();
                var v = ChartsDevicesRepository.GetDevicesWithCharts(userId, Models.DeviceTypeRepository.DeviceTypes);
                return View("DevicesWithCharts", v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult Update()
        {
            return RedirectToAction("DevicesWithChartsTable", "BaseDevice");
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult DevicesWithChartsTable()
        {
            try
            {
                var userId = GetUserId();
                var v = ChartsDevicesRepository.GetDevicesWithCharts(userId, Models.DeviceTypeRepository.DeviceTypes);
                return PartialView("DevicesWithChartsTable", v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  параметр должен называться именно "id"!
        [Authorize(Roles = "Administrator, User")]
        public ActionResult GroupDevices(long id /*device group identifier*/)
        {
            return RedirectToAction("GroupDevicesBase", "BaseDevice" ,new {id});
        }

        //  параметр должен называться именно "id"!
        [Authorize(Roles = "Administrator, User")]
        public ViewResult GroupDevicesBase(long id/*device group identifier*/)
        {
            try
            {
                var userId = GetUserId();
                var v = DeviceTypeAndOwnerRepository.GetDeviceTypeAndOwnerList(id, userId);
                var vg = GroupRepository.GetGroup(id, userId);
                ViewBag.GroupName = vg.Name.TrimEnd();
                ViewBag.CurrentGroupID = id;
                return View("GroupDevices", v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult Details(long id /*device identifier*/)
        {
            return RedirectToAction("DeleteWithoutIp", "BaseDevice", new {id});
        }

        [Authorize(Roles = "Administrator, User")]
        public ViewResult DetailsWithoutIp(long id /*device identifier*/)
        {
            try
            {
                var viewdevice = DeviceRepository.GetDevice(id, GetUserId());
                ViewBag.CurrentGroupID = viewdevice.GroupID;
                return View("DetailsWithoutIP"/*temporarily IP input disabled !!!*/, viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        protected void FillAuxData(Guid userId, Int64 groupId, Int64 selectedOwner, Int64 selectedType, Int64 selectedGroup)
        {
            ViewBag.OwnerID = DeviceOwnerRepository.GetDeviceOwners(userId, selectedOwner);
            ViewBag.TypeID = DeviceTypeRepository.GetDeviceTypes(userId, selectedType, null);
            ViewBag.GroupID = GroupRepository.GetGroups(userId, selectedGroup);
            var vg = GroupRepository.GetGroup(groupId, userId);
            ViewBag.GroupName = vg.Name.TrimEnd();
        }

        protected void FillAuxData(Guid userId, Int64 selectedOwner, Int64 selectedType, Int64 selectedGroup)
        {
            ViewBag.OwnerID = DeviceOwnerRepository.GetDeviceOwners(userId, selectedOwner);
            ViewBag.TypeID = DeviceTypeRepository.GetDeviceTypes(userId, selectedType, null);
            ViewBag.GroupID = GroupRepository.GetGroups(userId, selectedGroup);
        }

        //  The method must be accessible to the descendant class.
        //  evernote:///view/14501366/s132/dbaa428d-79c3-4c09-a207-eda2d819075d/dbaa428d-79c3-4c09-a207-eda2d819075d/
        protected void FillEditViewBag(ViewDevice viewdevice)
        {
            var userId = GetUserId();
            //  should have the same name as viewdevice field for automatic data filling
            ViewBag.TypeID = DeviceTypeRepository.GetDeviceTypes(userId, viewdevice.TypeID, null);
            ViewBag.GroupID = GroupRepository.GetGroups(userId, viewdevice.GroupID);
            ViewBag.CurrentGroupID = viewdevice.GroupID;
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult SetAddress(long id /*device id.*/, long? addressId /*null terminates the address setup sequence*/)
        {
            try
            {
                if (null != addressId)
                {
                    if (ModelState.IsValid)
                    {   //  this code finalizes the address setup sequence
                        var v = new ViewDevice {ID = id, LocationAddressID = addressId};
                        DeviceRepository.UpdateDeviceAddress(v, GetUserId());
                    }
                }
                return RedirectToAction("Details/" + id.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult SetOwner(long id /*device id.*/, long? ownerId /*null terminates the owner setup sequence*/)
        {
            try
            {
                if (null != ownerId)
                {
                    if (ModelState.IsValid)
                    {   //  this code finalizes the owner setup sequence
                        var v = new ViewDevice {ID = id, OwnerID = ownerId};
                        DeviceRepository.UpdateDeviceOwnerId(v, GetUserId());
                    }
                }
                return RedirectToAction("Details/" + id.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult Delete(long id /*device index*/)
        {
            return RedirectToAction("DeleteWithoutIp", "BaseDevice", new {id});
        }

        [Authorize(Roles = "Administrator, User")] 
        public ActionResult DeleteWithoutIp(long id/*device index*/)
        {
            try
            {
                var viewdevice = DeviceRepository.GetDevice(id, GetUserId());
                ViewBag.CurrentGroupID = viewdevice.GroupID;
                return View("DeleteWithoutIP"/*temporarily IP input disabled !!!*/, viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Administrator, User")]
        public ActionResult DeleteConfirmed(long id/*device index*/)
        {            
            try
            {
                var userId = GetUserId();
                var vg = DeviceRepository.GetDevice(id, userId);
                DeviceRepository.DeleteDevice(id, userId);
                return RedirectToAction("GroupDevices/" + vg.GroupID.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize(Roles = "Administrator, User")]
        public ActionResult XmlTemplate(long id /*device index*/)
        {
            return RedirectToAction("XmlTemplateBase", "BaseDevice" ,new {id});
        }

        /// <summary>
        /// Requests the data repository for XML-template for given device (camera).
        /// </summary>
        /// <param name="deviceId"></param>
        /// <param name="userId"></param>
        /// <returns>A single string containing the XML-template.</returns>
        protected string GetXmlTemplate(long deviceId, Guid userId)
        {
            var l = DeviceRepository.ExportXmlTemplate(deviceId, userId);
            return l.Aggregate("", (current, s) => current + s);
        }

        [Authorize(Roles = "Administrator, User")]
        public FileResult XmlTemplateBase(long id /*device index*/)
        {
            try
            {
                var t = GetXmlTemplate(id, GetUserId());
                return File(System.Text.Encoding.UTF8.GetBytes(t), System.Net.Mime.MediaTypeNames.Application.Octet, id + ".xml");
            }
            catch (Exception e)
            {
                //  Returns the error message as file.
                var msg = ProcessLog.GetExceptionMessage(e);
                return File(System.Text.Encoding.UTF8.GetBytes(msg), System.Net.Mime.MediaTypeNames.Application.Octet, "Exception.txt");
            }
        }

        /// <summary>
        /// Executes InstanceStarter with the full list of actual parameters.
        /// </summary>
        /// <param name="action">Action.</param>
        /// <param name="taskId">Task.</param>
        /// <param name="sourceDomainOrIp">Address of the data (video) source.</param>
        /// <param name="sourcePort">Port of the data (video) source.</param>
        /// <param name="xmlTemplate">Xml template to upload data.</param>
        /// <param name="operationId">Operation.</param>
        protected void ExecuteInstanceStarterWithCallback(string action, string taskId, string sourceDomainOrIp,
                                                        string sourcePort, string xmlTemplate, string operationId)
        {
            if (_disableInstanceStarter) return;

            var cache = new ExeCache();

            var par = "\"" + action + "\" \"" + taskId + "\" \"" + sourceDomainOrIp + "\" \"" + sourcePort + "\" \"" +
                      xmlTemplate + "\" " + operationId;
            cache.FindPathAndExecute("InstanceStarter.exe", par);
        }

        /// <summary>
        /// The same as before but without callback.
        /// </summary>
        /// <param name="action">Action.</param>
        /// <param name="taskId">Task.</param>
        /// <param name="sourceDomainOrIp">Address of the data (video) source.</param>
        /// <param name="sourcePort">Port of the data (video) source.</param>
        /// <param name="xmlTemplate">Xml template to upload data.</param>
        protected void ExecuteInstanceStarter(string action, string taskId, string sourceDomainOrIp, string sourcePort, string xmlTemplate)
        {
            var cache = new ExeCache();

            var par = "\"" + action + "\" \"" + taskId + "\" \"" + sourceDomainOrIp + "\" \"" + sourcePort + "\" \"" + xmlTemplate + "\"";
            cache.FindPathAndExecute("InstanceStarter.exe", par);
        }

        /// <summary>
        /// Executes InstanceStarter with the shorten list of parameters. Parameters which are not relevant to the command
        /// are filled by fake values.
        /// </summary>
        /// <param name="action">Action.</param>
        /// <param name="taskId">Task.</param>
        /// <param name="operationId">Operation.</param>
        //  evernote:///view/14501366/s132/62ff2b5d-4016-44cb-a67c-918cc661253e/62ff2b5d-4016-44cb-a67c-918cc661253e/
        protected void ExecuteInstanceStarterWithCallback(string action, string taskId, string operationId)
        {
            var cache = new ExeCache();

            //  The InstanceStarter requires 6 non-empty parameters, at that the optional (operationId) must be the last.
            //  So, this allows me to avoid the interface refactoring.
            var par = "\"" + action + "\" \"" + taskId + "\" \"localhost\" \"0\" \"empty\" " + operationId;
            cache.FindPathAndExecute("InstanceStarter.exe", par);
        }

        /// <summary>
        /// The same as before but without callback.
        /// </summary>
        /// <param name="action">Action.</param>
        /// <param name="taskId">Task.</param>
        //  evernote:///view/14501366/s132/62ff2b5d-4016-44cb-a67c-918cc661253e/62ff2b5d-4016-44cb-a67c-918cc661253e/
        protected void ExecuteInstanceStarter(string action, string taskId)
        {
            var cache = new ExeCache();

            //  The InstanceStarter requires 6 non-empty parameters, at that the optional (operationId) must be the last.
            //  So, this allows me to avoid the interface refactoring.
            var par = "\"" + action + "\" \"" + taskId + "\" \"localhost\" \"0\" \"empty\" ";
            cache.FindPathAndExecute("InstanceStarter.exe", par);
        }
    }
}