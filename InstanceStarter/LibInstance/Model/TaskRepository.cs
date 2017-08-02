using System;
using System.Data;
using System.Linq;

namespace LibInstance.Model
{
    public class TaskRepository : IDisposable
    {
        private readonly InstanceStarterBaseEntities _db = new InstanceStarterBaseEntities();

        public void MarkAsRunning(long task, Guid taskId)
        {
            //  This will throw an exception when the set is empty.
            var tableTask = _db.TableTask.First(t => t.ID == task);

            //  https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459
            //  The task is not running until the confirmation from device will be received.
            tableTask.Running = false;
            tableTask.TaskId = taskId;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(tableTask, EntityState.Modified);
            _db.SaveChanges();
        }

        public void MarkAsRunning(Guid taskId)
        {
            //  This will throw an exception when the set is empty.
            var tableTask = _db.TableTask.First(t => t.TaskId == taskId);

            tableTask.Running = true;

            //  https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
            _db.ObjectStateManager.ChangeObjectState(tableTask, EntityState.Modified);
            _db.SaveChanges();
        }

        public string GetIpAndPortOfTaskInstance(Guid taskId)
        {
            var taskList = _db.TableTask.Where(t => t.TaskId == taskId);

            if (!taskList.Any())
            {
                return string.Empty;
            }
            var taskEntity = taskList.First();
            var instance = _db.TableInstance.First(t => t.ID == taskEntity.InstanceId);

            return instance.IPAndPort;
        }

        public void DeleteTask(Guid taskId)
        {
            var taskList = _db.TableTask.Where(t => t.TaskId == taskId);

            if (!taskList.Any())
            {
                return;
            }

            foreach (var tableTask in taskList)
            {
                tableTask.Running = false;
                tableTask.TaskId = Guid.Empty;
                tableTask.VideoProxyPort = 0;
                _db.ObjectStateManager.ChangeObjectState(tableTask, EntityState.Modified);
            }

            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
