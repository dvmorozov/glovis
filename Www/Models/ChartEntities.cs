using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface IChartRepository
    {
        void AddElementToChart(Int64 elementId, Int64 chartId, Guid dataOwnerId);
        void DeleteElementFromChart(Int64 elementId, Int64 chartId, Guid dataOwnerId);
        List<long?> GetChartElements(Int64 chartId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
        string GetChartType(long id /*chart id.*/);
    }

    public class ChartRepository : IChartRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void AddElementToChart(Int64 elementId, Int64 chartId, Guid dataOwnerId)
        {
            _db.AddElementToChart(elementId, chartId, dataOwnerId);
        }

        public void DeleteElementFromChart(Int64 elementId, Int64 chartId, Guid dataOwnerId)
        {
            _db.DeleteElementFromChart(chartId, elementId, dataOwnerId);
        }

        public List<long?> GetChartElements(Int64 chartId, Guid userId)
        {
            var os = _db.GetChartElements(chartId, userId);
            return os.ToList();
        }

        public string GetChartType(long id /*chart id.*/)
        {
            return _db.ViewChart.Single(t => t.ID == id).ChartType;
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestChartRepository : IChartRepository
    {
        public int DeviceRowAffected;

        public TestChartRepository()
        {
            DeviceRowAffected = 0;
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }

        public void AddElementToChart(Int64 elementId, Int64 chartId, Guid dataOwnerId)
        {
        }

        public void DeleteElementFromChart(Int64 elementId, Int64 chartId, Guid dataOwnerId)
        {
        }

        public List<long?> GetChartElements(Int64 chartId, Guid userId)
        {
            return new List<long?>();
        }

        public string GetChartType(long id /*chart id.*/)
        {
            return "video";
        }
    }
}