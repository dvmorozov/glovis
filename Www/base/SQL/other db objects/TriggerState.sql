
DROP TRIGGER TriggerState
GO

CREATE TRIGGER TriggerState
	ON TableState
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@DeletedCount > 0) BEGIN
		UPDATE TableAddress
		SET StateID = NULL
		WHERE StateID IN (SELECT ID FROM DELETED)
	END
