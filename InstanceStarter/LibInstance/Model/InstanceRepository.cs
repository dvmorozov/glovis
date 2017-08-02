using System;
using System.Linq;

namespace LibInstance.Model
{
    public class InstanceRepository : IDisposable
    {
        private readonly InstanceStarterBaseEntities _db = new InstanceStarterBaseEntities();

        public int? GetFirstUnderloadedInstanceId(out string instanceIpAndPort)
        {
            instanceIpAndPort = "";
            var instances = _db.TableInstance.Where(t => t.RunningTaskNumber < t.MaxTaskNumber);
            if (!instances.Any()) return null;
            var instance = instances.First();
            instanceIpAndPort = instance.IPAndPort;
            return instance.ID;
        }

        public int? GetInstanceById(string instanceId)
        {
            var instances = _db.TableInstance.Where(t => t.InstanceId == instanceId);
            if (!instances.Any()) return null;
            return instances.First().ID;
        }

        public long GetUnassignedVideoProxyPort(int instanceId, out int videoProxyPort)
        {
            var tasks = _db.TableTask.Where(t => t.InstanceId == instanceId && t.Running == false);
            if (!tasks.Any())
                throw new Exception("Unassigned task record not found. Instance Id = " + instanceId);

            var task = tasks.First();
            videoProxyPort = task.VideoProxyPort;
            return task.ID;
        }

        /// <summary>
        /// Adds an instance record to the database.
        /// </summary>
        /// <param name="imageId"></param>
        /// <param name="instanceType"></param>
        /// <param name="keyName"></param>
        /// <param name="securityGroup"></param>
        /// <param name="maxTaskNumber"></param>
        /// <param name="ipAndPort"></param>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="instanceId"></param>
        /// <param name="baseVideoProxyPort"></param>
        /// <returns>New instance identifier (the value of primary key).</returns>
        public int? AddNewInstance(string imageId, string instanceType, string keyName, string securityGroup, int maxTaskNumber, 
            string ipAndPort, string userName, string password, string instanceId, int baseVideoProxyPort)
        {
            var instance = new TableInstance { ImageId = imageId, InstanceType =  instanceType, KeyName = keyName, SecurityGroup = securityGroup, RunningTaskNumber = 0,
                MaxTaskNumber = maxTaskNumber, IPAndPort = ipAndPort, UserName = userName, Password = password, InstanceId = instanceId};

            _db.TableInstance.AddObject(instance);
            _db.SaveChanges();

            try
            {
                for (var i = 0; i < maxTaskNumber; i++)
                {
                    var task = new TableTask
                    {
                        InstanceId = instance.ID,
                        Running = false
                    };
                    _db.TableTask.AddObject(task);
                    _db.SaveChanges();
                }
            }
            catch
            {
                _db.TableInstance.DeleteObject(instance);
                throw;
            }
            return instance.ID;
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
