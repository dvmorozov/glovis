
DROP TRIGGER TriggerCurrentStateOnDelete
GO

--	Deletes rows from the configuration table.
--  evernote:///view/14501366/s132/ed2609d2-b258-4f03-a603-87d65ea0956e/ed2609d2-b258-4f03-a603-87d65ea0956e/
CREATE TRIGGER TriggerCurrentStateOnDelete
	ON TableCurrentState
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	
	IF (@DeletedCount > 0) 
	BEGIN
		BEGIN TRAN
		
		DECLARE @Cursor CURSOR, @CurrentStateID BIGINT, @DataOwnerID UNIQUEIDENTIFIER
		SET @Cursor = CURSOR FOR 
			SELECT ID, DataOwnerID FROM DELETED
		OPEN @Cursor	
		
		DECLARE @TestMode BIT
		SET @TestMode = (SELECT TestMode FROM GetCurrentAppConfig())
		
		WHILE 1=1
		BEGIN
			FETCH FROM @Cursor INTO @CurrentStateID, @DataOwnerID
			IF @@fetch_status <> 0 BREAK
					
			DELETE FROM TableCurrentStateConfig 
			WHERE CurrentStateID = @CurrentStateID
			
			IF @TestMode IS NOT NULL AND @TestMode = 1
			BEGIN
				UPDATE TableUnitTestResult
				SET DeletedCurrentStateCount = DeletedCurrentStateCount + 1
				WHERE DataOwnerID = @DataOwnerID
			END
		END			
		
		COMMIT
	END