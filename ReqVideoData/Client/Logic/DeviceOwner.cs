using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VideoRequester.Providers;

namespace VideoRequester.Logic
{
    class DeviceOwner
    {
        private static DeviceOwnerProvider deviceOwnerProvider = new DeviceOwnerProvider();
        private static DeviceProvider deviceProvider = new DeviceProvider();
        private string dataOwnerID;

        public List<DeviceListItem> getDeviceList()
        {
            int firstDeviceID = deviceOwnerProvider.getFirstDeviceID(dataOwnerID);
            if (0 == firstDeviceID) return new List<DeviceListItem>();
            else return deviceProvider.getDeviceList(dataOwnerID, firstDeviceID);
        }

        public void addDevice(DeviceListItem i)
        {
            OwnerListItem l = deviceOwnerProvider.getOwner(dataOwnerID);
            l.lastDeviceID = deviceProvider.addDevice(dataOwnerID, l.lastDeviceID, i);
            if (l.firstDeviceID == 0) l.firstDeviceID = l.lastDeviceID;
            deviceOwnerProvider.updateOwner(dataOwnerID, l);
        }

        public void deleteDevice(int ID)
        {
            OwnerListItem l = deviceOwnerProvider.getOwner(dataOwnerID);
            if (l.firstDeviceID == ID)
                l.firstDeviceID = deviceProvider.getNextDevice(dataOwnerID, ID);

            if (l.lastDeviceID == ID)
                l.lastDeviceID = deviceProvider.getPrevDevice(dataOwnerID, ID);

            DeletedDevicePosition r = deviceProvider.deleteDevice(dataOwnerID, ID);
            if (r == DeletedDevicePosition.first || r == DeletedDevicePosition.last)
                deviceOwnerProvider.updateOwner(dataOwnerID, l);
        }

        public int getFirstDeviceID()
        {
            return deviceOwnerProvider.getFirstDeviceID(dataOwnerID);
        }

        public void addOwner()
        {
            deviceOwnerProvider.addOwner(dataOwnerID);
        }

        public void deleteOwner()
        {
            deviceOwnerProvider.deleteOwner(dataOwnerID);
        }

        public DeviceOwner(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
        }
    }
}
