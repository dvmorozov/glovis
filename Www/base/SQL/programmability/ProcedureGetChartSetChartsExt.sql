
DROP PROCEDURE GetChartSetChartsExt
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/14
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
-- =============================================
CREATE PROCEDURE GetChartSetChartsExt 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewChartSetsChartsExt
	WHERE (ChartSetID = @ChartSetID OR ChartSetID IS NULL) AND (DataOwnerID = @DataOwnerID)
END
GO
