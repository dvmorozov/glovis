using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace web.Models
{
    public interface IDeviceRepository
    {
        List<ViewDevice> GetDeviceList(Guid userId);
        ViewDevice GetDevice(Int64 id, Guid userId);
        long? AddDevice(ViewDevice viewdevice, Guid userId);
        long? AddCamera(ViewDevice viewdevice, ViewChart c, Guid userId);
        void AddCamera2(ViewDevice viewdevice, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId);
        void AddCamera3(ViewDevice viewdevice, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                        out long? elementId);
        void AddCamera4(ViewDevice viewdevice, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                        out long? elementId);
        void AddCamera5(ViewDevice v, ViewChart c, Guid userId, string attributeName, out Int64? cameraId,
                        out Guid? valueId,
                        out long? elementId);
        void TurnCameraOn(long elementId, Guid userId, out Guid operationId);
        void TurnCameraOff(long elementId, Guid userId, out Guid operationId);
        void UpdateDeviceOperationLog(Guid operationId, Guid userId, string message);
        void UpdateDeviceStatusByOperation(Guid operationId, bool finishedSuccessfully);
        void UpdateDeviceStatus(long elementId, bool finishedSuccessfully);
        long? AddDeviceWithAddress(ViewDevice d, ViewAddress a, Guid userId);
        List<String> ExportXmlTemplate(Int64 deviceId, Guid dataOwnerId);
        void DeleteDevice(Int64 id, Guid userId);
        void UpdateDevice(ViewDevice v, Guid userId);
        void UpdateDeviceAddress(ViewDevice v, Guid userId);
        void UpdateDeviceOwnerId(ViewDevice v, Guid userId);
        void SetEntities(GlovisMasterBaseEntities entities);
        void BreakOperation(Guid operationId);
        void GetOperationAttrs(Guid operationId, out string operationType, out string currentStateId /*elementId*/);
    }

    public class DeviceRepository : IDeviceRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public List<ViewDevice> GetDeviceList(Guid userId)
        {
            var os = _db.ViewDevice;
            return os.Where(t => t.DataOwnerID == userId).ToList();
        }

        public ViewDevice GetDevice(Int64 id, Guid userId)
        {
            var os = _db.ViewDevice;
            var result = os.Single(t => (t.ID == id) && (t.DataOwnerID == userId));
            return result;
        }

        public long? AddDevice(ViewDevice v, Guid userId)
        {
            var result =
                _db.AddDevice(v.Name, v.InternalAddress, v.AddressType, v.Port,
                             v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3, v.IP4, v.SecondaryPort,
                             v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3, v.SecondaryIP4, userId, null, false);
            var resultList = result.GetEnumerator();
            resultList.MoveNext();
            var deviceId = resultList.Current;
            resultList.Dispose(); //  for transaction to be able to complete
            return deviceId;
        }

        public long? AddCamera(ViewDevice v, ViewChart c, Guid userId)
        {
            var result =
                _db.AddCamera(v.Name, v.InternalAddress, v.AddressType, v.Port,
                             v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3, v.IP4, v.SecondaryPort,
                             v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3, v.SecondaryIP4, userId, null, false,
                             c.Name, c.Width, c.Height, c.DataSetType, c.DataSetMaxCount, c.ChartType);
            var resultList = result.GetEnumerator();
            resultList.MoveNext();
            var deviceId = resultList.Current;
            resultList.Dispose(); //  for transaction to be able to complete
            return deviceId;
        }

        public long? AddDeviceWithAddress(ViewDevice d, ViewAddress a, Guid userId)
        {
            var result =
                _db.AddDeviceWithAddress(d.Name, d.InternalAddress, d.AddressType, d.Port,
                                        d.GroupID, d.TypeID, d.OwnerID,
                                        d.IP1, d.IP2, d.IP3, d.IP4, d.SecondaryPort,
                                        d.SecondaryIP1, d.SecondaryIP2, d.SecondaryIP3, d.SecondaryIP4,
                                        a.Apartament, a.Building, a.Street, a.City, a.State, a.Country, a.ZipCode,
                                        userId);
            var resultList = result.GetEnumerator();
            resultList.MoveNext();
            var deviceId = resultList.Current;
            resultList.Dispose(); //  for transaction to be able to complete
            return deviceId;
        }

        public void DeleteDevice(Int64 id, Guid userId)
        {
            _db.DeleteDevice(id, userId);
        }

        public void UpdateDevice(ViewDevice v, Guid userId)
        {
            //  evernote:///view/14501366/s132/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/
            _db.UpdateDevice2(v.ID, v.Name, v.InternalAddress, v.AddressType,
                             v.Port,
                             v.GroupID, v.TypeID, v.OwnerID,
                             v.IP1, v.IP2, v.IP3, v.IP4, v.SecondaryPort,
                             v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3,
                             v.SecondaryIP4, userId, v.Domain);
        }

        public void UpdateDeviceAddress(ViewDevice v, Guid userId)
        {
            _db.UpdateDeviceAddress(v.ID, v.LocationAddressID, userId);
        }

        public void UpdateDeviceOwnerId(ViewDevice v, Guid userId)
        {
            _db.UpdateDeviceOwnerID(v.ID, v.OwnerID, userId);
        }

        public List<String> ExportXmlTemplate(Int64 deviceId, Guid dataOwnerId)
        {
            var os = _db.ExportXMLTemplate(deviceId, dataOwnerId);
            return os.ToList();
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }

        #region IDeviceRepository Members

        public void AddCamera2(ViewDevice v, ViewChart c, Guid userId, out long? cameraId, out Guid? valueId)
        {
            cameraId = null;
            valueId = null;

            var r = _db.AddCamera2(v.Name, v.InternalAddress, v.AddressType, v.Port,
                                                              v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3, v.IP4,
                                                              v.SecondaryPort,
                                                              v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3,
                                                              v.SecondaryIP4, userId, null, false,
                                                              c.Name, c.Width, c.Height, c.DataSetType,
                                                              c.DataSetMaxCount, c.ChartType);

            if (r == null) return;
            var f = r.First();
            cameraId = f.CameraID;
            valueId = f.ValueIdentifier;
        }

        public void AddCamera3(ViewDevice v, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                               out long? elementId)
        {
            cameraId = null;
            valueId = null;
            elementId = null;

            var r = _db.AddCamera3(v.Name, v.InternalAddress, v.AddressType, v.Port,
                                                               v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3,
                                                               v.IP4, v.SecondaryPort,
                                                               v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3,
                                                               v.SecondaryIP4, userId, null, false,
                                                               c.Name, c.Width, c.Height, c.DataSetType,
                                                               c.DataSetMaxCount, c.ChartType);

            if (r == null) return;
            var f = r.First();
            cameraId = f.CameraID;
            valueId = f.ValueIdentifier;
            elementId = f.ElementID;
        }

        public void AddCamera4(ViewDevice v, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                               out long? elementId)
        {
            cameraId = null;
            valueId = null;
            elementId = null;

            var r = _db.AddCamera4(v.Name, v.InternalAddress, v.AddressType, v.Port,
                                                              v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3, v.IP4,
                                                              v.SecondaryPort,
                                                              v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3,
                                                              v.SecondaryIP4, userId, null, false,
                                                              c.Name, c.Width, c.Height, c.DataSetType,
                                                              c.DataSetMaxCount, c.ChartType, v.Domain);

            if (r == null) return;
            var f = r.First();
            cameraId = f.CameraID;
            valueId = f.ValueIdentifier;
            elementId = f.ElementID;
        }

        public void AddCamera5(ViewDevice v, ViewChart c, Guid userId, string attributeName, out Int64? cameraId, out Guid? valueId,
                        out long? elementId)
        {
            cameraId = null;
            valueId = null;
            elementId = null;

            var r = _db.AddCamera5(v.Name, v.InternalAddress, v.AddressType, v.Port,
                                                              v.GroupID, v.TypeID, v.OwnerID, v.IP1, v.IP2, v.IP3, v.IP4,
                                                              v.SecondaryPort,
                                                              v.SecondaryIP1, v.SecondaryIP2, v.SecondaryIP3,
                                                              v.SecondaryIP4, userId, null, false,
                                                              c.Name, c.Width, c.Height, c.DataSetType,
                                                              c.DataSetMaxCount, c.ChartType, attributeName, v.Domain);

            if (r == null) return;
            
            var f = r.First();
            cameraId = f.CameraID;
            valueId = f.ValueIdentifier;
            elementId = f.ElementID;
        }

        public void TurnCameraOn(long elementId, Guid userId, out Guid operationId)
        {
// ReSharper disable PossibleInvalidOperationException
            operationId = (Guid) _db.TurnRecordingOnOff(elementId, userId, false).ToList().First();
// ReSharper restore PossibleInvalidOperationException
        }

        public void TurnCameraOff(long elementId, Guid userId, out Guid operationId)
        {
// ReSharper disable PossibleInvalidOperationException
            operationId = (Guid) _db.TurnRecordingOnOff(elementId, userId, true).ToList().First();
// ReSharper restore PossibleInvalidOperationException
        }

        public void BreakOperation(Guid operationId)
        {
            _db.BreakOperation(operationId);
        }

        public void GetOperationAttrs(Guid operationId, out string operationType, out string currentStateId)
        {
            var operation = _db.ViewCurrentStateOperation.First(t => t.OperationID == operationId);
            operationType = operation.OperationType.Trim();
            currentStateId = _db.ViewCurrentState.First(t => t.ID == operation.CurrentStateID).ValueIdentifier.Trim();
        }

        public void UpdateDeviceOperationLog(Guid operationId, Guid userId, string message)
        {
            _db.UpdateDeviceOperationLog(operationId, userId, message);
        }

        public void UpdateDeviceStatus(long elementId, bool finishedSuccessfully)
        {
            _db.UpdateDeviceStatus(elementId, finishedSuccessfully);
        }

        public void UpdateDeviceStatusByOperation(Guid operationId, bool finishedSuccessfully)
        {
            _db.UpdateDeviceStatusByOperation(operationId, finishedSuccessfully);
        }

        #endregion
    }

    public class TestDeviceRepository : IDeviceRepository
    {
        public int DeviceRowAffected;
        public String FirstIpAddress;
        private Boolean _firstIpAddressAssigned;
        public String FirstIpPort;
        private Boolean _firstIpPortAssigned;
        public String FirstSecIpAddress;
        private Boolean _firstSecIpAddressAssigned;
        public String FirstSecIpPort;
        private Boolean _firstSecIpPortAssigned;
        public String LastIpAddress;
        public String LastIpPort;
        public String LastSecIpAddress;
        public String LastSecIpPort;

        public TestDeviceRepository()
        {
            DeviceRowAffected = 0;
        }

        public List<ViewDevice> GetDeviceList(Guid userId)
        {
            return new List<ViewDevice>();
        }

        public ViewDevice GetDevice(Int64 id, Guid userId)
        {
            return new ViewDevice();
        }

        public long? AddDevice(ViewDevice viewdevice, Guid userId)
        {
            DeviceRowAffected++;
            if (!_firstIpPortAssigned)
            {
                FirstIpPort = viewdevice.Port;
                _firstIpPortAssigned = true;
            }
            if (!_firstIpAddressAssigned)
            {
                FirstIpAddress = viewdevice.IP1 + "." + viewdevice.IP2 + "." + viewdevice.IP3 + "." + viewdevice.IP4;
                _firstIpAddressAssigned = true;
            }
            if (!_firstSecIpAddressAssigned && viewdevice.SecondaryIP1 != null)
            {
                FirstSecIpAddress = viewdevice.SecondaryIP1 + "." + viewdevice.SecondaryIP2 + "." +
                                    viewdevice.SecondaryIP3 + "." + viewdevice.SecondaryIP4;
                _firstSecIpAddressAssigned = true;
            }
            if (!_firstSecIpPortAssigned)
            {
                FirstSecIpPort = viewdevice.SecondaryPort;
                _firstSecIpPortAssigned = true;
            }
            LastIpPort = viewdevice.Port;
            LastIpAddress = viewdevice.IP1 + "." + viewdevice.IP2 + "." + viewdevice.IP3 + "." + viewdevice.IP4;
            if (viewdevice.SecondaryIP1 != null)
            {
                LastSecIpAddress = viewdevice.SecondaryIP1 + "." + viewdevice.SecondaryIP2 + "." +
                                   viewdevice.SecondaryIP3 + "." + viewdevice.SecondaryIP4;
            }
            LastSecIpPort = viewdevice.SecondaryPort;
            return DeviceRowAffected;
        }

        public long? AddDeviceWithAddress(ViewDevice d, ViewAddress a, Guid userId)
        {
            if (!_firstIpPortAssigned)
            {
                FirstIpPort = d.Port;
                _firstIpPortAssigned = true;
            }
            if (!_firstIpAddressAssigned)
            {
                FirstIpAddress = d.IP1 + "." + d.IP2 + "." + d.IP3 + "." + d.IP4;
                _firstIpAddressAssigned = true;
            }
            if (!_firstSecIpAddressAssigned && d.SecondaryIP1 != null)
            {
                FirstSecIpAddress = d.SecondaryIP1 + "." + d.SecondaryIP2 + "." + d.SecondaryIP3 + "." + d.SecondaryIP4;
                _firstSecIpAddressAssigned = true;
            }
            if (!_firstSecIpPortAssigned)
            {
                FirstSecIpPort = d.SecondaryPort;
                _firstSecIpPortAssigned = true;
            }
            LastIpPort = d.Port;
            LastIpAddress = d.IP1 + "." + d.IP2 + "." + d.IP3 + "." + d.IP4;
            if (d.SecondaryIP1 != null)
            {
                LastSecIpAddress = d.SecondaryIP1 + "." + d.SecondaryIP2 + "." + d.SecondaryIP3 + "." + d.SecondaryIP4;
            }
            LastSecIpPort = d.SecondaryPort;

            DeviceRowAffected++;
            return DeviceRowAffected;
        }

        public void DeleteDevice(Int64 id, Guid userId)
        {
        }

        public void UpdateDevice(ViewDevice v, Guid userId)
        {
        }

        public void UpdateDeviceAddress(ViewDevice v, Guid userId)
        {
        }

        public void UpdateDeviceOwnerId(ViewDevice v, Guid userId)
        {
        }

        public List<String> ExportXmlTemplate(Int64 deviceId, Guid dataOwnerId)
        {
            return new List<String>();
        }

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
        }

        #region IDeviceRepository Members

        public long? AddCamera(ViewDevice viewdevice, ViewChart c, Guid userId)
        {
            throw new NotImplementedException();
        }

        #endregion

        public SelectList GetDevices(Guid userId)
        {
            return new SelectList(new List<String>(), "", "");
        }

        #region IDeviceRepository Members

        public void AddCamera2(ViewDevice viewdevice, ViewChart c, Guid userId, out long? cameraId, out Guid? valueId)
        {
            throw new NotImplementedException();
        }

        public void AddCamera3(ViewDevice viewdevice, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                               out long? elementId)
        {
            throw new NotImplementedException();
        }

        public void AddCamera4(ViewDevice viewdevice, ViewChart c, Guid userId, out Int64? cameraId, out Guid? valueId,
                               out long? elementId)
        {
            throw new NotImplementedException();
        }

        public void AddCamera5(ViewDevice v, ViewChart c, Guid userId, string attributeName, out Int64? cameraId, out Guid? valueId,
                        out long? elementId)
        {
            throw new NotImplementedException();
        }

        public void TurnCameraOn(long elementId, Guid userId, out Guid operationId)
        {
            throw new NotImplementedException();
        }

        public void TurnCameraOff(long elementId, Guid userId, out Guid operationId)
        {
            throw new NotImplementedException();
        }

        public void BreakOperation(Guid operationId)
        {
            throw new NotImplementedException();
        }

        public void UpdateDeviceOperationLog(Guid operationId, Guid userId, string message)
        {
            throw new NotImplementedException();
        }

        public void UpdateDeviceStatus(long elementId, bool finishedSuccessfully)
        {
            throw new NotImplementedException();
        }

        public void UpdateDeviceStatusByOperation(Guid operationId, bool finishedSuccessfully)
        {
            throw new NotImplementedException();
        }

        public void GetOperationAttrs(Guid operationId, out string operationType, out string currentStateId
            /*elementId*/)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}