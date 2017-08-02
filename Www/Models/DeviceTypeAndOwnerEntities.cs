using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface IDeviceTypeAndOwnerRepository
    {
        /// <summary>
        /// Returns device list.
        /// </summary>
        /// <param name="groupId">Group Id. If equals -1 the method returns items of all groups.</param>
        /// <param name="userId">Id of the current user.</param>
        /// <returns>Device list.</returns>
        List<ViewDeviceTypeAndOwner> GetDeviceTypeAndOwnerList(Int64 groupId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class DeviceTypeAndOwnerRepository : IDeviceTypeAndOwnerRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewDeviceTypeAndOwner> GetDeviceTypeAndOwnerList(Int64 groupId, Guid userId)
        {
            var os = _db.ViewDeviceTypeAndOwner;
            return os.Where(t => (t.DataOwnerID == userId) && 
                (groupId == -1 || (t.GroupID == groupId))).ToList();
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestDeviceTypeAndOwnerRepository : IDeviceTypeAndOwnerRepository
    {
        public List<ViewDeviceTypeAndOwner> GetDeviceTypeAndOwnerList(Int64 groupId, Guid userId)
        {
            return new List<ViewDeviceTypeAndOwner>();
        }

        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
