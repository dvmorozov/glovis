
DROP PROCEDURE DeleteChartSetsCharts
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteChartSetsCharts 
	@ChartSetID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM TableChartSetsCharts
	WHERE (ChartSetID = @ChartSetID) AND (ChartID = @ChartID) 
		AND (DataOwnerID = @DataOwnerID)
END
GO
