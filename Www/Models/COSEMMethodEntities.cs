using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;

namespace web.Models
{
    public interface ICosemMethodRepository
    {
        List<ViewCOSEMMethod> GetCosemMethodList(Int64 cosemClassId, Guid userId);
        ViewCOSEMMethod GetCosemMethod(Int64 id, Guid userId);
        void AddCosemMethod(ViewCOSEMMethod viewCosemMethod, Guid userId);
        void DeleteCosemMethod(Int64 id, Guid userId);
        void UpdateCosemMethod(ViewCOSEMMethod viewCosemMethodtype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemMethodRepository : ICosemMethodRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMMethod> GetCosemMethodList(Int64 cosemClassId, Guid userId)
        {
            var os = _db.ViewCOSEMMethod;
            return os.Where(t => (t.COSEMClassID == cosemClassId) && ((t.DataOwnerID == userId) || t.Standard)).ToList();
        }

        public ViewCOSEMMethod GetCosemMethod(Int64 id, Guid userId)
        {
            var os = _db.ViewCOSEMMethod;
            var result = os.Single(t => (t.ID == id) && ((t.DataOwnerID == userId) || t.Standard));
            return result;
        }

        public void AddCosemMethod(ViewCOSEMMethod viewCosemMethod, Guid userId)
        {
            _db.AddCOSEMMethod(viewCosemMethod.COSEMClassID, viewCosemMethod.Name, viewCosemMethod.Mandatory, userId);
        }

        public void DeleteCosemMethod(Int64 id, Guid userId)
        {
            _db.DeleteCOSEMMethod(id, userId);
        }

        public void UpdateCosemMethod(ViewCOSEMMethod viewCosemMethodtype, Guid userId)
        {
            _db.UpdateCOSEMMethod(viewCosemMethodtype.ID, viewCosemMethodtype.COSEMClassID, viewCosemMethodtype.Name, viewCosemMethodtype.Mandatory, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemMethodRepository : ICosemMethodRepository
    {
        public int CosemMethodRowAffected;

        public List<ViewCOSEMMethod> GetCosemMethodList(Int64 cosemClassId, Guid userId)
        {
            return new List<ViewCOSEMMethod>();
        }

        public ViewCOSEMMethod GetCosemMethod(Int64 id, Guid userId)
        {
            return new ViewCOSEMMethod();
        }

        public void AddCosemMethod(ViewCOSEMMethod viewCosemMethod, Guid userId) { CosemMethodRowAffected++; }
        public void DeleteCosemMethod(Int64 id, Guid userId) { }
        public void UpdateCosemMethod(ViewCOSEMMethod viewCosemMethodtype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
