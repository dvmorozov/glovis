using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace web.Models
{
    public interface IObisSetRepository
    {
        List<ViewOBISSet> GetObisSetList(Guid userId);
        ViewOBISSet GetObisSet(Int64 id, Guid userId);
        void AddObisSet(ViewOBISSet viewObisSet, Guid userId);
        void DeleteObisSet(Int64 id, Guid userId);
        void UpdateObisSet(ViewOBISSet viewObisSettype, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class ObisSetRepository : IObisSetRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewOBISSet> GetObisSetList(Guid userId)
        {
            var os = _db.ViewOBISSet;
            return os.Where(t => t.DataOwnerID == userId).ToList();
        }

        public ViewOBISSet GetObisSet(Int64 id, Guid userId)
        {
            var os = _db.ViewOBISSet;
            var result = os.Single(t => (t.ID == id) && (t.DataOwnerID == userId));
            return result;
        }

        public void AddObisSet(ViewOBISSet viewObisSet, Guid userId)
        {
            _db.AddOBISSet(viewObisSet.AID, viewObisSet.BID, viewObisSet.CID, viewObisSet.DID, viewObisSet.EID, viewObisSet.FID, viewObisSet.DeviceTypeID, userId, viewObisSet.Standard);
        }

        public void DeleteObisSet(Int64 id, Guid userId)
        {
            _db.DeleteOBISSet(id, userId);
        }

        public void UpdateObisSet(ViewOBISSet viewObisSettype, Guid userId)
        {
            _db.UpdateOBISSet(viewObisSettype.ID, viewObisSettype.AID, viewObisSettype.BID, viewObisSettype.CID, viewObisSettype.DID, viewObisSettype.EID, viewObisSettype.FID, viewObisSettype.DeviceTypeID, userId, viewObisSettype.Standard);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestObisSetRepository : IObisSetRepository
    {
        public int ObisSetRowAffected;

        public List<ViewOBISSet> GetObisSetList(Guid userId)
        {
            return new List<ViewOBISSet>();
        }

        public ViewOBISSet GetObisSet(Int64 id, Guid userId)
        {
            return new ViewOBISSet();
        }

        public SelectList GetObisSets(Guid userId)
        {
            return new SelectList(new List<String>(), "", "");
        }

        public void AddObisSet(ViewOBISSet viewObisSet, Guid userId) { ObisSetRowAffected++; }
        public void DeleteObisSet(Int64 id, Guid userId) { }
        public void UpdateObisSet(ViewOBISSet viewObisSettype, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
