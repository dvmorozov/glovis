
DROP PROCEDURE GetPointsVsAcqTimeDataset_Last
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetPointsVsAcqTimeDataset_Last 
(	
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@LastPointCount BIGINT	-- number of last points
)
AS
BEGIN 
	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	DECLARE @Cursor CURSOR, 
			@ElID BIGINT
			
	SET     @Cursor = CURSOR FOR 
		SELECT ElementID FROM TableChartsDataTypes
		WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
	OPEN @Cursor	
	
	DECLARE @ElementID BIGINT		

	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @ElementID
		IF @@fetch_status <> 0 BREAK
		
		IF @LastPointCount = 1
		BEGIN
			--	optimized variant
			INSERT INTO @T
			-- ElementID should be here because there may be a few elements assiciated with given chart
			SELECT AcquisitionTime, Value, @ElementID AS ElementID, StringValue
			FROM TableCurrentState
			WHERE DataOwnerID = @DataOwnerID AND ID = @ElementID
		END
		ELSE
		BEGIN
			INSERT INTO @T
			SELECT * FROM (
				-- ElementID should be here because there may be a few elements assiciated with given chart
				SELECT TOP(@LastPointCount) AcquisitionTime, Value, @ElementID AS ElementID, StringValue
				FROM TableDataPoint
				WHERE DataOwnerID = @DataOwnerID AND ElementID = @ElementID
				-- order to get "last" values
				ORDER BY AcquisitionTime DESC
				) AS t
			ORDER BY t.AcquisitionTime ASC
		END
	END
	
	DECLARE @TMax DATETIME2(7)
	DECLARE @TMin DATETIME2(7)
	SELECT @TMax = MAX(AcquisitionTime), @TMin = MIN(AcquisitionTime)
	FROM @T
	
	DECLARE @Step INT
	DECLARE @Units NVARCHAR(20)
	DECLARE @Mult FLOAT
	
	EXEC GetTimeMult @TMax,	@TMin, @Step OUTPUT, @Units OUTPUT, @Mult OUTPUT
	
	DECLARE @Offset FLOAT
	SET @Offset = CONVERT(FLOAT, CONVERT(DATETIME, @TMin))
	
	IF @Mult <> 0
	BEGIN
		SELECT CONVERT(FLOAT, (CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) - @Offset) / @Mult) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
	END
	ELSE
	BEGIN
		SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
	END
END
GO
