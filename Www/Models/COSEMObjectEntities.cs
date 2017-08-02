using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace web.Models
{
    public interface ICosemObjectRepository
    {
        List<ViewCOSEMObject> GetCosemObjectList(Int64 logicalDeviceId, Guid userId);
        ViewCOSEMObject GetCosemObject(Int64 id, Guid userId);
        SelectList GetCosemObjects(Guid userId, Int64 selected);
        void AddCosemObject(ViewCOSEMObject viewCosemObject, Guid userId);
        void DeleteCosemObject(Int64 id, Guid userId);
        void UpdateCosemObject(ViewCOSEMObject viewCosemObjecttype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemObjectRepository : ICosemObjectRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMObject> GetCosemObjectList(Int64 logicalDeviceId, Guid userId)
        {
            var os = _db.ViewCOSEMObject;
            return os.Where(t => ((t.DataOwnerID == userId) || t.Standard) && (t.COSEMLogicalDeviceID == logicalDeviceId)).ToList();
        }

        public SelectList GetCosemObjects(Guid userId, Int64 selected)
        {
            var os = _db.ViewCOSEMObject;
            return new SelectList(os.Where(t => (t.DataOwnerID == userId) || t.Standard), "ID", "ClassName", selected);
        }

        public ViewCOSEMObject GetCosemObject(Int64 id, Guid userId)
        {
            var os = _db.ViewCOSEMObject;
            var result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || t.Standard));
            return result;
        }

        public void AddCosemObject(ViewCOSEMObject viewCosemObject, Guid userId)
        {
            _db.AddCOSEMObject(viewCosemObject.COSEMLogicalDeviceID, viewCosemObject.COSEMClassID, viewCosemObject.DeviceTypeID, viewCosemObject.COSEMLogicalName, userId);
        }

        public void DeleteCosemObject(Int64 id, Guid userId)
        {
            _db.DeleteCOSEMObject(id, userId);
        }

        public void UpdateCosemObject(ViewCOSEMObject viewCosemObjecttype, Guid userId)
        {
            _db.UpdateCOSEMObject(viewCosemObjecttype.ID, viewCosemObjecttype.COSEMLogicalDeviceID, viewCosemObjecttype.COSEMClassID, viewCosemObjecttype.DeviceTypeID, viewCosemObjecttype.COSEMLogicalName, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemObjectRepository : ICosemObjectRepository
    {
        public int CosemObjectRowAffected;

        public List<ViewCOSEMObject> GetCosemObjectList(Int64 logicalDeviceId, Guid userId)
        {
            return new List<ViewCOSEMObject>();
        }

        public ViewCOSEMObject GetCosemObject(Int64 id, Guid userId)
        {
            return new ViewCOSEMObject();
        }

        public SelectList GetCosemObjects(Guid userId, Int64 selected)
        {
            return new SelectList(new List<String>(), "", "");
        }

        public void AddCosemObject(ViewCOSEMObject viewCosemObject, Guid userId) { CosemObjectRowAffected++; }
        public void DeleteCosemObject(Int64 id, Guid userId) { }
        public void UpdateCosemObject(ViewCOSEMObject viewCosemObjecttype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
