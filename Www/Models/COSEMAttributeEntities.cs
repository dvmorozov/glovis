
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;

namespace web.Models
{
    public interface ICosemAttributeRepository
    {
        List<ViewCOSEMAttribute> GetCosemAttributeList(Int64 cosemClassId, Guid userId);
        ViewCOSEMAttribute GetCosemAttribute(Int64 id, Guid userId);
        void AddCosemAttribute(ViewCOSEMAttribute viewCosemAttribute, Guid userId);
        void DeleteCosemAttribute(Int64 id, Guid userId);
        void UpdateCosemAttribute(ViewCOSEMAttribute viewCosemAttributetype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemAttributeRepository : ICosemAttributeRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMAttribute> GetCosemAttributeList(Int64 cosemClassId, Guid userId)
        {
            ObjectSet<ViewCOSEMAttribute> os = _db.ViewCOSEMAttribute;
            return os.Where(t => ((t.DataOwnerID == userId) || t.Standard) && 
                (t.COSEMClassID == cosemClassId)).ToList();
        }

        public ViewCOSEMAttribute GetCosemAttribute(Int64 id, Guid userId)
        {
            ObjectSet<ViewCOSEMAttribute> os = _db.ViewCOSEMAttribute;
            ViewCOSEMAttribute result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || t.Standard));
            return result;
        }

        public void AddCosemAttribute(ViewCOSEMAttribute viewCosemAttribute, Guid userId)
        {
            _db.AddCOSEMAttribute(viewCosemAttribute.COSEMClassID, viewCosemAttribute.Dynamic, 
                viewCosemAttribute.Name, viewCosemAttribute.COSEMDataTypeID, viewCosemAttribute.MinValue, 
                viewCosemAttribute.MaxValue, viewCosemAttribute.DefValue, userId);
        }

        public void DeleteCosemAttribute(Int64 id, Guid userId)
        {
            _db.DeleteCOSEMAttribute(id, userId);
        }

        public void UpdateCosemAttribute(ViewCOSEMAttribute viewCosemAttributetype, Guid userId)
        {
            _db.UpdateCOSEMAttribute(
                viewCosemAttributetype.ID, viewCosemAttributetype.COSEMClassID, viewCosemAttributetype.Dynamic, viewCosemAttributetype.Name, 
                viewCosemAttributetype.COSEMDataTypeID, viewCosemAttributetype.MinValue, viewCosemAttributetype.MaxValue, 
                viewCosemAttributetype.DefValue, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemAttributeRepository : ICosemAttributeRepository
    {
        public int CosemAttributeRowAffected;

        public List<ViewCOSEMAttribute> GetCosemAttributeList(Int64 cosemClassId, Guid userId)
        {
            return new List<ViewCOSEMAttribute>();
        }

        public ViewCOSEMAttribute GetCosemAttribute(Int64 id, Guid userId)
        {
            return new ViewCOSEMAttribute();
        }

        public void AddCosemAttribute(ViewCOSEMAttribute viewCosemAttribute, Guid userId) { CosemAttributeRowAffected++; }
        public void DeleteCosemAttribute(Int64 id, Guid userId) { }
        public void UpdateCosemAttribute(ViewCOSEMAttribute viewCosemAttributetype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
