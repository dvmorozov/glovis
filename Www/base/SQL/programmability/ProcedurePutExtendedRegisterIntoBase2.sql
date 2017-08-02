
DROP PROCEDURE PutExtendedRegisterIntoBase2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/11/2013
-- Description:	This version uses the configuration table.
-- =============================================
CREATE PROCEDURE PutExtendedRegisterIntoBase2
	@ValueIdentifier NVARCHAR(MAX),
	@Units NCHAR(36),
	@IntValue INT,
	@StringValue VARCHAR(MAX),
	@IntStatus INT,
	@Year INT,
	@Month INT,
	@DayOfMonth INT,
	@DayOfWeek NVARCHAR(MAX),
	@Hour INT,
	@Minute INT,
	@Second INT,
	@HundredthsOfSecond INT
AS
BEGIN
	DECLARE @T TABLE (ValueIdentifier UNIQUEIDENTIFIER, QualityBad BIT, MeasurementTime DATETIME2(7), Value DECIMAL(19, 6), StringValue VARCHAR(MAX), Units NCHAR(36))
	
	INSERT @T
	SELECT CONVERT(UNIQUEIDENTIFIER, @ValueIdentifier) AS ValueIdentifier, 
		CAST(@IntStatus AS BIT) AS QualityBad,
		CONVERT(DATETIME2(7), 
			CAST(@Year AS NVARCHAR(4)) + '-' +
			CAST(@Month AS NVARCHAR(2)) + '-' +
			CAST(@DayOfMonth AS NVARCHAR(2)) + 
			' ' +
			CAST(@Hour AS NVARCHAR(2)) + ':' +
			CAST(@Minute AS NVARCHAR(2)) + ':' +
			CAST(@Second AS NVARCHAR(2)) + '.' +
			CAST(@HundredthsOfSecond * 10 AS NVARCHAR(3))
			) AS MeasurementTime,
		CAST(@IntValue AS DECIMAL(19, 6)) AS Value,
		CAST(@StringValue AS VARCHAR(MAX)) AS StringValue,
		@Units

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM @T

	DECLARE @STRERRORMESSAGE NVARCHAR(1000)
	SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2: number of items = ' + CAST(@Count AS VARCHAR(MAX))
	EXEC AddMessageToAppLog @STRERRORMESSAGE

	IF @Count <> 0
	BEGIN	
		DECLARE @DeviceID BIGINT = NULL
		DECLARE @StartTime DATETIME2(7) = SYSDATETIME()
		DECLARE @AcquisitionTime DATETIME2(7) = SYSDATETIME() -- single value for all data
		DECLARE @EndTime DATETIME2(7) = NULL
		DECLARE @ResultID BIGINT = 0
		DECLARE @Parameters NCHAR(200) = ''
		DECLARE @DeviceIdent NCHAR(20) = 'XML capable device'
		DECLARE @SessionType NCHAR(20) = 'XML data uploading'
		DECLARE @Secondary BIT = 0
		DECLARE @DataOwnerID UNIQUEIDENTIFIER
		DECLARE @SaveSessions BIT = 0
		DECLARE @IsOBIS BIT = 0
		DECLARE @SessionIDs TABLE (ID BIGINT)
		DECLARE @SessionID BIGINT
		DECLARE @CurrentStateID BIGINT = NULL
		
		-- device identifier is not included into XML-document today,
		-- so it is given from the current state record
		SELECT TOP(1) @DeviceID = tcs.DeviceID, @DataOwnerID = tcs.DataOwnerID, @SaveSessions = td.SaveSessions, @CurrentStateID = tcs.ID
		FROM TableCurrentState AS tcs 
			INNER JOIN TableDevice AS td ON td.ID = tcs.DeviceID
		WHERE ValueIdentifier IN (SELECT ValueIdentifier FROM @T)
		
		-- inserts new data
		SET @EndTime = SYSDATETIME()		
		IF @SaveSessions = 1
		BEGIN
			INSERT INTO TableSession (DeviceID, StartTime, EndTime, SessionType, ResultID, Parameters, 
				DeviceIdent, Secondary, DataOwnerID, Data)
			OUTPUT INSERTED.ID INTO @SessionIDs
			VALUES (@DeviceID, @StartTime, @EndTime, @SessionType, @ResultID, @Parameters, 
				@DeviceIdent, @Secondary, @DataOwnerID, 'PutExtendedRegisterIntoBase2')
		END
		ELSE
		BEGIN
			INSERT INTO TableSession (DeviceID, StartTime, EndTime, SessionType, ResultID, Parameters, 
				DeviceIdent, Secondary, DataOwnerID)
			OUTPUT INSERTED.ID INTO @SessionIDs
			VALUES (@DeviceID, @StartTime, @EndTime, @SessionType, @ResultID, @Parameters, 
				@DeviceIdent, @Secondary, @DataOwnerID)
		END
		
		SELECT @SessionID = MAX(ID) FROM @SessionIDs
	
		DECLARE @Cursor CURSOR, 
				@QualityBad BIT, 
				@MeasurementTime DATETIME2(7), 
				@Value DECIMAL(19, 6)
				
		SET     @Cursor = CURSOR FOR 
			SELECT ValueIdentifier, QualityBad, MeasurementTime, Value, StringValue, Units FROM @T
		OPEN @Cursor	
		
		DECLARE @ElementID BIGINT		

		WHILE 1=1
		BEGIN
			FETCH FROM @Cursor INTO @ValueIdentifier, @QualityBad, @MeasurementTime, @Value, @StringValue, @Units
			IF @@fetch_status <> 0 BREAK
			
			SET @ElementID = (SELECT ID FROM TableCurrentState WHERE ValueIdentifier = @ValueIdentifier)			
			
			UPDATE TableCurrentState
			SET MeasurementTime = @MeasurementTime, AcquisitionTime = @AcquisitionTime,
				Value = @Value, StringValue = @StringValue, Units = @Units, QualityBad = @QualityBad
			WHERE ValueIdentifier = @ValueIdentifier AND AcquisitionDisabled = 0
			
			INSERT INTO TableDataPoint (MeasurementTime, AcquisitionTime, Value, StringValue,
				Units, SessionID, IsOBIS, QualityBad, DataOwnerID, ElementID, ValueIdentifier)
			VALUES (@MeasurementTime, @AcquisitionTime, @Value, @StringValue, @Units, @SessionID, 
				@IsOBIS, @QualityBad, @DataOwnerID, @ElementID, @ValueIdentifier)
		END
		
		-- session number limitation
		-- must be after the insertion for proper number of row calculation
		DECLARE @MaxSessionNumber BIGINT
		SET @MaxSessionNumber = (
			SELECT TOP(1) MaxSessionNumber 
			FROM TableCurrentStateConfig
			WHERE CurrentStateID = @CurrentStateID
			)
		-- use default
		IF @MaxSessionNumber IS NULL SET @MaxSessionNumber = 4000
		
		SELECT @Count = COUNT(*) FROM TableSession
		WHERE DataOwnerID = @DataOwnerID AND DeviceID = @DeviceID
		
		IF @Count > @MaxSessionNumber
		BEGIN
			-- Calculates the number of rows to be deleted.
			SET @Count = @Count - @MaxSessionNumber
			DECLARE @DeletedSessionIDs TABLE (ID BIGINT)
			
			INSERT INTO @DeletedSessionIDs (ID)
			SELECT TOP(@Count) ID FROM TableSession
			WHERE DataOwnerID = @DataOwnerID AND DeviceID = @DeviceID
			ORDER BY ID ASC

			SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2: number of sessions to delete = ' + CAST(@Count AS VARCHAR(MAX))
			EXEC AddMessageToAppLog @STRERRORMESSAGE

			DECLARE @Cursor1 CURSOR, @FileName VARCHAR(MAX)
			SET @Cursor1 = CURSOR FOR 
				SELECT StringValue FROM TableDataPoint WHERE SessionID IN (SELECT ID FROM @DeletedSessionIDs)
			OPEN @Cursor1	
		
			WHILE 1=1
			BEGIN
				FETCH FROM @Cursor1 INTO @FileName
				IF @@fetch_status <> 0 BREAK

				SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2 is going to delete ' + @FileName
				EXEC AddMessageToAppLog @STRERRORMESSAGE

				EXEC DeleteFiles @FileName
			END

			DELETE FROM TableDataPoint WHERE SessionID IN (SELECT ID FROM @DeletedSessionIDs)
			DELETE FROM TableSession WHERE ID IN (SELECT ID FROM @DeletedSessionIDs)
		END
	END		
END		
		
		
	
