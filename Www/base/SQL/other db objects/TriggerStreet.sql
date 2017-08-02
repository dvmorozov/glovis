
DROP TRIGGER TriggerStreet
GO

CREATE TRIGGER TriggerStreet
	ON TableStreet
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET StreetID = NULL
		WHERE StreetID IN (SELECT ID FROM DELETED)
	END
