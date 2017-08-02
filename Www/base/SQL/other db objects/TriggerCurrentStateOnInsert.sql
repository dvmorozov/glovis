
DROP TRIGGER TriggerCurrentStateOnInsert
GO

--	Inserts rows into the configuration table.
--  evernote:///view/14501366/s132/ed2609d2-b258-4f03-a603-87d65ea0956e/ed2609d2-b258-4f03-a603-87d65ea0956e/
CREATE TRIGGER TriggerCurrentStateOnInsert
	ON TableCurrentState
	FOR INSERT
AS  
	DECLARE @InsertedCount INT
	SET @InsertedCount = (SELECT COUNT(*) FROM INSERTED)
	
	IF (@InsertedCount > 0) 
	BEGIN
		BEGIN TRAN
		
		DECLARE @Cursor CURSOR, @CurrentStateID BIGINT, @DataOwnerID UNIQUEIDENTIFIER
		SET @Cursor = CURSOR FOR 
			SELECT ID, DataOwnerID FROM INSERTED
		OPEN @Cursor	
		
		DECLARE @TestMode BIT
		SET @TestMode = (SELECT TestMode FROM GetCurrentAppConfig())
		
		WHILE 1=1
		BEGIN
			FETCH FROM @Cursor INTO @CurrentStateID, @DataOwnerID
			IF @@fetch_status <> 0 BREAK
					
			INSERT INTO TableCurrentStateConfig (MaxSessionNumber, DataOwnerID, CurrentStateID)
			VALUES (10, @DataOwnerID, @CurrentStateID)
			
			IF @TestMode IS NOT NULL AND @TestMode = 1
			BEGIN
				UPDATE TableUnitTestResult
				SET InsertedCurrentStateCount = InsertedCurrentStateCount + 1
				WHERE DataOwnerID = @DataOwnerID
			END
		END			
		
		COMMIT
	END