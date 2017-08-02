using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace web.Models
{
    public interface IDeviceTypeRepository
    {
        List<ViewDeviceType> GetDeviceTypeList(Guid userId, string description);
        ViewDeviceType GetDeviceType(Int64 id, Guid userId);
        SelectList GetDeviceTypes(Guid userId, Int64 selected, string description);
        SelectList GetDeviceTypes(Guid userId, string description);
        void CreateCustomDeviceType(Int64 id, Guid userId);
        void AddDeviceType(ViewDeviceType viewdevicetype, Guid userId);
        void DeleteDeviceType(Int64 id, Guid userId);
        void UpdateDeviceType(ViewDeviceType viewdevicetype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class DeviceTypeRepository : IDeviceTypeRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        //  Device types used in this application.
        public const string VideoRecorderTypeName = "Video Recorder";
        public const string SnapshotRecorderTypeName = "Snapshot Recorder";

        private static readonly List<string> AllDeviceTypeNames = new List<string>{VideoRecorderTypeName, SnapshotRecorderTypeName};

        public static string VideoRecorder {
            get { return VideoRecorderTypeName; }
        }
        public static string SnapshotRecorder {
            get { return SnapshotRecorderTypeName; }
        }
        public static List<string> DeviceTypes {
            get { return AllDeviceTypeNames; }
        }

        public List<ViewDeviceType> GetDeviceTypeList(Guid userId, string description)
        {
            var os = _db.ViewDeviceType;
            return os.Where(t => ((t.DataOwnerID == userId) || t.Standard) && 
                ((description == null) || (description.ToLower() == t.Description.ToLower()))).ToList();
        }

        public ViewDeviceType GetDeviceType(Int64 id, Guid userId)
        {
            var os = _db.ViewDeviceType;
            var result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || t.Standard));
            return result;
        }

        public void AddDeviceType(ViewDeviceType viewdevicetype, Guid userId)
        {
            _db.AddDeviceType(viewdevicetype.Description, userId, viewdevicetype.Standard);
        }

        public void DeleteDeviceType(Int64 id, Guid userId)
        {
            _db.DeleteDeviceType(id, userId);
        }

        public void UpdateDeviceType(ViewDeviceType viewdevicetype, Guid userId)
        {
            _db.UpdateDeviceType(viewdevicetype.ID, viewdevicetype.Description, userId, viewdevicetype.Standard);
        }

        public SelectList GetDeviceTypes(Guid userId, Int64 selected, string description)
        {
            var os = _db.ViewDeviceType;
            return new SelectList(os.Where(t => ((t.DataOwnerID == userId) || t.Standard) &&
                ((description == null) || (description.ToLower() == t.Description.ToLower()))), "ID", "Description", selected);
        }

        public SelectList GetDeviceTypes(Guid userId, string description)
        {
            return GetDeviceTypes(userId, 0, description);
        }

        public void CreateCustomDeviceType(Int64 id, Guid userId)
        {
            _db.CreateCustomDeviceType(id, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestDeviceTypeRepository : IDeviceTypeRepository
    {
        public List<ViewDeviceType> GetDeviceTypeList(Guid userId, string description)
        {
            return new List<ViewDeviceType>();
        }

        public ViewDeviceType GetDeviceType(Int64 id, Guid userId)
        {
            return new ViewDeviceType();
        }

        public SelectList GetDeviceTypes(Guid userId, Int64 selected, string description)
        {
            return new SelectList(new List<String>(), "", "");
        }

        public SelectList GetDeviceTypes(Guid userId, string description)
        {
            return GetDeviceTypes(userId, 0, description);
        }

        public void AddDeviceType(ViewDeviceType viewdevicetype, Guid userId) { }
        public void DeleteDeviceType(Int64 id, Guid userId) { }
        public void UpdateDeviceType(ViewDeviceType viewdevicetype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
        public void CreateCustomDeviceType(Int64 id, Guid userId) { }
    }
}
