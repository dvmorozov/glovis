ALTER VIEW ViewDeviceTypeAndOwner
AS
SELECT     TOP (100) PERCENT td.ID, tg.ID AS GroupID, RTRIM(td.Name) AS DeviceName, RTRIM(tdt.Description) AS DeviceTypeName, RTRIM(tdo.FirstName) 
                      + ' ' + RTRIM(tdo.LastName) AS DeviceOwnerName, RTRIM(tg.Name) AS GroupName, RTRIM(td.IP1) + '.' + RTRIM(td.IP2) + '.' + RTRIM(td.IP3) + '.' + RTRIM(td.IP4) 
                      AS PrimaryIP, RTRIM(td.Port) AS PrimaryPort, RTRIM(td.SecondaryIP1) + '.' + RTRIM(td.SecondaryIP2) + '.' + RTRIM(td.SecondaryIP3) + '.' + RTRIM(td.SecondaryIP4) 
                      AS SecondaryIP, RTRIM(td.SecondaryPort) AS SecondaryPort, RTRIM(td.InternalAddress) AS InternalAddress, td.DataOwnerID, td.LocationAddressID
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = td.TypeID LEFT OUTER JOIN
                      dbo.TableDeviceOwner AS tdo ON tdo.ID = td.OwnerID INNER JOIN
                      dbo.TableGroup AS tg ON tg.ID = td.GroupID
ORDER BY DeviceName
GO
