
DROP TRIGGER TriggerDeviceOwner
GO

CREATE TRIGGER TriggerDeviceOwner
	ON TableDeviceOwner
	FOR INSERT, UPDATE, DELETE
AS
	DECLARE @InsertedCount INT
	DECLARE @DeletedCount INT
	SET @InsertedCount = (SELECT COUNT(*) FROM INSERTED)
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@InsertedCount > 0) BEGIN
		INSERT INTO TableDeviceOwnerLog 
			(Action, Timestamp, DeviceOwnerID,
			ActorID, FirstName, LastName, Company, Building,
			StreetAddress, City, State, Country, ZipCode,
			EMail, Phone, Cell
			)
		SELECT CASE 
			WHEN (@DeletedCount > 0) THEN 'Update'
			ELSE 'Insert'
			END,
			CURRENT_TIMESTAMP,
			ID, CURRENT_USER, FirstName, LastName, Company, Building,
			StreetAddress, City, State, Country, ZipCode, 
			EMail, Phone, Cell
		FROM INSERTED
	END
	ELSE IF (@DeletedCount > 0) BEGIN
		INSERT INTO TableDeviceOwnerLog 
			(Action, Timestamp, DeviceOwnerID,
			ActorID, FirstName, LastName, Company, Building,
			StreetAddress, City, State, Country, ZipCode,
			EMail, Phone, Cell
			)
		SELECT 'Delete',
			CURRENT_TIMESTAMP,
			ID, CURRENT_USER, FirstName, LastName, Company, Building,
			StreetAddress, City, State, Country, ZipCode, 
			EMail, Phone, Cell
		FROM DELETED
	END