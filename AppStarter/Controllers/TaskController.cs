using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using LibExeCache;
using LibProcessLog;
using LibRecordingConfig;
using LibStarterModel.Models;
using ProcessConfigData;
using RecordingConfigData;
using TableTask = LibStarterModel.Models.TableTask;
using LibHttpClient;
using web.Models;

namespace web.Controllers
{
    public class TaskController : PersonalizedController
    {
        private readonly AppStarterBaseEntities _db = new AppStarterBaseEntities();
        private readonly bool _executeAppStarterScript = true;
        private readonly bool _turnOnMonitoring;    //  False by default.
        private const string AppName = "AppStarter";
        private readonly ProcessLog _pl = new ProcessLog(AppName);

        public TaskController()
        {
            var appSettings = (NameValueCollection) ConfigurationManager.GetSection("appSettings");
            if(!bool.TryParse(appSettings["ExecuteAppStarterScript"], out _executeAppStarterScript))
                _pl.AddMessageAnyway("Error in reading configuration parameter \"ExecuteAppStarterScript\"", AppName);
            //  evernote:///view/14501366/s132/9d8ff0f1-04e4-49d7-9229-a958425c2087/9d8ff0f1-04e4-49d7-9229-a958425c2087/
            if(!bool.TryParse(appSettings["TurnOnMonitoring"], out _turnOnMonitoring))
                _pl.AddMessageAnyway("Error in reading configuration parameter \"TurnOnMonitoring\"", AppName);
        }

        //
        // GET: /Task/
        //[Authorize(Roles = "Administrator, User")]
        public ViewResult Index()
        {
            try
            {
                return View(_db.TableTask.ToList());
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // GET: /Task/Details/5
        //[Authorize(Roles = "Administrator")]
        public ViewResult Details(long id)
        {
            try
            {
                var tabletask = _db.TableTask.Single(t => t.ID == id);
                return View(tabletask);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // GET: /Task/Create
        //[Authorize(Roles = "Administrator")]
        public ActionResult Create()
        {
            try
            {
                return View(new CreateTaskModel());
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /// <summary>
        /// Executes external starter application.
        /// </summary>
        private void ExecuteStarter(Guid taskId, string command, Guid? operationId = null)
        {
            if (!_executeAppStarterScript) return;

            var par = " \"" + command + "\" " + "\"" + taskId + "\"" +
                      (operationId != null ? " \"" + ((Guid) operationId) + "\"" : "");
            //  evernote:///view/14501366/s132/93f671d8-38e0-4f4f-be3c-6da41e3e1fc4/93f671d8-38e0-4f4f-be3c-6da41e3e1fc4/
            _pl.AddMessage("AppStarterScript is executed with parameters" + par);

            var cache = new ExeCache();
            cache.FindPathAndExecute("AppStarterScript.exe", par);
        }

        //  evernote:///view/14501366/s132/a42a53cf-6930-4d3d-9a88-3da81a3fc880/a42a53cf-6930-4d3d-9a88-3da81a3fc880/
        private void CreateInternal(CreateTaskModel m)
        {
            _pl.AddMessage("Task is going to be created with id " + m.TaskId + ", operation \"" + m.OperationId + "\".");
            //  Fills the fields to avoid conflict with database constraints.
            Guid operationId;
            if(!Guid.TryParse(m.OperationId, out operationId)) 
                operationId = Guid.NewGuid();

            var task = new TableTask
            {
                TaskID = m.TaskId,
                Template = StringCompressor.DecompressString(m.Template),
                Running = true
            };

            var operation = new TableTaskOperation
            {
                //  A new GUID is generated when the operation is executed directly from UI.
                //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
                OperationID = operationId,
                OperationInProgress = true,
                FinishedSuccessfully = false
            };

            task.TableTaskOperation.Add(operation);

            var config = new RecordingConfig
            {
                FragmentLength = m.FragmentLength,
                PortalDomain = m.PortalDomain,
                PortalPort = m.PortalPort,
                PortalPassword = m.PortalPassword,
                PortalUserName = m.PortalUserName,
                SourceDomain = StringCompressor.DecompressString(m.SourceDomain),
                SourcePort = m.SourcePort,
                VideoProxyPort = m.VideoProxyPort
            };

            var processConfig = new ProcessConfig
            {
                EventDetectorPID = 0,
                VideoFragmentManifestMakerPID = 0,
                VideoProxyPID = 0,
                YouTubeUploaderPID = 0
            };

            var serializer = new RecordingConfigSerializer();
            //  Sets config attributes.
            task.Config = serializer.SerializeToString(config);
            //  Sets process attributes.
            var processSerializer = new ProcessConfigSerializer();
            task.Process = processSerializer.SerializeToString(processConfig);

            //  evernote:///view/14501366/s132/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/ae45ae6d-5bbb-4b5d-904b-25cebc57fbb9/
            //  Transaction is not used here to avoid race condition (see evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/)
            try
            {
                _db.TableTask.AddObject(task);
                _db.SaveChanges();

                ExecuteStarter(m.TaskId, _turnOnMonitoring ? "start&monitor" : "start", operationId);
            }
            catch (Exception)
            {
                //  evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
                _db.TableTask.DeleteObject(task);
                _db.SaveChanges();
                throw;
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        //[Authorize(Roles = "Administrator")]
        //  This method is intended for manual task creation.
        public ActionResult Create(CreateTaskModel m)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CreateInternal(m);

                    return RedirectToAction("Index");
                }

                return View(m);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        //[Authorize(Roles = "Administrator")]
        //  This method is intended for task creation by software.
        //  Returns JSON-object describing operation result.
        // evernote:///view/14501366/s132/a42a53cf-6930-4d3d-9a88-3da81a3fc880/a42a53cf-6930-4d3d-9a88-3da81a3fc880/
        public JsonResult CreateJ(CreateTaskModel m)
        {
            var result = new JsonReturn();
            try
            {
                if (ModelState.IsValid)
                {
                    CreateInternal(m);
                    result.Success = true;
                    result.Message = "Ok.";

                    _pl.AddMessage("CreateJ finished successfully.");
                }
                else throw new Exception("Model state is invalid.");
            }
            catch (Exception e)
            {
                result.Success = false;
                result.Message = ProcessLog.GetExceptionMessage(e);

                _pl.AddMessage("CreateJ failed with exception message: \"" + result.Message + "\"");
            }
            return new JsonResult { Data = result };
        }

        //  evernote:///view/14501366/s132/155ccd45-4ea5-47e6-a9df-8f9abf34c17a/155ccd45-4ea5-47e6-a9df-8f9abf34c17a/
        private void StopInternal(Guid taskId, Guid? operationId = null)
        {
            _pl.AddMessage("StopInternal is called with task " + taskId + ", operation " + operationId + ".");
            var taskList = _db.TableTask.Where(t => t.TaskID == taskId);
            if (!taskList.Any())
            {
                _pl.AddMessage("StopInternal: task " + taskId + " not found.");
                return;
            }

            Debug.Assert(taskList.Count() == 1);

            //  Transaction is not used here to avoid race condition (see evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/).
            //  If the operation id. is null this means that the operation is executed directly from UI.
            operationId = operationId ?? Guid.NewGuid();
            var taskRepository = new TaskRepository();

            try
            {
                var task = taskList.First();
                //  evernote:///view/14501366/s132/93f671d8-38e0-4f4f-be3c-6da41e3e1fc4/93f671d8-38e0-4f4f-be3c-6da41e3e1fc4/
                if (!task.TableTaskOperation.Any(t => t.OperationInProgress))
                {
                    //  Sets up state of operation.
                    taskRepository.StartOperation(taskId, (Guid) operationId, false);

                    ExecuteStarter(taskId, "stop", operationId);
                }
                else
                {
                    _pl.AddMessage("StopInternal: operation is still in progress.");
                }
            }
            catch (Exception)
            {
                //  evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
                //  Sets up state of operation.
                taskRepository.BreakOperation(taskId, (Guid) operationId);
                throw;
            }
        }

        public JsonResult StopJ(string taskId, string operationId)
        {
            _pl.AddMessage("StopJ is called with task " + taskId + ", operation " + operationId + ".");

            var result = new JsonReturn();
            try
            {
                if (ModelState.IsValid)
                {
                    Guid oId;
                    var r = Guid.TryParse(operationId, out oId);

                    StopInternal(Guid.Parse(taskId),  r ? (Guid?)oId : null);
                    result.Success = true;
                    result.Message = "Ok.";

                    _pl.AddMessage("StopJ finished successfully.");
                }
                else throw new Exception("Model state is invalid.");
            }
            catch (Exception e)
            {
                result.Success = false;
                result.Message = ProcessLog.GetExceptionMessage(e);

                _pl.AddMessage("StopJ failed: " + result.Message);
            }
            return new JsonResult { Data = result };
        }

        // GET: /Task/Stop/5
        //[Authorize(Roles = "Administrator")]
        public ActionResult Stop(long id)
        {
            try
            {
                var tabletask = _db.TableTask.Single(t => t.ID == id);
                return View(tabletask);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // POST: /Task/Delete/5
        [HttpPost, ActionName("Stop")]
        //[Authorize(Roles = "Administrator")]
        public ActionResult StopConfirmed(long id)
        {
            try
            {
                var task = _db.TableTask.Single(t => t.ID == id);

                StopInternal(task.TaskID);
                return RedirectToAction("Index");
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

                    var taskRepository = new TaskRepository();
                    //  evernote:///view/14501366/s132/f517de5d-e71f-4649-a800-4f1e836eb1e2/f517de5d-e71f-4649-a800-4f1e836eb1e2/
                    //  Checks if task is no more running. Then deletes it.
                    if (!success)
                    {
                        taskRepository.BreakOperation(operationId);
                        _pl.AddMessage("OperationResult after BreakOperation.");
                    }
                    else
                    {
                        taskRepository.UpdateOrDeleteTask(operationId);
                        _pl.AddMessage("OperationResult after UpdateOrDeleteTask.");
                    }
                }
                else
                {
                    _pl.AddMessage("OperationResult: model state is invalid.");
                }

                result.Success = true;
                result.Message = "Ok.";

                _pl.AddMessage("OperationResult finished successfully.");
            }
            catch (Exception e)
            {
                result.Success = false;
                result.Message = ProcessLog.GetExceptionMessage(e);

                _pl.AddMessage("OperationResult failed: \"" + result.Message + "\"");
            }
            return new JsonResult { Data = result };
        }

        protected override void Dispose(bool disposing)
        {
            _db.Dispose();
            base.Dispose(disposing);
        }
    }
}