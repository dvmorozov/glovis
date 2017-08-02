
DROP TRIGGER TriggerBuilding
GO

CREATE TRIGGER TriggerBuilding
	ON TableBuilding
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET BuildingID = NULL
		WHERE BuildingID IN (SELECT ID FROM DELETED)
	END
