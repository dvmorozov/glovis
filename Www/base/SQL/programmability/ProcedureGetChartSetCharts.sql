
DROP PROCEDURE GetChartSetCharts
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 05/01/12
-- Description:	
-- =============================================
CREATE PROCEDURE GetChartSetCharts 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewChartSetsCharts
	WHERE (ChartSetID = @ChartSetID OR ChartSetID IS NULL) AND (DataOwnerID = @DataOwnerID)
END
GO
