using System;
using System.Linq;

namespace LibStarterModel.Models
{
    /// <summary>
    /// This class is responsible for working with the log of monitoring process.
    /// </summary>
    public class LogRepository : IDisposable
    {
        private readonly AppStarterBaseEntities _db = new AppStarterBaseEntities();

        public void AddMonitoringLog(Guid taskId, string reason)
        {
            _db.AddMonitoringLog(taskId, DateTimeOffset.Now, reason);
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
