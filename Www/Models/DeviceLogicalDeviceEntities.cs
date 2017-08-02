using System;

namespace web.Models
{
    public interface IDeviceLogicalDeviceRepository
    {
        void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId);
        void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId);
        void AddAllDeviceAttrToCollectList(Int64 physicalDeviceId, Guid userId);
        void DeleteAllDeviceAttrFromCollectList(Int64 logicalDeviceId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class DeviceLogicalDeviceRepository : IDeviceLogicalDeviceRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
            _db.AddAllAttrToCollectList(deviceId, logicalDeviceId, userId);
        }

        public void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
            _db.DeleteAllAttrFromCollectList(deviceId, logicalDeviceId, userId);
        }

        public void AddAllDeviceAttrToCollectList(Int64 physicalDeviceId, Guid userId)
        {
            _db.AddAllDeviceAttrToCollectList(physicalDeviceId, userId);
        }

        public void DeleteAllDeviceAttrFromCollectList(Int64 logicalDeviceId, Guid userId)
        {
            _db.DeleteAllDeviceAttrFromCollectList(logicalDeviceId, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestDeviceLogicalDeviceRepository : IDeviceLogicalDeviceRepository
    {
        public void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
        }

        public void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 deviceId/*physical device identifier*/, Guid userId)
        {
        }

        public void AddAllDeviceAttrToCollectList(Int64 physicalDeviceId, Guid userId)
        {
        }

        public void DeleteAllDeviceAttrFromCollectList(Int64 logicalDeviceId, Guid userId)
        {
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }
    }
}