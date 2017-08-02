
DROP PROCEDURE GetPointsVsAcqTime_Last
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE GetPointsVsAcqTime_Last 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@LastPointCount BIGINT	-- number of last points
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetPointsVsAcqTimeDataset_Last @ChartID, @DataOwnerID, @LastPointCount

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END
GO
