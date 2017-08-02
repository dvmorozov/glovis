ALTER VIEW ViewElementLogicalName
AS
SELECT     dbo.TableCurrentState.ID, RTRIM(dbo.TableDeviceType.Description) AS DeviceType, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS LogicalDevice, 
                      dbo.TableCOSEMObject.COSEMLogicalName AS LogicalObject, RTRIM(dbo.TableCOSEMAttribute.Name) AS Attribute, RTRIM(dbo.TableDataType.Identifier) 
                      AS Identifier, RTRIM(dbo.TableDeviceType.Description) + '.' + RTRIM(dbo.TableCOSEMLogicalDevice.Name) 
                      + '.' + RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) + '.' + RTRIM(dbo.TableCOSEMAttribute.Name) AS FullName, dbo.TableDeviceType.Standard, 
                      RTRIM(dbo.TableCurrentState.ValueIdentifier) AS ValueIdentifier, dbo.TableCurrentState.DeviceID, dbo.TableCurrentState.DataOwnerID, 
                      dbo.TableDeviceType.ID AS DeviceTypeID, dbo.TableCOSEMLogicalDevice.ID AS LogicalDeviceID, dbo.TableCOSEMObject.ID AS ObjectID, 
                      dbo.TableCOSEMAttribute.ID AS AttributeID
FROM         dbo.TableCurrentState INNER JOIN
                      dbo.TableDataType ON dbo.TableCurrentState.DataTypeID = dbo.TableDataType.ID INNER JOIN
                      dbo.TableDeviceType INNER JOIN
                      dbo.TableCOSEMLogicalDevice ON dbo.TableDeviceType.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID INNER JOIN
                      dbo.TableCOSEMObject ON dbo.TableDeviceType.ID = dbo.TableCOSEMObject.DeviceTypeID AND 
                      dbo.TableCOSEMLogicalDevice.ID = dbo.TableCOSEMObject.COSEMLogicalDeviceID INNER JOIN
                      dbo.TableCOSEMClass ON dbo.TableCOSEMObject.COSEMClassID = dbo.TableCOSEMClass.ID INNER JOIN
                      dbo.TableCOSEMAttribute ON dbo.TableCOSEMClass.ID = dbo.TableCOSEMAttribute.COSEMClassID ON 
                      dbo.TableDataType.COSEMObjectID = dbo.TableCOSEMObject.ID AND dbo.TableDataType.COSEMAttributeID = dbo.TableCOSEMAttribute.ID
GO
