
DROP PROCEDURE DeleteChartSet
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteChartSet 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChartSet
	WHERE ID = @ChartSetID AND DataOwnerID = @DataOwnerID
END
GO
