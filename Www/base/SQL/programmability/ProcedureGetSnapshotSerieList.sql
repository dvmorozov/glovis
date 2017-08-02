
DROP PROCEDURE GetSnapshotSerieList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 30.06.2012
-- Description:	
-- =============================================
CREATE PROCEDURE GetSnapshotSerieList 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ElementID BIGINT
	SELECT TOP(1) @ElementID = ElementID
	FROM TableChartsDataTypes
	WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
			
	IF @ElementID IS NOT NULL
	BEGIN
		SELECT MIN(AcquisitionTime) AS StartTime, MAX(AcquisitionTime) AS EndTime, CAST(COUNT(*) AS BIGINT) AS [Count], Units, '' AS Name
		FROM TableDataPoint
		WHERE Units IN (SELECT DISTINCT Units FROM TableDataPoint WHERE ElementID = @ElementID)
		GROUP BY Units
		ORDER BY StartTime
	END
END
GO
