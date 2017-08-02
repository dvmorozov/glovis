using System;
using System.Web.Mvc;
using System.Linq;
using web.Models;

namespace web.Controllers
{
    /// <summary>
    /// This part of class definition contains operations which are specific for cameras only.
    /// </summary>
    [Authorize(Roles = "Administrator, User")]
    public partial class DeviceController
    {
        /// <summary>
        /// Creates a new camera without initial association with the group.
        /// The group is selected in process of creation.
        /// </summary>
        /// <returns>Returns view.</returns>
        public ActionResult CreateCamera()
        {
            try
            {
                var userId = GetUserId();

                //  To fill hidden page fields conveniently.
                var viewdevice = new ViewDevice {AddressType = "IP"};
                //  The list can't be empty if the proper initialization procedure was performed (InitUserData).
                ViewBag.GroupID = GroupRepository.GetGroups(userId);
                return View("CreateCamera", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /// <summary>
        /// Creates a new camera with possibility of type selection.
        /// The group is selected in process of creation.
        /// https://www.evernote.com/shard/s132/nl/14501366/6aa6839d-f9e8-4ad0-b0ee-71b169cfde79
        /// </summary>
        /// <returns>Returns view.</returns>
        public ActionResult CreateCameraWithTypeSelection()
        {
            try
            {
                var userId = GetUserId();
                FillAuxData(userId, 0, 0, 0);

                //  To fill hidden page fields conveniently.
                var v = new ViewDevice { AddressType = "IP" };
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void FillEditViewBagCamera(ViewDevice viewdevice)
        {
            var userId = GetUserId();
            //  Should have the same name as viewdevice field for automatic data filling.
            ViewBag.GroupID = GroupRepository.GetGroups(userId, viewdevice.GroupID);
            ViewBag.CurrentGroupID = viewdevice.GroupID;
        }

        //  evernote:///view/14501366/s132/564e55d1-0a12-4bfe-a052-e5b916d80cf8/564e55d1-0a12-4bfe-a052-e5b916d80cf8/
        public ActionResult Edit(long id/*device identifier*/)
        {
            try
            {
                return RedirectToAction("EditCamera", new { id });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }


        public ActionResult EditCamera(long id/*device identifier*/)
        {
            try
            {
                var viewdevice = DeviceRepository.GetDevice(id, GetUserId());
                FillEditViewBagCamera(viewdevice);
                return View("EditCamera", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult EditCamera(ViewDevice viewdevice)
        {
            //  Substitutes fields which are not filled in the form.
            viewdevice.DeviceTypeName = Models.DeviceTypeRepository.VideoRecorder;
            viewdevice.InternalAddress = "0";
            viewdevice.SecondaryIP1 = viewdevice.IP1;
            viewdevice.SecondaryIP2 = viewdevice.IP2;
            viewdevice.SecondaryIP3 = viewdevice.IP3;
            viewdevice.SecondaryIP4 = viewdevice.IP4;
            viewdevice.SecondaryPort = viewdevice.Port;

            try
            {
                if (ModelState.IsValid)
                {
                    DeviceRepository.UpdateDevice(viewdevice, GetUserId());
                    //  Returns back to the list of cameras (associated with screens).
                    //  evernote:///view/14501366/s132/dbaa428d-79c3-4c09-a207-eda2d819075d/dbaa428d-79c3-4c09-a207-eda2d819075d/
                    return RedirectToAction("Index");
                }
                FillEditViewBag(viewdevice);
                return View("EditCamera", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult DeleteCamera(long id/*device index*/)
        {
            try
            {
                ViewDevice viewdevice = DeviceRepository.GetDevice(id, GetUserId());
                ViewBag.CurrentGroupID = viewdevice.GroupID;
                return View("DeleteCamera", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("DeleteCamera")]
        public ActionResult DeleteCameraConfirmed(long id/*camera id.*/)
        {
            try
            {
                var userId = GetUserId();
                DeviceRepository.DeleteDevice(id, userId);
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult DetailsCamera(long id/*camera id.*/)
        {
            try
            {
                ViewDevice viewdevice = DeviceRepository.GetDevice(id, GetUserId());
                ViewBag.CurrentGroupID = viewdevice.GroupID;
                return View("DetailsCamera", viewdevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void AddCameraWithViewAndTurnOn(ViewDevice viewDevice, Guid userId)
        {
            ViewChart viewChart;
            string attributeName;

            if (viewDevice.DeviceTypeName.Trim().ToLower() ==
                Models.DeviceTypeRepository.VideoRecorderTypeName.ToLower())
            {
                viewChart = new ViewChart
                    {
                        DataSetType = ChartController.Last,
                        DataSetMaxCount = 2,
                        ChartType = BaseChartController.Video,
                        Height = 240,
                        Width = 320,
                        Name = "Noname"
                    };
                attributeName = "URL";
            }
            else if (viewDevice.DeviceTypeName.Trim().ToLower() == 
                Models.DeviceTypeRepository.SnapshotRecorderTypeName.ToLower())
            {
                viewChart = new ViewChart
                    {
                        DataSetType = ChartController.Last,
                        DataSetMaxCount = 2,
                        ChartType = BaseChartController.Snapshot,
                        Height = 240,
                        Width = 320,
                        Name = "Noname"
                    };
                attributeName = "Frame";
            }
            else
            {
                throw new Exception("Camera creation fails.");
            }

            //  Creates a new camera and starts recording.
            long? cameraId;
            Guid? valueId;
            long? elementId;

            DeviceRepository.AddCamera5(viewDevice, viewChart, userId, attributeName, out cameraId, out valueId, out elementId);
            
            if (cameraId == null || valueId == null || elementId == null)
                throw new Exception("Camera creation fails.");
            
            try
            {
                TurnRecordingOnInternal((long) elementId, (long) cameraId, userId);
            }
            catch
            {
                DeviceRepository.DeleteDevice(viewDevice.ID, userId);
                throw;
            }
        }

        /// <summary>
        /// The method creates the camera and associates it with a new view.
        /// </summary>
        /// <param name="viewDevice">Device attributes.</param>
        /// <returns>View.</returns>
        [HttpPost]
        public ActionResult CreateCamera(ViewDevice viewDevice)
        {
            try
            {
                if (viewDevice != null)
                {
                    var userId = GetUserId();
                    //  Substitutes fields which are not filled in the form.
                    viewDevice.DeviceTypeName = Models.DeviceTypeRepository.VideoRecorder;
                    //  Gets the first item which satisfies given type name.
                    viewDevice.TypeID =
                        DeviceTypeRepository.GetDeviceTypeList(userId, viewDevice.DeviceTypeName).First().ID;
                    viewDevice.InternalAddress = "0";
                    //  Secondary IP is filled from the primary.
                    viewDevice.SecondaryIP1 = viewDevice.IP1;
                    viewDevice.SecondaryIP2 = viewDevice.IP2;
                    viewDevice.SecondaryIP3 = viewDevice.IP3;
                    viewDevice.SecondaryIP4 = viewDevice.IP4;
                    viewDevice.SecondaryPort = viewDevice.Port;

                    if (ModelState.IsValid)
                    {
                        AddCameraWithViewAndTurnOn(viewDevice, userId);
                        //  Returns back to the list of cameras (associated with screens).
                        //  evernote:///view/14501366/s132/dbaa428d-79c3-4c09-a207-eda2d819075d/dbaa428d-79c3-4c09-a207-eda2d819075d/
                        return RedirectToAction("Index");
                    }

                    FillAuxData(userId, viewDevice.GroupID,
                                viewDevice.OwnerID != null ? (Int64)viewDevice.OwnerID : 0,
                                viewDevice.TypeID, viewDevice.GroupID);
                }
                return View("Create", viewDevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /// <summary>
        /// The method creates the camera and associates it with a new view.
        /// </summary>
        /// <param name="viewDevice">Device attributes.</param>
        /// <returns>View.</returns>
        [HttpPost]
        public ActionResult CreateCameraWithTypeSelection(ViewDevice viewDevice)
        {
            try
            {
                if (viewDevice != null)
                {
                    var userId = GetUserId();
                    //  Substitutes fields which are not filled in the form.
                    viewDevice.DeviceTypeName = DeviceTypeRepository.GetDeviceType(viewDevice.TypeID, userId).Description;
                    viewDevice.InternalAddress = "0";
                    //  Secondary IP is filled from the primary.
                    viewDevice.SecondaryIP1 = viewDevice.IP1;
                    viewDevice.SecondaryIP2 = viewDevice.IP2;
                    viewDevice.SecondaryIP3 = viewDevice.IP3;
                    viewDevice.SecondaryIP4 = viewDevice.IP4;
                    viewDevice.SecondaryPort = viewDevice.Port;

                    if (ModelState.IsValid)
                    {
                        AddCameraWithViewAndTurnOn(viewDevice, userId);
                        //  Returns back to the list of cameras (associated with screens).
                        //  evernote:///view/14501366/s132/dbaa428d-79c3-4c09-a207-eda2d819075d/dbaa428d-79c3-4c09-a207-eda2d819075d/
                        return RedirectToAction("Index");
                    }

                    FillAuxData(userId, viewDevice.GroupID,
                                viewDevice.OwnerID != null ? (Int64)viewDevice.OwnerID : 0,
                                viewDevice.TypeID, viewDevice.GroupID);
                }
                return View("Create", viewDevice);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void TurnRecordingOnInternal(long elementId, long deviceId, Guid userId)
        {
            //  Gets current state of recording to protect from multiple launches.
            var element = ChartsDevicesRepository.GetChartElement2(elementId, userId);

            //  The button must be active independently from the operation result.
            //  evernote:///view/14501366/s132/a5ff5fbd-8847-4dd9-b5a9-7c6d6fbbdd3d/a5ff5fbd-8847-4dd9-b5a9-7c6d6fbbdd3d/
            if (element.OperationInProgress == null || !(bool)element.OperationInProgress)
            {
                //  Updates the status.
                Guid operationId;
                DeviceRepository.TurnCameraOn(elementId, userId, out operationId);

                try
                {
                    var device = DeviceRepository.GetDevice(deviceId, userId);

                    var xmlTemplate = GetXmlTemplate(deviceId, userId);
                    //  Starts video recording.
                    //  evernote:///view/14501366/s132/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/
                    ExecuteInstanceStarterWithCallback("start", element.ValueIdentifier, device.URL,
                                                        device.Port, xmlTemplate, operationId.ToString());
                }
                catch
                {
                    //  evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
                    DeviceRepository.BreakOperation(operationId);
                    throw;
                }
            }
        }

        /// <summary>
        ///     The method turns on recording from the camera.
        ///     The method does all necessary steps to start the process.
        ///     evernote:///view/14501366/s132/3fe91868-ba30-4b56-a986-157f5bb9feb4/3fe91868-ba30-4b56-a986-157f5bb9feb4/
        /// </summary>
        /// <param name="elementId">The data element, associated with the camera (a row in TableCurrentState).</param>
        /// <param name="deviceId"></param>
        /// <returns>View.</returns>
        [HttpPost]
        public ActionResult TurnRecordingOn(long elementId, long deviceId)
        {
            try
            {
                var userId = GetUserId();

                TurnRecordingOnInternal(elementId, deviceId, userId);
                //  Returns back to the list of cameras (associated with screens).
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /// <summary>
        ///     The method turns off recording from the camera.
        ///     The method does all necessary steps to stop the process.
        ///     evernote:///view/14501366/s132/3fe91868-ba30-4b56-a986-157f5bb9feb4/3fe91868-ba30-4b56-a986-157f5bb9feb4/
        /// </summary>
        /// <param name="elementId">The data element, associated with the camera (a row in TableCurrentState).</param>
        /// <param name="deviceId"></param>
        /// <returns>View.</returns>
        [HttpPost]
        public ActionResult TurnRecordingOff(long elementId, long deviceId)
        {
            try
            {
                var userId = GetUserId();
                //  Gets current state of recording to protect from multiple launches.
                var element = ChartsDevicesRepository.GetChartElement(elementId, userId);

                //  The button must be active independently from the operation result.
                //  evernote:///view/14501366/s132/a5ff5fbd-8847-4dd9-b5a9-7c6d6fbbdd3d/a5ff5fbd-8847-4dd9-b5a9-7c6d6fbbdd3d/
                if (!element.OperationInProgress)
                {
                    Guid operationId;
                    //  Starts the operation and updates the state of element (camera) in the database.
                    DeviceRepository.TurnCameraOff(elementId, GetUserId(), out operationId);

                    try
                    {
                        //  Stops video recording.
                        //  evernote:///view/14501366/s132/62ff2b5d-4016-44cb-a67c-918cc661253e/62ff2b5d-4016-44cb-a67c-918cc661253e/
                        ExecuteInstanceStarterWithCallback("stop", element.ValueIdentifier, operationId.ToString());

                    }
                    catch (Exception)
                    {
                        //  evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
                        DeviceRepository.BreakOperation(operationId);                        
                        throw;
                    }
                }
                //  Returns back to the list of cameras (associated with screens).
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