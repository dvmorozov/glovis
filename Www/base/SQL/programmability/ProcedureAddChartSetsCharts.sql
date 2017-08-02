

DROP PROCEDURE AddChartSetsCharts
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
CREATE PROCEDURE AddChartSetsCharts 
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

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*)
	FROM TableChartSetsCharts
	WHERE ChartSetID = @ChartSetID AND ChartID = @ChartID AND DataOwnerID = @DataOwnerID
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartSetsCharts
		WHERE ChartSetID = @ChartSetID AND DataOwnerID = @DataOwnerID
		
		IF @Count < 10
		BEGIN
			INSERT INTO TableChartSetsCharts (ChartSetID, ChartID, ColIndex, RowIndex, DataOwnerID)
			VALUES (@ChartSetID, @ChartID, @ColIndex, @RowIndex, @DataOwnerID)
			SELECT 1
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		EXEC UpdateChartSetsCharts @ChartSetID, @ChartID, @ColIndex, @RowIndex, @DataOwnerID
		SELECT 1
	END
END
GO
