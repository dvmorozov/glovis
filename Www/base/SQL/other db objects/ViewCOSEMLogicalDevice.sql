ALTER VIEW ViewCOSEMLogicalDevice
AS
SELECT     dbo.TableCOSEMLogicalDevice.ID, dbo.TableCOSEMLogicalDevice.DeviceTypeID, dbo.TableCOSEMLogicalDevice.DataOwnerID, RTRIM(t.Description) 
                      AS DeviceTypeName, t.Standard, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS Name
FROM         dbo.TableCOSEMLogicalDevice INNER JOIN
                      dbo.TableDeviceType AS t ON t.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID
GO
