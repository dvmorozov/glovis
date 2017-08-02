using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;

namespace web.Models
{
    public interface ICosemLogicalDeviceRepository
    {
        List<ViewCOSEMLogicalDevice> GetCosemLogicalDeviceList(Int64 deviceTypeId, Guid userId);
        ViewCOSEMLogicalDevice GetCosemLogicalDevice(Int64 id, Guid userId);
        String GetCosemLogicalDeviceName(Int64 deviceTypeId);
        void AddCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevice, Guid userId);
        void DeleteCosemLogicalDevice(Int64 id, Guid userId);
        void UpdateCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevicetype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemLogicalDeviceRepository : ICosemLogicalDeviceRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMLogicalDevice> GetCosemLogicalDeviceList(Int64 deviceTypeId, Guid userId)
        {
            ObjectSet<ViewCOSEMLogicalDevice> os = _db.ViewCOSEMLogicalDevice;
            return os.Where(t => ((t.DataOwnerID == userId) || (t.Standard == true)) && (t.DeviceTypeID == deviceTypeId)).ToList();
        }

        public ViewCOSEMLogicalDevice GetCosemLogicalDevice(Int64 id, Guid userId)
        {
            ObjectSet<ViewCOSEMLogicalDevice> os = _db.ViewCOSEMLogicalDevice;
            ViewCOSEMLogicalDevice result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || (t.Standard == true)));
            return result;
        }

        public void AddCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevice, Guid userId)
        {
            _db.AddCOSEMLogicalDevice(viewCosemLogicalDevice.DeviceTypeID, userId, viewCosemLogicalDevice.Name);
        }

        public void DeleteCosemLogicalDevice(Int64 id, Guid userId)
        {
            _db.DeleteCOSEMLogicalDevice(id, userId);
        }

        public void UpdateCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevicetype, Guid userId)
        {
            _db.UpdateCOSEMLogicalDevice(viewCosemLogicalDevicetype.ID, viewCosemLogicalDevicetype.DeviceTypeID, userId, viewCosemLogicalDevicetype.Name);
        }

        public String GetCosemLogicalDeviceName(Int64 deviceTypeId)
        {
            ObjectResult<String> s = _db.GetLogicalDeviceName(deviceTypeId);
            return s.First();
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemLogicalDeviceRepository : ICosemLogicalDeviceRepository
    {
        public int CosemLogicalDeviceRowAffected;

        public List<ViewCOSEMLogicalDevice> GetCosemLogicalDeviceList(Int64 deviceTypeId, Guid userId)
        {
            return new List<ViewCOSEMLogicalDevice>();
        }

        public ViewCOSEMLogicalDevice GetCosemLogicalDevice(Int64 id, Guid userId)
        {
            return new ViewCOSEMLogicalDevice();
        }

        public String GetCosemLogicalDeviceName(Int64 deviceTypeId)
        {
            return "undefined";
        }

        public void AddCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevice, Guid userId) { CosemLogicalDeviceRowAffected++; }
        public void DeleteCosemLogicalDevice(Int64 id, Guid userId) { }
        public void UpdateCosemLogicalDevice(ViewCOSEMLogicalDevice viewCosemLogicalDevicetype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
