using System;
using System.Linq;
using LibStarterModel.Models;

namespace AppStarterScript.Models
{
    /// <summary>
    /// This class fully controls working with entities.
    /// It does not have "SetEntities", as it was in web-applications!
    /// </summary>
    public class TaskRepository : IDisposable
    {
        private readonly AppStarterBaseEntities _db = new AppStarterBaseEntities();

        public void GetTaskAttributes(Guid taskId, out string config, out string template, out string process)
        {
            var tabletask = _db.TableTask.Single(t => t.TaskID == taskId);

            config = tabletask.Config;
            template = tabletask.Template;
            process = tabletask.Process;
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
