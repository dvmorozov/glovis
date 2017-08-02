using System;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public partial class DeviceController : BaseDeviceController
    {
        /// <summary>
        ///     Creates a new device and associates it with the group.
        /// </summary>
        /// <param name="id">Device group identifier.</param>
        /// <returns>Returns view.</returns>
        public ActionResult Create(long id)
        {
            try
            {
                var userId = GetUserId();
                FillAuxData(userId, id, 0, 0, 0);

                //  to fill hidden page fields conviniently
                var viewdevice = new ViewDevice {AddressType = "IP", GroupID = id};
                return View("CreateCameraInGroup", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Create(ViewDevice viewdevice)
        {
            try
            {
                if (viewdevice != null)
                {
                    var userId = GetUserId();
                    //  Substitutes fields which are not filled in the form.
                    viewdevice.DeviceTypeName = Models.DeviceTypeRepository.VideoRecorder;
                    //  Gets the first item which satisfies given type name.
                    viewdevice.TypeID =
                        DeviceTypeRepository.GetDeviceTypeList(userId, viewdevice.DeviceTypeName).First().ID;
                    viewdevice.InternalAddress = "0";
                    viewdevice.SecondaryIP1 = viewdevice.IP1;
                    viewdevice.SecondaryIP2 = viewdevice.IP2;
                    viewdevice.SecondaryIP3 = viewdevice.IP3;
                    viewdevice.SecondaryIP4 = viewdevice.IP4;
                    viewdevice.SecondaryPort = viewdevice.Port;

                    if (ModelState.IsValid)
                    {
                        Trace.Assert(DeviceRepository != null);
                        Trace.Assert(DeviceLogicalDeviceRepository != null);

                        var deviceId = DeviceRepository.AddDevice(viewdevice, userId);
                        if (deviceId != null)
                        {
                            DeviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList((long) deviceId, userId);
                        }
                        return RedirectToAction("GroupDevices/" + viewdevice.GroupID);
                    }

                    FillAuxData(userId, viewdevice.GroupID,
                                viewdevice.OwnerID != null ? (Int64) viewdevice.OwnerID : 0,
                                viewdevice.TypeID, viewdevice.GroupID);
                }
                return View(viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /*
        /// <summary>
        /// The methods creates the configuration file ("task") to start video recording.
        /// </summary>
        /// <param name="viewDevice">Device attributes</param>
        private void ExportDeviceConfig(ViewDevice viewDevice, string baseName)
        {
            //  Creates path to the config directory.
            var dstName = Path.ChangeExtension(baseName, "config");

            //  Creates an auxiliary object.
            var config = new RecordingConfig()
                {
                    SourceDomain = viewDevice.IP1 + '.' + viewDevice.IP2 + '.' + viewDevice.IP3 + '.' + viewDevice.IP4,
                    SourcePort = Int32.Parse(viewDevice.Port)
                    //  _TODO: fill all the attributes.
                };

            var serializer = new RecordingConfigSerializer();
            serializer.Serialize(dstName, config);
        }
        */

        /*
        private void ExportXMLTemplate(long deviceID, Guid userID, string baseName)
        {
            //  Creates path to the template directory.
            var dstName = Path.ChangeExtension(baseName, "template");
            var l = deviceRepository.ExportXMLTemplate(deviceID, userID);
            using (var w = new StreamWriter(dstName))
            {
                foreach (var s in l)
                {
                    w.WriteLine(s);    
                }
            }
        }
        */
    }
}