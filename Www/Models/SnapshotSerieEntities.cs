using System;
using System.Collections.Generic;
using System.Linq;

namespace web.Models
{
    public interface ISnapshotSerieRepository
    {
        void SetEntities(GlovisMasterBaseEntities entities);
        List<ViewFile> GetPrevSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId);
        List<ViewFile> GetNextSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId);
        List<ViewFile> GetFirstSnapshotAsXml(string serieId, Guid dataOwnerId);
        List<ViewFile> GetLastSnapshotAsXml(string serieId, Guid dataOwnerId);
    }

    public class SnapshotSerieRepository : ISnapshotSerieRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewFile> GetPrevSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId)
        {
            var os = _db.GetPrevSnapshotAsXML(new Guid(serieId), snapshotId, dataOwnerId);
            return os.ToList();
        }

        public List<ViewFile> GetNextSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId)
        {
            var os = _db.GetNextSnapshotAsXML(new Guid(serieId), snapshotId, dataOwnerId);
            return os.ToList();
        }

        public List<ViewFile> GetFirstSnapshotAsXml(string serieId, Guid dataOwnerId)
        {
            var os = _db.GetFirstSnapshotAsXML(new Guid(serieId), dataOwnerId);
            return os.ToList();
        }

        public List<ViewFile> GetLastSnapshotAsXml(string serieId, Guid dataOwnerId)
        {
            var os = _db.GetLastSnapshotAsXML(new Guid(serieId), dataOwnerId);
            return os.ToList();
        }

        public List<ViewElementFiltered> GetFilteredByDeviceTypeElements(long? ownerId, long? groupId, long? locationId, Guid userId, long? chartId)
        {
            var os = _db.GetFilteredByDeviceTypeElements(DeviceTypeRepository.VideoRecorder, ownerId, groupId, locationId, userId, chartId);
            var l = os.ToList();
            return l;
        }

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

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }
    }

    public class TestSnapshotSerieRepository : ISnapshotSerieRepository
    {
        public int DeviceRowAffected;

        public TestSnapshotSerieRepository()
        {
            DeviceRowAffected = 0;
        }

        public void SetEntities(GlovisMasterBaseEntities entities) { }

        public List<ViewFile> GetPrevSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId)
        {
            return new List<ViewFile>();
        }

        public List<ViewFile> GetNextSnapshotAsXml(string serieId, Int64 snapshotId, Guid dataOwnerId)
        {
            return new List<ViewFile>();
        }

        public List<ViewFile> GetFirstSnapshotAsXml(string serieId, Guid dataOwnerId)
        {
            return new List<ViewFile>();
        }

        public List<ViewFile> GetLastSnapshotAsXml(string serieId, Guid dataOwnerId)
        {
            return new List<ViewFile>();
        }
    }
}
