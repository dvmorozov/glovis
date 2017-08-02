
DROP TRIGGER TriggerDataPointOnDelete
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE TRIGGER TriggerDataPointOnDelete
	ON TableDataPoint
	FOR DELETE
AS  
	DECLARE @DeletedCount INT
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	
	DECLARE @STRERRORMESSAGE NVARCHAR(1000)
	SELECT @STRERRORMESSAGE = 'TriggerDataPointOnDelete: number of files to delete = ' + CAST(@DeletedCount AS NVARCHAR(MAX)) +
		', @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS NVARCHAR(MAX))
	EXEC AddMessageToAppLog @STRERRORMESSAGE
	
	IF (@DeletedCount > 0) 
	BEGIN
		DECLARE @TestMode BIT
		SET @TestMode = (SELECT TestMode FROM GetCurrentAppConfig())
		
		IF @TestMode IS NOT NULL AND @TestMode = 1
		BEGIN
			UPDATE TableUnitTestResult
			SET DeletedPointsCount = DeletedPointsCount + @DeletedCount
			WHERE DataOwnerID IN (SELECT DataOwnerID FROM DELETED)
		END
	END
