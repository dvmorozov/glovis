
DROP TRIGGER TriggerCountry
GO

CREATE TRIGGER TriggerCountry
	ON TableCountry
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET CountryID = NULL
		WHERE CountryID IN (SELECT ID FROM DELETED)
	END
