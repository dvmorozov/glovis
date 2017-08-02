using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface IChartSetChartsRepository
    {
        List<ViewChartSetsCharts> GetChartSetChartsList(long? chartSetId, Guid userId);
        //  https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
        List<ViewChartSetsChartsExt> GetChartSetChartsListExt(long? chartSetId, Guid userId);
        ViewChartSetsCharts GetChartSetChart(long? chartSetId, Int64 chartId, Guid userId);
        void AddChartSetsCharts(ViewChartSetsCharts v, Guid userId);
        void DeleteChartSetsCharts(Int64 chartSetId, Int64 chartId, Guid userId);
        void UpdateChartSetsCharts(ViewChartSetsCharts v, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class ChartSetChartsRepository : IChartSetChartsRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewChartSetsCharts> GetChartSetChartsList(long? chartSetId, Guid userId)
        {
            var os = _db.GetChartSetCharts(chartSetId, userId);
            return os.ToList();
        }

        //  https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
        public List<ViewChartSetsChartsExt> GetChartSetChartsListExt(long? chartSetId, Guid userId)
        {
            var os = _db.GetChartSetChartsExt(chartSetId, userId);
            return os.ToList();
        }

        public ViewChartSetsCharts GetChartSetChart(long? chartSetId, Int64 chartId, Guid userId)
        {
            var os = _db.ViewChartSetsCharts;
            var result = os.Single(t => (t.ChartID == chartId) && (chartSetId == null || t.ChartSetID == chartSetId) && (t.DataOwnerID == userId));
            return result;
        }

        public void AddChartSetsCharts(ViewChartSetsCharts v, Guid userId)
        {
            _db.AddChartSetsCharts(v.ChartSetID, v.ChartID, v.ColIndex, v.RowIndex, userId);
        }

        public void DeleteChartSetsCharts(Int64 chartSetId, Int64 chartId, Guid userId)
        {
            _db.DeleteChartSetsCharts(chartSetId, chartId, userId);
        }

        public void UpdateChartSetsCharts(ViewChartSetsCharts v, Guid userId)
        {
            _db.UpdateChartSetsCharts(v.ChartSetID, v.ChartID, v.ColIndex, v.RowIndex, userId);
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestChartSetChartsRepository : IChartSetChartsRepository
    {
        public int DeviceRowAffected;

        public TestChartSetChartsRepository()
        {
            DeviceRowAffected = 0;
        }

        public List<ViewChartSetsCharts> GetChartSetChartsList(long? chartSetId, Guid userId)
        {
            return new List<ViewChartSetsCharts>();
        }

        public ViewChartSetsCharts GetChartSetChart(long? chartSetId, Int64 chartId, Guid userId)
        {
            return new ViewChartSetsCharts();
        }

        public void AddChartSetsCharts(ViewChartSetsCharts v, Guid userId)
        {
            DeviceRowAffected++;
        }

        public void DeleteChartSetsCharts(Int64 chartSetId, Int64 chartId, Guid userId) { }
        public void UpdateChartSetsCharts(ViewChartSetsCharts v, Guid userId) { }
        public void SetEntities(GlovisMasterBaseEntities entities) { }

        //  https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
        public List<ViewChartSetsChartsExt> GetChartSetChartsListExt(long? chartSetId, Guid userId)
        {
            throw new NotImplementedException();
        }
    }
}
