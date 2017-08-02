
DROP TRIGGER TriggerZipCode
GO

CREATE TRIGGER TriggerZipCode
	ON TableZipCode
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET ZipCodeID = NULL
		WHERE ZipCodeID IN (SELECT ID FROM DELETED)
	END
