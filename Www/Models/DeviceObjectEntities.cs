using System;

namespace web.Models
{
    public interface IDeviceObjectRepository
    {
        void AddAllAttrToCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId);
        void DeleteAllAttrFromCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId);
        void AddAllObjectAttrToCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId);
        void DeleteAllObjectAttrFromCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class DeviceObjectRepository : IDeviceObjectRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void AddAllAttrToCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
            _db.AddAllAttrToCollectList(deviceId, objectId, userId);
        }

        public void DeleteAllAttrFromCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
            _db.DeleteAllAttrFromCollectList(deviceId, objectId, userId);
        }

        public void AddAllObjectAttrToCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId)
        {
            _db.AddAllObjectAttrToCollectList(deviceId, logicalDeviceId, userId);
        }

        public void DeleteAllObjectAttrFromCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId)
        {
            _db.DeleteAllObjectAttrFromCollectList(deviceId, logicalDeviceId, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestDeviceObjectRepository : IDeviceObjectRepository
    {
        public void AddAllAttrToCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
        }

        public void DeleteAllAttrFromCollectList(Int64 objectId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
        }

        public void AddAllObjectAttrToCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId)
        {
        }

        public void DeleteAllObjectAttrFromCollectList(Int64 deviceId/*physical device identifier*/, Int64 logicalDeviceId, Guid userId)
        {
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }
    }
}