using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Globalization;
using System.Linq;
using LibProcessLog;

namespace web.Models
{
    public class AppNames
    {
        //  Name of the demo-site.
        private readonly string _an1 = "OONZE";
        private readonly string _an2 = "";

        public AppNames()
        {
#if !_DEMO
            var appSettings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            _an1 = appSettings["AppName1"];
            _an2 = appSettings["AppName2"];
#endif
        }

        public string AppName {
            //  Forms the full brand name.
            get { return _an1 + _an2; }
        }

        public string AppName1
        {
            get { return _an1; }
        }

        public string AppName2
        {
            get { return _an2; }
        }
    }

    public class ViewSeriesItem
    {
        //  https://www.evernote.com/shard/s132/nl/14501366/0c72dbf8-723f-4c7a-a59e-604836dc5f6e
        //  Name of serie. 
        public string Name { get; set; }
        
        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }

        public long Count { get; set; }

        public string Id { get; set; }

        //  https://www.evernote.com/shard/s132/nl/14501366/0c72dbf8-723f-4c7a-a59e-604836dc5f6e
        //  URL to the first item of the serie (it can be either videofragment or snapshot).
        public string FirstItemUrl { get; set; }
    };

    public interface IBaseChartRepository
    {
        //  evernote:///view/14501366/s132/4e63229b-4ad2-499e-adf7-9df596b40a2a/4e63229b-4ad2-499e-adf7-9df596b40a2a/
        List<ViewDataPoint> GetSerie(string serieId, Guid userId);
        //  https://www.evernote.com/shard/s132/nl/14501366/9b13b017-204d-4dbc-9b38-a244e29a843f
        void DeleteSerie(string serieId, Guid userId);
        List<ViewChart> GetChartList(Guid userId);
        List<ViewSeriesItem> GetSerieList(Int64 chartId, Guid userId);
        List<ViewElementOwner> GetElementOwnerList(Guid userId);
        List<ViewElementInstanceName> GetElementInstanceNameList();
        List<ViewElementLocation> GetElementLocationList(Guid userId);
        List<ViewElementGroup> GetElementGroupList(Guid userId);

        List<ViewElementFiltered> GetElementFilteredList(String elementLogicalName, long? ownerId, long? groupId,
                                                         long? locationId, Guid userId, long? chartId);

        List<ViewElementFiltered> GetFilteredByDeviceTypeElements(long? ownerId, long? groupId, long? locationId,
                                                                  Guid userId, long? chartId);

        List<long?> GetChartElements(Int64 chartId, Guid userId);
        ViewChart GetChart(Int64 id, Guid userId);
        void AddChart(ViewChart v, Guid userId);
        void DeleteChart(Int64 id, Guid userId);
        void UpdateChart(ViewChart v, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
        List<ViewFile> GetPointsVsAcqTime_Last(Int64 chartId, Guid dataOwnerId, Int64 lastPointCount);
        List<ViewFile> GetPointsVsAcqTime_Stat_Last(Int64 chartId, Guid dataOwnerId, Int64 lastPointCount);
    }

    public class BaseChartRepository : IBaseChartRepository
    {
        private readonly AppNames _appNames = new AppNames();
        protected GlovisMasterBaseEntities Db; // = new GlovisMasterBaseEntities();
        private readonly ProcessLog _pl;

        private readonly string _wwwRoot = "C:\\inetpub\\wwwroot\\";

        public BaseChartRepository()
        {
            _pl = new ProcessLog(_appNames.AppName);
            var appSettings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            try
            {
                _wwwRoot = appSettings["WwwRoot"];
            }
            catch (Exception e)
            {
                _pl.AddMessageAnyway("Error in reading configuration parameter \"WwwRoot\": " + ProcessLog.GetExceptionMessage(e), _appNames.AppName);
            }
        }

        //  evernote:///view/14501366/s132/4e63229b-4ad2-499e-adf7-9df596b40a2a/4e63229b-4ad2-499e-adf7-9df596b40a2a/
        public List<ViewDataPoint> GetSerie(string serieId, Guid userId)
        {
            return Db.ViewDataPoint.Where(t => t.Units.Trim() == serieId.Trim() && t.DataOwnerID == userId).ToList();
        }

        public void DeleteSerie(string serieId, Guid userId)
        {
            Db.DeleteSerie(Guid.Parse(serieId), userId);
        }

        public List<ViewChart> GetChartList(Guid userId)
        {
            var os = Db.ViewChart;
            return os.Where(t => t.DataOwnerID == userId).ToList();
        }

        public List<ViewSeriesItem> GetSerieList(Int64 chartId, Guid userId)
        {
            var os = Db.GetSnapshotSerieList(chartId, userId);

            var result = os.ToList();
            var result2 = new List<ViewSeriesItem>();

            for (var i = 0; i < result.Count(); i++)
            {
                var vs = result[i];
                var item = new ViewSeriesItem
                    {
                        Name = (i + 1).ToString(CultureInfo.InvariantCulture),
                        StartTime = vs.StartTime,
                        EndTime = vs.EndTime,
                        Count = vs.Count,
                        Id = vs.Units
                    };
                //  https://www.evernote.com/shard/s132/nl/14501366/0c72dbf8-723f-4c7a-a59e-604836dc5f6e
                item.FirstItemUrl = GetSerie(item.Id, userId).First().StringValue;
                var rootIndex = item.FirstItemUrl.IndexOf(_wwwRoot, StringComparison.Ordinal);
                if (rootIndex != -1)
                {
                    item.FirstItemUrl = item.FirstItemUrl.Substring(rootIndex + _wwwRoot.Length);
                    item.FirstItemUrl = item.FirstItemUrl.Replace("\\", "/");
                    if (item.FirstItemUrl[0] != '/')
                        item.FirstItemUrl = "/" + item.FirstItemUrl;
                }
                result2.Add(item);
            }
            return result2;
        }

        public ViewChart GetChart(Int64 id, Guid userId)
        {
            var os = Db.ViewChart;
            var result = os.Single(t => (t.ID == id) && (t.DataOwnerID == userId));
            return result;
        }

        public void AddChart(ViewChart v, Guid userId)
        {
            Db.AddChart(v.Name, v.Width, v.Height, userId, v.DataSetType, v.DataSetMaxCount, v.ChartType);
        }

        public void DeleteChart(Int64 id, Guid userId)
        {
            Db.DeleteChart(id, userId);
        }

        public void UpdateChart(ViewChart v, Guid userId)
        {
            Db.UpdateChart(v.ID, v.Name, v.Width, v.Height, userId, v.DataSetType, v.DataSetMaxCount, v.ChartType);
        }

        public List<ViewElementInstanceName> GetElementInstanceNameList()
        {
            var os = Db.ViewElementInstanceName;
            return os.ToList();
        }

        public List<ViewElementOwner> GetElementOwnerList(Guid userId)
        {
            var os = Db.GetElementOwners(userId);
            return os.ToList();
        }

        public List<ViewElementLocation> GetElementLocationList(Guid userId)
        {
            var os = Db.GetElementLocations(userId);
            return os.ToList();
        }

        public List<ViewElementGroup> GetElementGroupList(Guid userId)
        {
            var os = Db.GetElementGroups(userId);
            return os.ToList();
        }

        public List<ViewFile> GetPointsVsAcqTime_Last(Int64 chartId, Guid dataOwnerId, Int64 lastPointCount)
        {
            var os = Db.GetPointsVsAcqTime_Last(chartId, dataOwnerId, lastPointCount);
            return os.ToList();
        }

        public List<ViewFile> GetPointsVsAcqTime_Stat_Last(Int64 chartId, Guid dataOwnerId, Int64 lastPointCount)
        {
            var os = Db.GetPointsVsAcqTime_Stat_Last(chartId, dataOwnerId, lastPointCount);
            return os.ToList();
        }

        public List<ViewElementFiltered> GetElementFilteredList(String elementLogicalName, long? ownerId, long? groupId,
                                                                long? locationId, Guid userId, long? chartId)
        {
            var os = Db.GetFilteredElements(elementLogicalName, ownerId, groupId,
                                                                          locationId, userId, chartId);
            var l = os.ToList();
            return l;
        }

        public List<ViewElementFiltered> GetFilteredByDeviceTypeElements(long? ownerId, long? groupId, long? locationId,
                                                                         Guid userId, long? chartId)
        {
            var os = Db.GetFilteredByDeviceTypeElements(DeviceTypeRepository.VideoRecorder, ownerId, groupId,
                                                                                      locationId, userId, chartId);
            var l = os.ToList();
            return l;
        }

        public List<long?> GetChartElements(Int64 chartId, Guid userId)
        {
            var os = Db.GetChartElements(chartId, userId);
            return os.ToList();
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            Db = entities;
        }
    }
}