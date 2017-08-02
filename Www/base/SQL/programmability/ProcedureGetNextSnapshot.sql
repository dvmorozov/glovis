
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE GetNextSnapshot
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE GetNextSnapshot 
	@SerieID UNIQUEIDENTIFIER,
	@SnapshotID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID AND CAST(Value AS BIGINT) > @SnapshotID
	ORDER BY CAST(Value AS BIGINT) ASC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END
GO
