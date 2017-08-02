
DROP TRIGGER TriggerDeviceUpdate
GO

CREATE TRIGGER TriggerDeviceUpdate
	ON TableDevice
	FOR UPDATE
AS
	INSERT INTO TableDeviceLog 
		(Action, Timestamp, DeviceID,
		ActorID, Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID,
		IP1, IP2, IP3, IP4
		)
	SELECT 
		'Update',
		CURRENT_TIMESTAMP,
		ID, CURRENT_USER, Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID,
		IP1, IP2, IP3, IP4
	FROM INSERTED
