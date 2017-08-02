ALTER VIEW ViewCOSEMObject
AS
SELECT     dbo.TableCOSEMObject.ID, dbo.TableCOSEMObject.COSEMLogicalDeviceID, dbo.TableCOSEMObject.COSEMClassID, dbo.TableCOSEMObject.DeviceTypeID, 
                      RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) AS COSEMLogicalName, dbo.TableCOSEMObject.DataOwnerID, RTRIM(class.ClassName) AS COSEMClassName,
                       RTRIM(dt.Description) AS DeviceTypeName, class.Standard
FROM         dbo.TableCOSEMObject INNER JOIN
                      dbo.TableCOSEMClass AS class ON class.ID = dbo.TableCOSEMObject.COSEMClassID INNER JOIN
                      dbo.TableDeviceType AS dt ON dt.ID = dbo.TableCOSEMObject.DeviceTypeID
GO
