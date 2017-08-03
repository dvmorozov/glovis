using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using web.Models;
using System.Transactions;

namespace web.Controllers
{
    public class PersonalizedController : Controller
    {
        protected GlovisMasterBaseEntities Entities = new GlovisMasterBaseEntities();
        private readonly AppNames _appNames = new AppNames();

        public void ExceptionMessageToViewBag(Exception e)
        {
            ViewBag.ExceptionMessage = e.InnerException != null ? e.InnerException.Message : e.Message;
        }

        //  the method fills ViewBag with application name
        protected override void OnActionExecuting(ActionExecutingContext ctx)
        {
            ViewBag.AppName = _appNames.AppName;
            ViewBag.AppName1 = _appNames.AppName1;
            ViewBag.AppName2 = _appNames.AppName2;
            //  https://www.evernote.com/shard/s132/nl/14501366/84f3d8eb-d5ab-4b30-86fa-99353be08492
            //  For subsequent modification of the main menu.
            ViewBag.Demo = false;
            ViewBag.Title = "Welcome " + (String)ViewBag.AppName;
        }

        public virtual Guid GetUserId()
        {
            if (User != null)
            {   //  check for unit-testing mode
                var mu = Membership.GetUser(User.Identity.Name);
                if (mu != null)
                {
                    if (mu.ProviderUserKey != null) return (Guid)mu.ProviderUserKey;
                }
            }
            return new Guid();
        }

        protected override void Dispose(bool disposing)
        {
            if (Entities != null) Entities.Dispose();
            base.Dispose(disposing);
        }
    }

    [Authorize(Roles = "Administrator, User")]
    public class GroupController : PersonalizedController
    {
        private IGroupRepository _groupRepository;    //  data isolation level
        private IDeviceTypeRepository _deviceTypeRepository;
        private IDeviceRepository _deviceRepository;
        private IDeviceLogicalDeviceRepository _deviceLogicalDeviceRepository;

        private void SetRepository(IGroupRepository r, IDeviceTypeRepository dtr, IDeviceRepository dr, IDeviceLogicalDeviceRepository or, GlovisMasterBaseEntities entities)
        {
            _groupRepository = r;
            _groupRepository.SetEntities(entities);
            _deviceTypeRepository = dtr;
            _deviceTypeRepository.SetEntities(entities);
            _deviceRepository = dr;
            _deviceRepository.SetEntities(entities);
            _deviceLogicalDeviceRepository = or;
            _deviceLogicalDeviceRepository.SetEntities(entities);
        }

        public enum AddForIPsResults
        {
            MetersAddedSuccessfully,
            DeviceNamePrefixError,
            NameError,
            StartingIpError,
            StartingIpPortError,
            EndingIpError,
            EndingIpPortError,
            SecondaryStartingIpError,
            SecondaryStartingPortError,
            ModelStateIsNotValid,
            ExceptionRaised
        };

        public enum AddForBuildingsResults
        {
            MetersAddedSuccessfully,
            DeviceNamePrefixError,
            NameError,
            StartingIpError,
            StartingIpPortError,
            SecondaryStartingIpError,
            SecondaryStartingPortError,
            StartingBuildingError, 
            EndingBuildingError,
            StartingApartamentError,
            EndingApartamentError,
            ModelStateIsNotValid,
            StreetError,
            CityError,
            StateError,
            CountryError,
            ZipCodeError,
            ExceptionRaised
        };

        public enum DeleteResults
        {
            DeleteViewCreatedSuccessfully,
            GroupDeletedSuccessfully,
            DeleteInternalError
        };

        public enum EditResults
        {
            GroupUpdatedSuccessfully,
            MinutesEError,
            MinutesGError,
            HoursEError,
            HoursGError,
            DaysEError,
            DaysGError,
            WeeksGError,
            UpdateInternalError,
            MinModeError,
            HourModeError,
            DayModeError,
            WeekModeError,
            ModelStateIsInvalid
        };

        public AddForIPsResults AddMetersForIPsResult;
        public AddForBuildingsResults AddMetersForBuildingsResult;
        public DeleteResults DeleteResult;
        public EditResults EditResult;

        static public String[] AdmissibleMinutesE = { "1", "2", "3", "5", "10", "20", "30" };
        static public String[] AdmissibleMinutesG = { "00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55" };
        static public String[] AdmissibleHoursE = { "1", "3", "4", "6", "12" };
        static public String[] AdmissibleHoursG = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };
        static public String[] AdmissibleDaysE = { "1", "2", "3", "5", "10", "20", "30" };
        static public String[] AdmissibleDaysG = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28" };
        static public String[] AdmissibleWeeksG = { "1", "2", "3", "4" };
        static public String[] AdmissibleMinModes = { "ENM", "AGM" };
        static public String[] AdmissibleHourModes = { "ENH", "AGH" };
        static public String[] AdmissibleDayModes = { "END", "AGD", "AGDW" };
        static public String[] AdmissibleWeekModes = { "EW", "AGW" };

        public GroupController() 
        {
            SetRepository(new GroupRepository(), new DeviceTypeRepository(), new DeviceRepository(), new DeviceLogicalDeviceRepository(), Entities);
        }

        public GroupController(IGroupRepository r, IDeviceTypeRepository dtr, IDeviceRepository dr, IDeviceLogicalDeviceRepository or)
        {
            SetRepository(r, dtr, dr, or, null);
        }

        public ViewResult Index()
        {
            try
            {
                var viewgroupList = _groupRepository.GetGroupList(GetUserId());
                return View(viewgroupList);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id)
        {
            try
            {
                var viewgroup = _groupRepository.GetGroup(id, GetUserId());
                FillGroupCreateViewAuxData(viewgroup);
                return View("DetailsWithoutSchedule"/*temporarily schedule input disabled !!!*/, viewgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void FillGroupCreateViewAuxData(ViewGroup vg)
        {
            //  заполнение элементов выбора
            ViewData["MinutesE"] = new SelectList(AdmissibleMinutesE, vg != null ? vg.MinutesE.ToString() : AdmissibleMinutesE[0]);
            ViewData["MinutesG"] = new SelectList(AdmissibleMinutesG, vg != null ? vg.MinutesG.ToString() : AdmissibleMinutesG[0]);
            ViewData["HoursE"] = new SelectList(AdmissibleHoursE, vg != null ? vg.HoursE.ToString() : AdmissibleHoursE[0]);
            ViewData["HoursG"] = new SelectList(AdmissibleHoursG, vg != null ? vg.HoursG.ToString() : AdmissibleHoursG[0]);
            ViewData["DaysE"] = new SelectList(AdmissibleDaysE, vg != null ? vg.DaysE.ToString() : AdmissibleDaysE[0]);
            ViewData["DaysG"] = new SelectList(AdmissibleDaysG, vg != null ? vg.DaysG.ToString() : AdmissibleDaysG[0]);
            ViewData["WeeksG"] = new SelectList(AdmissibleWeeksG, vg != null ? vg.WeeksG.ToString() : AdmissibleWeeksG[0]);
        }

        private void FillViewsAuxData(ViewGroup vg)
        {
            ViewBag.DeviceTypeID = _deviceTypeRepository.GetDeviceTypes(GetUserId(), DeviceTypeRepository.VideoRecorder);
            FillGroupCreateViewAuxData(vg);
        }

        public ActionResult AddMetersForIPs()
        {
            try
            {
                FillViewsAuxData(null);
                return View("AddCamerasForIPs", new ViewGroup());
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private static bool IsValidIpClass(UInt32 startingIp)
        { 
            return ((startingIp >= 1) && (startingIp <= 126)) || ((startingIp >= 128) && (startingIp <= 191)) || ((startingIp >= 192) && (startingIp <= 223));
        }

        private enum IpClass
        { 
            A,
            B,
            C,
            Invalid
        }

        private static IpClass GetIpClass(UInt32 startingIp)
        {
            if (startingIp <= 126)
            {
                return IpClass.A;
            }
            if (startingIp <= 191)
            {
                return IpClass.B;
            }
            return startingIp <= 223 ? IpClass.C : IpClass.Invalid;
        }

        [HttpPost]
        public ActionResult AddMetersForIPs(ViewGroup viewgroup)
        {
            try
            {
                if (viewgroup.DeviceNamePrefix == null)
                {
                    AddMetersForIPsResult = AddForIPsResults.DeviceNamePrefixError;
                    return AddMetersForIPs();
                }
                if (string.IsNullOrEmpty(viewgroup.Name))
                {
                    AddMetersForIPsResult = AddForIPsResults.NameError;
                    return AddMetersForIPs();
                }

                UInt32 startingIp1 = 0, startingIp2 = 0, startingIp3 = 0, startingIp4 = 0, startingIpPort = 0;
                var startingIpUndefined = false;

                if (String.IsNullOrWhiteSpace(viewgroup.StartingIP1) && String.IsNullOrWhiteSpace(viewgroup.StartingIP2) &&
                    String.IsNullOrWhiteSpace(viewgroup.StartingIP3) && String.IsNullOrWhiteSpace(viewgroup.StartingIP4)) startingIpUndefined = true;
                else
                {
                    if (String.IsNullOrWhiteSpace(viewgroup.StartingIP1) || (!UInt32.TryParse(viewgroup.StartingIP1, out startingIp1)) ||
                        String.IsNullOrWhiteSpace(viewgroup.StartingIP2) || (!UInt32.TryParse(viewgroup.StartingIP2, out startingIp2)) ||
                        String.IsNullOrWhiteSpace(viewgroup.StartingIP3) || (!UInt32.TryParse(viewgroup.StartingIP3, out startingIp3)) ||
                        String.IsNullOrWhiteSpace(viewgroup.StartingIP4) || (!UInt32.TryParse(viewgroup.StartingIP4, out startingIp4)))
                    {
                        AddMetersForIPsResult = AddForIPsResults.StartingIpError;
                        return AddMetersForIPs();
                    }
                    if(!IsValidIpClass(startingIp1))
                    {
                        AddMetersForIPsResult = AddForIPsResults.StartingIpError;
                        return AddMetersForIPs();
                    }
                    if (String.IsNullOrWhiteSpace(viewgroup.StartingIPPort) || (!UInt32.TryParse(viewgroup.StartingIPPort, out startingIpPort)) 
                        || !(startingIpPort <= 65535))
                    {
                        AddMetersForIPsResult = AddForIPsResults.StartingIpPortError;
                        return AddMetersForIPs();
                    }
                }

                UInt32 endingIp1 = 0, endingIp2 = 0, endingIp3 = 0, endingIp4 = 0, endingIpPort = 0;

                if (String.IsNullOrWhiteSpace(viewgroup.EndingIP1) && String.IsNullOrWhiteSpace(viewgroup.EndingIP2) &&
                    String.IsNullOrWhiteSpace(viewgroup.EndingIP3) && String.IsNullOrWhiteSpace(viewgroup.EndingIP4))
                {
                }
                else
                {
                    if (String.IsNullOrWhiteSpace(viewgroup.EndingIP1) || (!UInt32.TryParse(viewgroup.EndingIP1, out endingIp1)) ||
                        String.IsNullOrWhiteSpace(viewgroup.EndingIP2) || (!UInt32.TryParse(viewgroup.EndingIP2, out endingIp2)) ||
                        String.IsNullOrWhiteSpace(viewgroup.EndingIP3) || (!UInt32.TryParse(viewgroup.EndingIP3, out endingIp3)) ||
                        String.IsNullOrWhiteSpace(viewgroup.EndingIP4) || (!UInt32.TryParse(viewgroup.EndingIP4, out endingIp4)))
                    {
                        AddMetersForIPsResult = AddForIPsResults.EndingIpError;
                        return AddMetersForIPs();
                    }
                    if (!IsValidIpClass(endingIp1))
                    {
                        AddMetersForIPsResult = AddForIPsResults.EndingIpError;
                        return AddMetersForIPs();
                    }
                    if (String.IsNullOrWhiteSpace(viewgroup.EndingIPPort) || (!UInt32.TryParse(viewgroup.EndingIPPort, out endingIpPort))
                        || !(endingIpPort <= 65535))
                    {
                        AddMetersForIPsResult = AddForIPsResults.EndingIpPortError;
                        return AddMetersForIPs();
                    }
                }

                UInt32 secondaryStartingIp1 = 0, secondaryStartingIp2 = 0, secondaryStartingIp3 = 0, secondaryStartingIp4 = 0, secondaryStartingIpPort = 0;
                var secondaryStartingIpUndefined = false;

                if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP1) && String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP2) &&
                    String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP3) && String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP4)) secondaryStartingIpUndefined = true;
                else
                {
                    if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP1) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP1, out secondaryStartingIp1)) ||
                        String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP2) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP2, out secondaryStartingIp2)) ||
                        String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP3) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP3, out secondaryStartingIp3)) ||
                        String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP4) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP4, out secondaryStartingIp4)))
                    {
                        AddMetersForIPsResult = AddForIPsResults.SecondaryStartingIpError;
                        return AddMetersForIPs();
                    }
                    if (!IsValidIpClass(secondaryStartingIp1))
                    {
                        AddMetersForIPsResult = AddForIPsResults.SecondaryStartingIpError;
                        return AddMetersForIPs();
                    }
                    if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIPPort) || (!UInt32.TryParse(viewgroup.SecondaryStartingIPPort, out secondaryStartingIpPort)) 
                        || !(secondaryStartingIpPort <= 65535))
                    {
                        AddMetersForIPsResult = AddForIPsResults.SecondaryStartingPortError;
                        return AddMetersForIPs();
                    }
                }
                if (ModelState.IsValid)
                {
                    UInt32 netShift = 0, netSecShift = 0;

                    if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.A)
                    {
                        if (GetIpClass(endingIp1) != IpClass.A)
                        {
                            AddMetersForIPsResult = AddForIPsResults.EndingIpError;
                            return AddMetersForIPs();
                        }
                        netShift = 24; //  class-A
                    }
                    else
                        if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.B)
                        {
                            if (GetIpClass(endingIp1) != IpClass.B)
                            {
                                AddMetersForIPsResult = AddForIPsResults.EndingIpError;
                                return AddMetersForIPs();
                            }
                            netShift = 16; //   class-B
                        }
                        else
                            if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.C)
                            {
                                if (GetIpClass(endingIp1) != IpClass.C)
                                {
                                    AddMetersForIPsResult = AddForIPsResults.EndingIpError;
                                    return AddMetersForIPs();
                                }
                                netShift = 8; //    class-C
                            }

                    if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.A)
                    {
                        netSecShift = 24; //  class-A
                    }
                    else
                        if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.B)
                        {
                            netSecShift = 16; //   class-B
                        }
                        else
                            if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.C)
                            {
                                netSecShift = 8; //    class-C
                            }

                    var startingIpAddr = startingIp1 << 24 | startingIp2 << 16 | startingIp3 << 8 | startingIp4;
                    var endingIpAddr = endingIp1 << 24 | endingIp2 << 16 | endingIp3 << 8 | endingIp4;
                    var secondaryStartingIpAddr = secondaryStartingIp1 << 24 | secondaryStartingIp2 << 16 | secondaryStartingIp3 << 8 | secondaryStartingIp4;
                    var ipMask = (UInt32)((1 << (Int32)netShift) - 1);
                    var ipSecMask = (UInt32)((1 << (Int32)netSecShift) - 1);

                    var userId = GetUserId();
                    using (var transaction = new TransactionScope())
                    {
                        //  сначала нужно добавить группу, чтобы получить идентификатор
                        var groupId = _groupRepository.AddGroup(viewgroup, userId);
                        var serNum = 1;
                        UInt32 sIp, eIp, sPort, ePort;
                        if (startingIpAddr <= endingIpAddr)
                        {
                            sIp = startingIpAddr;
                            eIp = endingIpAddr;
                        }
                        else
                        {
                            sIp = endingIpAddr;
                            eIp = startingIpAddr;
                        }

                        if (startingIpPort <= endingIpPort)
                        {
                            sPort = startingIpPort;
                            ePort = endingIpPort;
                        }
                        else
                        {
                            ePort = startingIpPort;
                            sPort = endingIpPort;
                        }
                        var netPart = sIp >> (Int32)netShift;
                        var ipPart = sIp & ipMask;

                        var sSecIp = secondaryStartingIpAddr;
                        var sSecPort = secondaryStartingIpPort;

                        var netSecPart = sSecIp >> (Int32)netSecShift;
                        var ipSecPart = sSecIp & ipSecMask;

                        if (startingIpUndefined)
                        { 
                            var td = new ViewDevice
                                {
                                    InternalAddress = "1",
                                    AddressType = "IP",
                                    GroupID = groupId.Value,
                                    TypeID = viewgroup.DeviceTypeID
                                };

                            if (0 != viewgroup.DeviceNamePrefix.Trim().Length)
                                td.Name = viewgroup.DeviceNamePrefix.Trim() + serNum;

                            var deviceId = _deviceRepository.AddDevice(td, userId);
                            if (deviceId != null)
                            {
                                _deviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList((long)deviceId, userId);
                            }
                        }
                        else
                        {
                            for (UInt32 ipAddr = sIp, ipSecAddr = sSecIp; ipAddr <= eIp; )
                            {
                                for (UInt32 ipPort = sPort, ipSecPort = sSecPort; ipPort <= ePort; )
                                {
                                    var td = new ViewDevice
                                        {
                                            InternalAddress = "1",
                                            AddressType = "IP",
                                            GroupID = groupId.Value,
                                            TypeID = viewgroup.DeviceTypeID
                                        };

                                    if (0 != viewgroup.DeviceNamePrefix.Trim().Length)
                                        td.Name = viewgroup.DeviceNamePrefix.Trim() + (serNum++).ToString(CultureInfo.InvariantCulture);

                                    td.IP1 = (ipAddr >> 24).ToString(CultureInfo.InvariantCulture);
                                    td.IP2 = ((ipAddr >> 16) & 0xff).ToString(CultureInfo.InvariantCulture);
                                    td.IP3 = ((ipAddr >> 8) & 0xff).ToString(CultureInfo.InvariantCulture);
                                    td.IP4 = (ipAddr & 0xff).ToString(CultureInfo.InvariantCulture);
                                    td.Port = ipPort.ToString(CultureInfo.InvariantCulture);

                                    if (!secondaryStartingIpUndefined)
                                    {
                                        td.SecondaryIP1 = (ipSecAddr >> 24).ToString(CultureInfo.InvariantCulture);
                                        td.SecondaryIP2 = ((ipSecAddr >> 16) & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.SecondaryIP3 = ((ipSecAddr >> 8) & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.SecondaryIP4 = (ipSecAddr & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.SecondaryPort = ipSecPort.ToString(CultureInfo.InvariantCulture);
                                    }

                                    var deviceId = _deviceRepository.AddDevice(td, userId);
                                    if (deviceId != null)
                                    {
                                        _deviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList((long)deviceId, userId);
                                    }

                                    ipPort++;
                                    ipSecPort++;
                                    if (ipPort <= ePort) continue;
                                    ipPart++;
                                    if (ipPart == ipMask)
                                    {
                                        ipPart = 1;
                                        netPart++;
                                    }
                                    ipAddr = netPart << (Int32)netShift | ipPart;

                                    ipSecPart++;
                                    if (ipSecPart == ipSecMask)
                                    {
                                        ipSecPart = 1;
                                        netSecPart++;
                                    }
                                    ipSecAddr = netSecPart << (Int32)netSecShift | ipSecPart;

                                    break;
                                }
                            }
                        }
                        transaction.Complete();
                    }
                    AddMetersForIPsResult = AddForIPsResults.MetersAddedSuccessfully;
                    return RedirectToAction("Index");
                }

                AddMetersForIPsResult = AddForIPsResults.ModelStateIsNotValid;
                return AddMetersForIPs();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                AddMetersForIPsResult = AddForIPsResults.ExceptionRaised;
                return View("Error");
            }
        }

        public ActionResult AddMetersForBuildings()
        {
            try
            {
                ViewBag.DeviceTypeID = _deviceTypeRepository.GetDeviceTypes(GetUserId(), DeviceTypeRepository.VideoRecorder);
                FillGroupCreateViewAuxData(null);
                return View("AddCamerasForBuildings", new ViewGroup());
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult AddMetersForBuildings(ViewGroup viewgroup)
        {
            try
            {
                try
                {
                    // parameters checking
                    if (viewgroup.DeviceNamePrefix == null)
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.DeviceNamePrefixError;
                        return AddMetersForBuildings();
                    }
                    if (string.IsNullOrEmpty(viewgroup.Name))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.NameError;
                        return AddMetersForBuildings();
                    }

                    UInt32 startingIp1 = 0, startingIp2 = 0, startingIp3 = 0, startingIp4 = 0;
                    var startingIpUndefined = false;

                    if (String.IsNullOrWhiteSpace(viewgroup.StartingIP1) && String.IsNullOrWhiteSpace(viewgroup.StartingIP2) &&
                        String.IsNullOrWhiteSpace(viewgroup.StartingIP3) && String.IsNullOrWhiteSpace(viewgroup.StartingIP4)) startingIpUndefined = true;
                    else
                    {
                        if (String.IsNullOrWhiteSpace(viewgroup.StartingIP1) || (!UInt32.TryParse(viewgroup.StartingIP1, out startingIp1)) ||
                            String.IsNullOrWhiteSpace(viewgroup.StartingIP2) || (!UInt32.TryParse(viewgroup.StartingIP2, out startingIp2)) ||
                            String.IsNullOrWhiteSpace(viewgroup.StartingIP3) || (!UInt32.TryParse(viewgroup.StartingIP3, out startingIp3)) ||
                            String.IsNullOrWhiteSpace(viewgroup.StartingIP4) || (!UInt32.TryParse(viewgroup.StartingIP4, out startingIp4)))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.StartingIpError;
                            return AddMetersForBuildings();
                        }
                        if (!IsValidIpClass(startingIp1))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.StartingIpError;
                            return AddMetersForBuildings();
                        }
                        UInt32 startingIpPort;
                        if (String.IsNullOrWhiteSpace(viewgroup.StartingIPPort) || (!UInt32.TryParse(viewgroup.StartingIPPort, out startingIpPort))
                            || !(startingIpPort <= 65535))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.StartingIpPortError;
                            return AddMetersForBuildings();
                        }
                    }

                    UInt32 secondaryStartingIp1 = 0, secondaryStartingIp2 = 0, secondaryStartingIp3 = 0, secondaryStartingIp4 = 0;
                    var secondaryStartingIpUndefined = false;

                    if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP1) && String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP2) &&
                        String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP3) && String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP4)) secondaryStartingIpUndefined = true;
                    else
                    {
                        if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP1) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP1, out secondaryStartingIp1)) ||
                            String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP2) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP2, out secondaryStartingIp2)) ||
                            String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP3) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP3, out secondaryStartingIp3)) ||
                            String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIP4) || (!UInt32.TryParse(viewgroup.SecondaryStartingIP4, out secondaryStartingIp4)))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.SecondaryStartingIpError;
                            return AddMetersForBuildings();
                        }
                        if (!IsValidIpClass(secondaryStartingIp1))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.SecondaryStartingIpError;
                            return AddMetersForBuildings();
                        }
                        UInt32 secondaryStartingIpPort;
                        if (String.IsNullOrWhiteSpace(viewgroup.SecondaryStartingIPPort) || (!UInt32.TryParse(viewgroup.SecondaryStartingIPPort, out secondaryStartingIpPort))
                            || !(secondaryStartingIpPort <= 65535))
                        {
                            AddMetersForBuildingsResult = AddForBuildingsResults.SecondaryStartingPortError;
                            return AddMetersForBuildings();
                        }
                    }

                    uint zipCode, startingBuilding, endingBuilding, startingApartament, endingApartament;
                    if (!UInt32.TryParse(viewgroup.ZipCode, out zipCode))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.ZipCodeError;
                        return AddMetersForBuildings();
                    }
                    if (!UInt32.TryParse(viewgroup.StartingBuilding, out startingBuilding))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.StartingBuildingError;
                        return AddMetersForBuildings();
                    }
                    if (!UInt32.TryParse(viewgroup.EndingBuilding, out endingBuilding))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.EndingBuildingError;
                        return AddMetersForBuildings();
                    }
                    if (!UInt32.TryParse(viewgroup.StartingApartment, out startingApartament))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.StartingApartamentError;
                        return AddMetersForBuildings();
                    }
                    if (!UInt32.TryParse(viewgroup.EndingApartment, out endingApartament))
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.EndingApartamentError;
                        return AddMetersForBuildings();
                    }
                    if (viewgroup.Street == "")
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.StreetError;
                        return AddMetersForBuildings();
                    }
                    if (viewgroup.City == "")
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.CityError;
                        return AddMetersForBuildings();
                    }
                    if (viewgroup.State == "")
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.StateError;
                        return AddMetersForBuildings();
                    }
                    if (viewgroup.Country == "")
                    {
                        AddMetersForBuildingsResult = AddForBuildingsResults.CountryError;
                        return AddMetersForBuildings();
                    }

                    //////////////////////////////////////////
                    //  devices creating
                    if (ModelState.IsValid)
                    {
                        UInt32 netShift = 0, netSecShift = 0;

                        if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.A)
                        {
                            netShift = 24; //  class-A
                        }
                        else
                            if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.B)
                            {
                                netShift = 16; //   class-B
                            }
                            else
                                if (!startingIpUndefined && GetIpClass(startingIp1) == IpClass.C)
                                {
                                    netShift = 8; //    class-C
                                }

                        if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.A)
                        {
                            netSecShift = 24; //  class-A
                        }
                        else
                            if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.B)
                            {
                                netSecShift = 16; //   class-B
                            }
                            else
                                if (!secondaryStartingIpUndefined && GetIpClass(secondaryStartingIp1) == IpClass.C)
                                {
                                    netSecShift = 8; //    class-C
                                }

                        var startingIpAddr = startingIp1 << 24 | startingIp2 << 16 | startingIp3 << 8 | startingIp4;
                        var secondaryStartingIpAddr = secondaryStartingIp1 << 24 | secondaryStartingIp2 << 16 | secondaryStartingIp3 << 8 | secondaryStartingIp4;
                        var ipMask = (UInt32)((1 << (Int32)netShift) - 1);
                        var ipSecMask = (UInt32)((1 << (Int32)netSecShift) - 1);

                        var userId = GetUserId();
                        using (var transaction = new TransactionScope())
                        {
                            //  сначала нужно добавить группу, чтобы получить идентификатор
                            var groupId = _groupRepository.AddGroup(viewgroup, userId);
                            var serNum = 1;
                            var sIp = startingIpAddr;
                            var sSecIp = secondaryStartingIpAddr;

                            UInt32 sBuilding, eBuilding, sApartament, eApartament;
                            if (startingBuilding <= endingBuilding)
                            {
                                sBuilding = startingBuilding;
                                eBuilding = endingBuilding;
                            }
                            else
                            {
                                sBuilding = endingBuilding;
                                eBuilding = startingBuilding;
                            }

                            if (startingApartament <= endingApartament)
                            {
                                sApartament = startingApartament;
                                eApartament = endingApartament;
                            }
                            else
                            {
                                sApartament = endingApartament;
                                eApartament = startingApartament;
                            }

                            var netPart = sIp >> (Int32)netShift;
                            var ipPart = sIp & ipMask;

                            var netSecPart = sSecIp >> (Int32)netSecShift;
                            var ipSecPart = sSecIp & ipSecMask;

                            if (startingIpUndefined)
                            {
                                var td = new ViewDevice
                                    {
                                        InternalAddress = "1",
                                        AddressType = "IP",
                                        GroupID = groupId.Value,
                                        TypeID = viewgroup.DeviceTypeID
                                    };

                                var building = sBuilding;
                                var apartament = sApartament;

                                if (0 != viewgroup.DeviceNamePrefix.Trim().Length)
                                    td.Name = viewgroup.DeviceNamePrefix.Trim() + serNum;

                                var a = new ViewAddress
                                    {
                                        Apartament = apartament.ToString(CultureInfo.InvariantCulture),
                                        Building = building.ToString(CultureInfo.InvariantCulture),
                                        Street = viewgroup.Street,
                                        City = viewgroup.City,
                                        State = viewgroup.State,
                                        Country = viewgroup.Country,
                                        ZipCode = viewgroup.ZipCode
                                    };

                                var deviceId = _deviceRepository.AddDeviceWithAddress(td, a, userId);
                                if (deviceId != null)
                                {
                                    _deviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList((long)deviceId, userId);
                                }
                            }
                            else
                            {
                                for (UInt32 building = sBuilding, ipAddr = sIp, ipSecAddr = sSecIp; building <= eBuilding; building++)
                                    for (var apartament = sApartament; apartament <= eApartament; apartament++)
                                    {
                                        var td = new ViewDevice
                                            {
                                                InternalAddress = "1",
                                                AddressType = "IP",
                                                GroupID = groupId.Value,
                                                TypeID = viewgroup.DeviceTypeID
                                            };

                                        if (0 != viewgroup.DeviceNamePrefix.Trim().Length)
                                            td.Name = viewgroup.DeviceNamePrefix.Trim() + (serNum++).ToString(CultureInfo.InvariantCulture);

                                        td.IP1 = (ipAddr >> 24).ToString(CultureInfo.InvariantCulture);
                                        td.IP2 = ((ipAddr >> 16) & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.IP3 = ((ipAddr >> 8) & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.IP4 = (ipAddr & 0xff).ToString(CultureInfo.InvariantCulture);
                                        td.Port = viewgroup.StartingIPPort;

                                        if (!secondaryStartingIpUndefined)
                                        {
                                            td.SecondaryIP1 = (ipSecAddr >> 24).ToString(CultureInfo.InvariantCulture);
                                            td.SecondaryIP2 = ((ipSecAddr >> 16) & 0xff).ToString(CultureInfo.InvariantCulture);
                                            td.SecondaryIP3 = ((ipSecAddr >> 8) & 0xff).ToString(CultureInfo.InvariantCulture);
                                            td.SecondaryIP4 = (ipSecAddr & 0xff).ToString(CultureInfo.InvariantCulture);
                                            td.SecondaryPort = viewgroup.SecondaryStartingIPPort;
                                        }

                                        var a = new ViewAddress
                                            {
                                                Apartament = apartament.ToString(CultureInfo.InvariantCulture),
                                                Building = building.ToString(CultureInfo.InvariantCulture),
                                                Street = viewgroup.Street,
                                                City = viewgroup.City,
                                                State = viewgroup.State,
                                                Country = viewgroup.Country,
                                                ZipCode = viewgroup.ZipCode
                                            };

                                        var deviceId = _deviceRepository.AddDeviceWithAddress(td, a, userId);
                                        if (deviceId != null)
                                        {
                                            _deviceLogicalDeviceRepository.AddAllDeviceAttrToCollectList((long)deviceId, userId);
                                        }

                                        ipPart++;
                                        if (ipPart == ipMask)
                                        {
                                            ipPart = 1;
                                            netPart++;
                                        }
                                        ipAddr = netPart << (Int32)netShift | ipPart;

                                        ipSecPart++;
                                        if (ipSecPart == ipSecMask)
                                        {
                                            ipSecPart = 1;
                                            netSecPart++;
                                        }
                                        ipSecAddr = netSecPart << (Int32)netSecShift | ipSecPart;
                                    }
                            }
                            transaction.Complete();
                        }
                        AddMetersForBuildingsResult = AddForBuildingsResults.MetersAddedSuccessfully;
                        return RedirectToAction("Index");
                    }

                    AddMetersForBuildingsResult = AddForBuildingsResults.ModelStateIsNotValid;
                    return AddMetersForBuildings();
                }
                catch (Exception e)
                {
                    ExceptionMessageToViewBag(e);
                    AddMetersForBuildingsResult = AddForBuildingsResults.ExceptionRaised;
                    return View("Error");
                }
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Edit(long id)
        {
            try
            {
                var viewgroup = _groupRepository.GetGroup(id, GetUserId());
                FillViewsAuxData(viewgroup);
                return View("EditWithoutSchedule"/*temporarily schedule input disabled !!!*/, viewgroup);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewGroup viewgroup)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var l = AdmissibleMinutesE.Select(Int32.Parse).ToList();

                    if((viewgroup.MinutesE != null) && (-1 == l.IndexOf((Int32)viewgroup.MinutesE, 0))) 
                    {
                        EditResult = EditResults.MinutesEError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleMinutesG.Select(Int32.Parse).ToList();
                    if ((viewgroup.MinutesG != null) && (-1 == l.IndexOf((Int32)viewgroup.MinutesG, 0)))
                    {
                        EditResult = EditResults.MinutesGError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleHoursE.Select(Int32.Parse).ToList();
                    if ((viewgroup.HoursE != null) && (-1 == l.IndexOf((Int32)viewgroup.HoursE, 0)))
                    {
                        EditResult = EditResults.HoursEError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleHoursG.Select(Int32.Parse).ToList();
                    if ((viewgroup.HoursG != null) && (-1 == l.IndexOf((Int32)viewgroup.HoursG, 0)))
                    {
                        EditResult = EditResults.HoursGError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleDaysE.Select(Int32.Parse).ToList();
                    if ((viewgroup.DaysE != null) && (-1 == l.IndexOf((Int32)viewgroup.DaysE, 0)))
                    {
                        EditResult = EditResults.DaysEError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleDaysG.Select(Int32.Parse).ToList();
                    if ((viewgroup.DaysG != null) && (-1 == l.IndexOf((Int32)viewgroup.DaysG, 0)))
                    {
                        EditResult = EditResults.DaysGError;
                        return Edit(viewgroup.ID);
                    }

                    l = AdmissibleWeeksG.Select(Int32.Parse).ToList();
                    if ((viewgroup.WeeksG != null) && (-1 == l.IndexOf((Int32)viewgroup.WeeksG, 0)))
                    {
                        EditResult = EditResults.WeeksGError;
                        return Edit(viewgroup.ID);
                    }

                    var ls = new List<String>(AdmissibleWeekModes);
                    if ((viewgroup.WeekMode != null) && (-1 == ls.IndexOf(viewgroup.WeekMode, 0)))
                    {
                        EditResult = EditResults.WeekModeError;
                        return Edit(viewgroup.ID);
                    }
                    
                    ls = new List<String>(AdmissibleDayModes);
                    if ((viewgroup.DayMode != null) && (-1 == ls.IndexOf(viewgroup.DayMode, 0)))
                    {
                        EditResult = EditResults.DayModeError;
                        return Edit(viewgroup.ID);
                    }

                    ls = new List<String>(AdmissibleMinModes);
                    if ((viewgroup.MinMode != null) && (-1 == ls.IndexOf(viewgroup.MinMode, 0)))
                    {
                        EditResult = EditResults.MinModeError;
                        return Edit(viewgroup.ID);
                    }

                    ls = new List<String>(AdmissibleHourModes);
                    if ((viewgroup.HourMode != null) && (-1 == ls.IndexOf(viewgroup.HourMode, 0)))
                    {
                        EditResult = EditResults.HourModeError;
                        return Edit(viewgroup.ID);
                    }

                    _groupRepository.UpdateGroup(viewgroup, GetUserId());
                    EditResult = EditResults.GroupUpdatedSuccessfully;
                    return RedirectToAction("Index");
                }
                //  return to properties editing
                EditResult = EditResults.ModelStateIsInvalid;
                return Edit(viewgroup.ID);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                EditResult = EditResults.UpdateInternalError;
                return View("Error");
            }
        }

        public ActionResult Delete(long id)
        {
            try
            {
                var viewgroup = _groupRepository.GetGroup(id, GetUserId());
                DeleteResult = DeleteResults.DeleteViewCreatedSuccessfully;
                return View(viewgroup);
            }
            catch(Exception e)
            {
                DeleteResult = DeleteResults.DeleteInternalError;
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            try
            {
                _groupRepository.DeleteGroup(id, GetUserId());
                DeleteResult = DeleteResults.GroupDeletedSuccessfully;
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                DeleteResult = DeleteResults.DeleteInternalError;
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}