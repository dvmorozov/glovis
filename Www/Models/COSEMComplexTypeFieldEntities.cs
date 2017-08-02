using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace web.Models
{
    public interface ICosemComplexTypeFieldRepository
    {
        List<ViewCOSEMComplexTypeField> GetCosemComplexTypeFieldList(Int64 typeId, Guid userId);
        ViewCOSEMComplexTypeField GetCosemComplexTypeField(Int64 id, Guid userId);
        SelectList GetCosemComplexTypeFields(Guid userId, Int64 selected);
        void AddCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeField, Guid userId);
        void DeleteCosemComplexTypeField(Int64 id, Guid userId);
        void UpdateCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeFieldtype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemComplexTypeFieldRepository : ICosemComplexTypeFieldRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMComplexTypeField> GetCosemComplexTypeFieldList(Int64 typeId, Guid userId)
        {
            var os = _db.ViewCOSEMComplexTypeField;
            return os.Where(t => ((t.DataOwnerID == userId) || t.Standard) && (t.AggregateTypeID == typeId)).ToList();
        }

        public SelectList GetCosemComplexTypeFields(Guid userId, Int64 selected)
        {
            var os = _db.ViewCOSEMComplexTypeField;
            return new SelectList(os.Where(t => (t.DataOwnerID == userId) || t.Standard), "ID", "ClassName", selected);
        }

        public ViewCOSEMComplexTypeField GetCosemComplexTypeField(Int64 id, Guid userId)
        {
            var os = _db.ViewCOSEMComplexTypeField;
            var result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || t.Standard));
            return result;
        }

        public void AddCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeField, Guid userId)
        {
            _db.AddCOSEMComplexTypeField(viewCosemComplexTypeField.Name, viewCosemComplexTypeField.AggregateTypeID, viewCosemComplexTypeField.TypeID, userId, viewCosemComplexTypeField.Standard);
        }

        public void DeleteCosemComplexTypeField(Int64 id, Guid userId)
        {
            _db.DeleteCOSEMComplexTypeField(id, userId);
        }

        public void UpdateCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeFieldtype, Guid userId)
        {
            _db.UpdateCOSEMComplexTypeField(viewCosemComplexTypeFieldtype.ID, viewCosemComplexTypeFieldtype.Name, viewCosemComplexTypeFieldtype.AggregateTypeID, viewCosemComplexTypeFieldtype.TypeID, userId, viewCosemComplexTypeFieldtype.Standard);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemComplexTypeFieldRepository : ICosemComplexTypeFieldRepository
    {
        public int CosemComplexTypeFieldRowAffected;

        public List<ViewCOSEMComplexTypeField> GetCosemComplexTypeFieldList(Int64 typeId, Guid userId)
        {
            return new List<ViewCOSEMComplexTypeField>();
        }

        public ViewCOSEMComplexTypeField GetCosemComplexTypeField(Int64 id, Guid userId)
        {
            return new ViewCOSEMComplexTypeField();
        }

        public SelectList GetCosemComplexTypeFields(Guid userId, Int64 selected)
        {
            return new SelectList(new List<String>(), "", "");
        }

        public void AddCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeField, Guid userId) { CosemComplexTypeFieldRowAffected++; }
        public void DeleteCosemComplexTypeField(Int64 id, Guid userId) { }
        public void UpdateCosemComplexTypeField(ViewCOSEMComplexTypeField viewCosemComplexTypeFieldtype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
