using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface IChartSetRepository
    {
        List<ViewChartSet> GetChartSetList(Guid userId);
        ViewChartSet GetChartSet(Int64 id, Guid userId);
        void AddChartSet(ViewChartSet v, Guid userId);
        void DeleteChartSet(Int64 id, Guid userId);
        void UpdateChartSet(ViewChartSet v, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class ChartSetRepository : IChartSetRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewChartSet> GetChartSetList(Guid userId)
        {
            var os = _db.ViewChartSet;
            return os.Where(t => t.DataOwnerID == userId).ToList();
        }

        public ViewChartSet GetChartSet(Int64 id, Guid userId)
        {
            var os = _db.ViewChartSet;
            var result = os.Single(t => (t.ID == id) && (t.DataOwnerID == userId));
            return result;
        }

        public void AddChartSet(ViewChartSet v, Guid userId)
        {
            _db.AddChartSet(v.Name, v.CellWidth, v.CellHeight, v.Rows, v.Cols, v.Margin, userId);
        }

        public void DeleteChartSet(Int64 id, Guid userId)
        {
            _db.DeleteChartSet(id, userId);
        }

        public void UpdateChartSet(ViewChartSet v, Guid userId)
        {
            _db.UpdateChartSet(v.Name, v.ID, v.CellWidth, v.CellHeight, v.Rows, v.Cols, v.Margin, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestChartSetRepository : IChartSetRepository
    {
        public int DeviceRowAffected;

        public TestChartSetRepository()
        {
            DeviceRowAffected = 0;
        }

        public List<ViewChartSet> GetChartSetList(Guid userId)
        {
            return new List<ViewChartSet>();
        }

        public ViewChartSet GetChartSet(Int64 id, Guid userId)
        {
            return new ViewChartSet();
        }

        public void AddChartSet(ViewChartSet v, Guid userId)
        {
            DeviceRowAffected++;
        }

        public void DeleteChartSet(Int64 id, Guid userId) { }
        public void UpdateChartSet(ViewChartSet v, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }
    }
}
