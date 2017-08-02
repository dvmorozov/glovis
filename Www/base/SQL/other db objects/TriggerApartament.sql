
DROP TRIGGER TriggerApartament
GO

CREATE TRIGGER TriggerApartament
	ON TableApartament
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET ApartamentID = NULL
		WHERE ApartamentID IN (SELECT ID FROM DELETED)
	END
