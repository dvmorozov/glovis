
DROP PROCEDURE GetChartElements
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 23/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetChartElements 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ElementID FROM ViewChartsDataTypes
	WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
END
GO
