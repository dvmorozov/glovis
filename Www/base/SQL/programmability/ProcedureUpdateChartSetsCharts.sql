
DROP PROCEDURE UpdateChartSetsCharts
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
CREATE PROCEDURE UpdateChartSetsCharts 
	@ChartSetID BIGINT,
	@ChartID BIGINT,
	@ColIndex BIGINT,
	@RowIndex BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableChartSetsCharts
	SET ColIndex = @ColIndex, RowIndex = @RowIndex
	WHERE (ChartSetID = @ChartSetID) AND (ChartID = @ChartID) 
		AND (DataOwnerID = @DataOwnerID)
END
GO
