using System;
using System.Data;
using System.Linq;

namespace LibStarterModel.Models
{
    /// <summary>
    /// This class fully controls working with entities.
    /// It does not have "SetEntities", as it was in web-applications!
    /// </summary>
    public class TaskRepository : IDisposable
    {
        private readonly AppStarterBaseEntities _db = new AppStarterBaseEntities();

        public void StartOperation(Guid taskId, Guid operationId, bool running)
        {
            var task = _db.TableTask.Single(t => t.TaskID == taskId);

            task.TableTaskOperation.Add(new TableTaskOperation { OperationID = operationId, OperationInProgress = true, FinishedSuccessfully = false });
            task.Running = running;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(task, EntityState.Modified);
            _db.SaveChanges();
        }

        public void BreakOperation(Guid taskId, Guid operationId)
        {
            var operation = _db.TableTask.Single(t => t.TaskID == taskId).TableTaskOperation.Single(t => t.OperationID == operationId);

            operation.OperationInProgress = false;
            operation.FinishedSuccessfully = false;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(operation, EntityState.Modified);
            _db.SaveChanges();
        }

        public void BreakOperation(Guid operationId)
        {
            var operation = _db.TableTaskOperationSet.Single(t => t.OperationID == operationId);

            operation.OperationInProgress = false;
            operation.FinishedSuccessfully = false;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(operation, EntityState.Modified);
            _db.SaveChanges();
        }

        /// <summary>
        /// If task was stopped successfully then deletes it else updates task status.
        /// </summary>
        /// <param name="operationId"></param>
        public void UpdateOrDeleteTask(Guid operationId)
        {
            var operation = _db.TableTaskOperationSet.Single(t => t.OperationID == operationId);

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            //  As a variant instead of ORM manipulation before.
            //_db.UpdateDeviceStatusByOperation(operationId, true);

            operation.OperationInProgress = false;
            operation.FinishedSuccessfully = true;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(operation, EntityState.Modified);

            var task = operation.TableTask;
            if (!task.Running && !task.TableTaskOperation.Any(t => t.OperationID == operationId && t.OperationInProgress))
            {
                _db.DeleteObject(task);
            }
            _db.SaveChanges();
        }

        public void GetTaskAttributes(Guid taskId, out string config, out string template, out string process)
        {
            var tabletask = _db.TableTask.Single(t => t.TaskID == taskId);

            config = tabletask.Config;
            template = tabletask.Template;
            process = tabletask.Process;
        }

        //  Updates process information after the processes have been started.
        public void UpdateProcess(Guid taskId, string process, bool running)
        {
            var tableTask = _db.TableTask.Single(t => t.TaskID == taskId);
            tableTask.Process = process;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(tableTask, EntityState.Modified);
            _db.SaveChanges();
            
            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            //  As variant instead of ORM manipulation before.
            //_db.UpdateProcess(taskId, process);
        }

        public void DeleteTask(Guid taskId)
        {
            // Linked rows from TableMonitoringLog are deleted by the cascade operaton.
            var tabletask = _db.TableTask.Single(t => t.TaskID == taskId);
            _db.TableTask.DeleteObject(tabletask);
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
