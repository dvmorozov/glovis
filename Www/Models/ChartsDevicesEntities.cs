using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Diagnostics;
using System.Linq;

namespace web.Models
{
    public interface IChartsDevicesRepository
    {
        /// <summary>
        /// Returns the list of devices with associated charts.
        /// </summary>
        /// <param name="userId">Id of the current user.</param>
        /// <param name="description">The name of device type.</param>
        /// <returns>The list of devices with associated charts.</returns>
        List<ViewChartsDevices> GetChartsDevicesList(Guid userId, string description);
        List<ViewChartsDevices> GetChartsDevicesList(Guid userId, List<string> descriptions);
        //  Returns list of unique devices having associated charts.
        //  https://www.evernote.com/shard/s132/nl/14501366/5a157051-ec4c-4cb4-80e9-edf8ed0913f9
        List<ViewDevicesWithCharts> GetDevicesWithCharts(Guid userId, List<string> descriptions);
        ViewChartsDevices GetChartElement(long elementId, Guid userId);
        ViewDevicesWithCharts GetChartElement2(long elementId, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    public class ChartsDevicesRepository : IChartsDevicesRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }

        #region IChartsDevicesRepository Members

        public List<ViewChartsDevices> GetChartsDevicesList(Guid userId, string description)
        {
            ObjectSet<ViewChartsDevices> os = _db.ViewChartsDevices;
            return os.Where(t => (t.DataOwnerID == userId) && ((description == null) || (description.ToLower() == t.DeviceDescription.ToLower()))).ToList();
        }

        public List<ViewChartsDevices> GetChartsDevicesList(Guid userId, List<string> descriptions)
        {
            var result = new List<ViewChartsDevices>();
            foreach (var description in descriptions)
            {
                var os = _db.ViewChartsDevices;
                var l =
                    os.Where(
                        t =>
                        (t.DataOwnerID == userId) &&
                        ((description == null) || (description.ToLower() == t.DeviceDescription.ToLower()))).ToList();
                result.AddRange(l);
            }
            return result;
        }

        public List<ViewDevicesWithCharts> GetDevicesWithCharts(Guid userId, List<string> descriptions)
        {
            var result = new List<ViewDevicesWithCharts>();
            foreach (var description in descriptions)
            {
                var os = _db.ViewDevicesWithCharts;
                var l =
                    os.Where(
                        t => (t.DataOwnerID == userId) &&
                        ((description == null) || (description.ToLower() == t.DeviceDescription.ToLower()))).ToList();
                result.AddRange(l);
            }
            return result;
        }

        public ViewChartsDevices GetChartElement(long elementId, Guid userId)
        {
            var l = _db.ViewChartsDevices.Where(t => t.DataOwnerID == userId && t.ElementID == elementId).ToList();

            Debug.Assert(l != null && l.Count() == 1);

            return l.Count() != 0 ? l[0] : null;
        }

        public ViewDevicesWithCharts GetChartElement2(long elementId, Guid userId)
        {
            var l = _db.ViewDevicesWithCharts.Where(t => t.DataOwnerID == userId && t.ElementID == elementId).ToList();

            Debug.Assert(l != null && l.Count() == 1);

            return l.Count() != 0 ? l[0] : null;
        }

        #endregion
    }

    public class TestChartsDevicesRepository : IChartsDevicesRepository
    {

        public void SetEntities(GlovisMasterBaseEntities entities) { }

        #region IChartsDevicesRepository Members

        public List<ViewChartsDevices> GetChartsDevicesList(Guid userId, string description)
        {
            throw new NotImplementedException();
        }

        public List<ViewChartsDevices> GetChartsDevicesList(Guid userId, List<string> descriptions)
        {
            throw new NotImplementedException();
        }

        public List<ViewDevicesWithCharts> GetDevicesWithCharts(Guid userId, List<string> descriptions)
        {
            throw new NotImplementedException();
        }

        public ViewChartsDevices GetChartElement(long elementId, Guid userId)
        {
            throw new NotImplementedException();
        }

        public ViewDevicesWithCharts GetChartElement2(long elementId, Guid userId)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
