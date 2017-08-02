
USE SGMasterBase
GO

DECLARE @User UNIQUEIDENTIFIER
SELECT @User = UserId FROM aspnet_Users
WHERE UserName = 'Administrator'

BEGIN TRANSACTION

UPDATE TableDeviceType
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMAttribute
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMClass
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMComplexTypeField
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMDataType
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMLogicalDevice
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMMethod
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMObject
SET DataOwnerID = @User WHERE 1 = 1

UPDATE TableCOSEMStaticAttributeValue
SET DataOwnerID = @User WHERE 1 = 1

COMMIT
