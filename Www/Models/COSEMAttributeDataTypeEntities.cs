using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface ICosemAttributeDataTypeRepository
    {
        List<ViewCOSEMAttributeDataType> GetCosemAttributeDataTypeList(Int64 cosemObjectId, Guid userId);
        ViewCOSEMAttributeDataType GetCosemAttributeDataType(Int64 cosemObjectId, Int64 attributeId, Guid userId);
        void UpdateAttrIdentifier(ViewCOSEMAttributeDataType v, Guid userId);

        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class CosemAttributeDataTypeRepository : ICosemAttributeDataTypeRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewCOSEMAttributeDataType> GetCosemAttributeDataTypeList(Int64 cosemObjectId, Guid userId)
        {
            var os = _db.ViewCOSEMAttributeDataType;
            return os.Where(t => (t.DataOwnerID == userId || t.Standard) && (t.COSEMObjectID == cosemObjectId)).ToList();
        }

        public ViewCOSEMAttributeDataType GetCosemAttributeDataType(Int64 cosemObjectId, Int64 attributeId, Guid userId)
        {
            return _db.ViewCOSEMAttributeDataType.Single(t => (t.COSEMObjectID == cosemObjectId) && (t.AttributeID == attributeId) && (t.DataOwnerID == userId || t.Standard));
        }

        public void UpdateAttrIdentifier(ViewCOSEMAttributeDataType v, Guid userId)
        {
            _db.UpdateAttrIdentifier(v.Identifier, v.AttributeID, v.COSEMObjectID, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestCosemAttributeDataTypeRepository : ICosemAttributeDataTypeRepository
    {
        public List<ViewCOSEMAttributeDataType> GetCosemAttributeDataTypeList(Int64 cosemObjectId, Guid userId)
        {
            return new List<ViewCOSEMAttributeDataType>();
        }

        public ViewCOSEMAttributeDataType GetCosemAttributeDataType(Int64 cosemObjectId, Int64 attributeId, Guid userId)
        {
            return new ViewCOSEMAttributeDataType();
        }

        public void UpdateAttrIdentifier(ViewCOSEMAttributeDataType v, Guid userId)
        { 
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }
    }
}