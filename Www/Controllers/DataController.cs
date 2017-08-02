using System;
using System.Collections.Generic;
using System.Xml.XPath;
using System.Web;
using System.Web.Mvc;
using LibProcessLog;
using web.Models;

namespace web.Controllers
{
    public class DataController : BaseDeviceController
    {
        private readonly ProcessLog _pl = new ProcessLog("Portal\\Data");

        [HttpPost]
        public ActionResult Upload(IEnumerable<HttpPostedFileBase> file)
        {
            try
            {
                foreach (var f in file)
                {
                    if (f == null) continue;

                    var doc = new XPathDocument(f.InputStream);
                    var navigator = doc.CreateNavigator();
                    var i1 = navigator.Select("/xml_template/device_type/logical_device/logical_object/attribute/extended_register");
                    while (i1.MoveNext())
                    {
                        var i2 = i1.Current.Select("value_identifier");
                        var valueIdentifier = i2.MoveNext() ? i2.Current.Value : "";

                        i2 = i1.Current.Select("value/int_value");
                        var intValue = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        i2 = i1.Current.Select("value/string_value");
                        var stringValue = i2.MoveNext() ? i2.Current.Value : "";

                        i2 = i1.Current.Select("status/int_status");
                        var intStatus = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        i2 = i1.Current.Select("units");
                        var units = i2.MoveNext() ? i2.Current.Value : "";

                        i2 = i1.Current.Select("capture_time/year");
                        var year = i2.MoveNext() ? int.Parse(i2.Current.Value) : 1975;

                        i2 = i1.Current.Select("capture_time/month");
                        var month = i2.MoveNext() ? int.Parse(i2.Current.Value) : 8;

                        i2 = i1.Current.Select("capture_time/day_of_month");
                        var dayOfMonth = i2.MoveNext() ? int.Parse(i2.Current.Value) : 12;

                        i2 = i1.Current.Select("capture_time/day_of_week");
                        var dayOfWeek = i2.MoveNext() ? i2.Current.Value : "";

                        i2 = i1.Current.Select("capture_time/hour");
                        var hour = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        i2 = i1.Current.Select("capture_time/minute");
                        var minute = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        i2 = i1.Current.Select("capture_time/second");
                        var second = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        i2 = i1.Current.Select("capture_time/hundredths_of_second");
                        var hundredthsOfSecond = i2.MoveNext() ? int.Parse(i2.Current.Value) : 0;

                        //  evernote:///view/14501366/s132/405a60e1-abc7-4754-8899-1402d94c5c9a/405a60e1-abc7-4754-8899-1402d94c5c9a/
                        Entities.PutExtendedRegisterIntoBase2(valueIdentifier, units, intValue, stringValue, intStatus, year, month, dayOfMonth, dayOfWeek, hour, minute, second, hundredthsOfSecond);
                    }
                }

                return RedirectToAction("Upload");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Upload()
        {
            try
            {
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        //[Authorize(Roles = "")]
        //  For some reasons this method does not work
        //  when placed in DeviceController (can't be found).
        //  evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
        public JsonResult OperationResult(OperationResultModel m)
        {
            _pl.AddMessage("OperationResult is called with operation " + m.OperationId + ", result " + m.Success);

            var result = new JsonReturn();
            try
            {
                if (ModelState.IsValid)
                {
                    var operationId = Guid.Parse(m.OperationId);
                    var success = bool.Parse(m.Success);

                    DeviceRepository.SetEntities(Entities);
                    DeviceRepository.UpdateDeviceOperationLog(operationId, GetUserId(), m.Message);
                    DeviceRepository.UpdateDeviceStatusByOperation(operationId, success);

                    //  The type must match with one of defined in TurnRecordingOnOff.
                    //  https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459
                    string operationType, taskId;
                    DeviceRepository.GetOperationAttrs(operationId, out operationType, out taskId);
                    switch (operationType)
                    {
                        case("turn off"):
                            //  Deletes task from the database of instances.
                            ExecuteInstanceStarter("delete", taskId);
                            break;

                        case ("turn on"):
                            //  Deletes task from the database of instances.
                            ExecuteInstanceStarter("mark_as_running", taskId);
                            break;
                    }
                }

                result.Success = true;
                result.Message = "Ok.";

                _pl.AddMessage("OperationResult finished successfully.");
            }
            catch (Exception e)
            {
                result.Success = false;
                result.Message = "Exception: " + ProcessLog.GetExceptionMessage(e);

                _pl.AddMessage("OperationResult failed.");
            }
            return new JsonResult { Data = result };
        }
    }
}
