ALTER VIEW ViewDevice
AS
SELECT     td.ID, RTRIM(td.Name) AS Name, RTRIM(td.InternalAddress) AS InternalAddress, RTRIM(td.AddressType) AS AddressType, RTRIM(td.Port) AS Port, 
                      td.GroupID, td.TypeID, td.OwnerID, RTRIM(td.IP1) AS IP1, RTRIM(td.IP2) AS IP2, RTRIM(td.IP3) AS IP3, RTRIM(td.IP4) AS IP4, RTRIM(td.SecondaryPort) 
                      AS SecondaryPort, RTRIM(td.SecondaryIP1) AS SecondaryIP1, RTRIM(td.SecondaryIP2) AS SecondaryIP2, RTRIM(td.SecondaryIP3) AS SecondaryIP3, 
                      RTRIM(td.SecondaryIP4) AS SecondaryIP4, td.DataOwnerID, td.LocationAddressID, td.BillAddressID, td.LocationID, RTRIM(tdt.Description) 
                      AS DeviceTypeName, RTRIM(tg.Name) AS GroupName, RTRIM(td.Domain) AS Domain, CASE WHEN td.Domain IS NOT NULL AND RTRIM(td.Domain) 
                      <> '' THEN RTRIM(td.Domain) ELSE RTRIM(td.IP1) + '.' + RTRIM(td.IP2) + '.' + RTRIM(td.IP3) + '.' + RTRIM(td.IP4) END AS URL
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = td.TypeID INNER JOIN
                      dbo.TableGroup AS tg ON tg.ID = td.GroupID
GO
