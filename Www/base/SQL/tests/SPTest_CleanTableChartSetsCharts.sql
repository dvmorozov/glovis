
DROP PROCEDURE SPTest_CleanTableChartSetsCharts
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
CREATE PROCEDURE SPTest_CleanTableChartSetsCharts 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NOT NULL
	BEGIN
		DELETE FROM TableChartSetsCharts
		WHERE DataOwnerID = @DataOwnerID
	END
	ELSE
	BEGIN
		DELETE FROM TableChartSetsCharts
		WHERE 1 = 1
	END
END
GO