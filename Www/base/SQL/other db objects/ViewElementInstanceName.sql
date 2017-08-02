ALTER VIEW ViewElementInstanceName
AS
SELECT        dbo.ViewCurrentState.ID, RTRIM(dbo.TableGroup.Name) AS GroupName, RTRIM(dbo.TableDevice.Name) AS DeviceName, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS LogicalDevice, 
                         RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) AS LogicalObject, RTRIM(dbo.TableCOSEMAttribute.Name) AS Attribute, RTRIM(dbo.TableDataType.Identifier) AS Identifier, RTRIM(dbo.TableGroup.Name) 
                         + '.' + RTRIM(dbo.TableDevice.Name) + '.' + RTRIM(dbo.TableCOSEMLogicalDevice.Name) + '.' + RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) + '.' + RTRIM(dbo.TableCOSEMAttribute.Name) AS FullName, 
                         dbo.TableDeviceType.Standard, RTRIM(dbo.ViewCurrentState.ValueIdentifier) AS ValueIdentifier, dbo.TableGroup.ID AS GroupID, dbo.ViewCurrentState.DeviceID, dbo.ViewCurrentState.DataOwnerID, 
                         dbo.TableCOSEMLogicalDevice.ID AS LogicalDeviceID, dbo.TableCOSEMObject.ID AS ObjectID, dbo.TableCOSEMAttribute.ID AS AttributeID, dbo.TableDeviceType.Description AS DeviceDescription, 
                         dbo.ViewCurrentState.AcquisitionDisabled, dbo.ViewCurrentState.OperationInProgress, dbo.ViewCurrentState.FinishedSuccessfully
FROM            dbo.ViewCurrentState INNER JOIN
                         dbo.TableDataType ON dbo.ViewCurrentState.DataTypeID = dbo.TableDataType.ID INNER JOIN
                         dbo.TableDevice ON dbo.ViewCurrentState.DeviceID = dbo.TableDevice.ID INNER JOIN
                         dbo.TableDeviceType ON dbo.TableDevice.TypeID = dbo.TableDeviceType.ID INNER JOIN
                         dbo.TableGroup ON dbo.TableDevice.GroupID = dbo.TableGroup.ID INNER JOIN
                         dbo.TableCOSEMLogicalDevice ON dbo.TableDeviceType.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID INNER JOIN
                         dbo.TableCOSEMObject ON dbo.TableDeviceType.ID = dbo.TableCOSEMObject.DeviceTypeID INNER JOIN
                         dbo.TableCOSEMClass ON dbo.TableCOSEMObject.COSEMClassID = dbo.TableCOSEMClass.ID INNER JOIN
                         dbo.TableCOSEMAttribute ON dbo.TableCOSEMClass.ID = dbo.TableCOSEMAttribute.COSEMClassID
GO
