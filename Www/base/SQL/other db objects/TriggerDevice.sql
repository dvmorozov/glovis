
DROP TRIGGER TriggerDevice
GO

CREATE TRIGGER TriggerDevice
	ON TableDevice
	FOR INSERT, UPDATE, DELETE
AS  
	DECLARE @InsertedCount INT
	DECLARE @DeletedCount INT
	SET @InsertedCount = (SELECT COUNT(*) FROM INSERTED)
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@InsertedCount > 0) BEGIN
			INSERT INTO TableDeviceLog 
			(Action, Timestamp, DeviceID, ActorID, 
			Name, InternalAddress, AddressType,
			Port, GroupID, TypeID, OwnerID,
			IP1, IP2, IP3, IP4
			)
		SELECT CASE 
			WHEN (@DeletedCount > 0) THEN 'Update'
			ELSE 'Insert'
			END,
			CURRENT_TIMESTAMP, ID, CURRENT_USER, 
			Name, InternalAddress, AddressType,
			Port, GroupID, TypeID, OwnerID,
			IP1, IP2, IP3, IP4
		FROM INSERTED
	END
	ELSE IF (@DeletedCount > 0) BEGIN
		INSERT INTO TableDeviceLog
			(Action, Timestamp, DeviceID, ActorID, 
			Name, InternalAddress, AddressType,
			Port, GroupID, TypeID, OwnerID,
			IP1, IP2, IP3, IP4
			)
		SELECT 'Delete',
			CURRENT_TIMESTAMP, ID, CURRENT_USER, 
			Name, InternalAddress, AddressType,
			Port, GroupID, TypeID, OwnerID,
			IP1, IP2, IP3, IP4
		FROM DELETED
	END
