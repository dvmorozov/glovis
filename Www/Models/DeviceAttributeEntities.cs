
using System;

namespace web.Models
{
    public interface IDeviceAttributeRepository
    {
        void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId);
        void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId);
        void AddAttrToCollectList(Int64 deviceId, Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId);
        void DeleteAttrFromCollectList(Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class DeviceAttributeRepository : IDeviceAttributeRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId)
        {
            _db.AddAllAttrToCollectList(logicalDeviceId, objectId, userId);
        }

        public void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId)
        {
            _db.DeleteAllAttrFromCollectList(logicalDeviceId, objectId, userId);
        }

        public void AddAttrToCollectList(Int64 deviceId, Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId)
        {
            _db.AddAttrToCollectList(deviceId, cosemAttributeId, cosemObjectId, userId);
        }

        public void DeleteAttrFromCollectList(Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId)
        {
            _db.DeleteAttrFromCollectList(cosemAttributeId, cosemObjectId, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestDeviceAttributeRepository : IDeviceAttributeRepository
    {
        public void AddAllAttrToCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId)
        {
        }

        public void DeleteAllAttrFromCollectList(Int64 logicalDeviceId, Int64 objectId, Guid userId)
        {
        }

        public void AddAttrToCollectList(Int64 deviceId, Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId)
        {
        }

        public void DeleteAttrFromCollectList(Int64 cosemAttributeId, Int64 cosemObjectId, Guid userId)
        { 
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }
    }
}