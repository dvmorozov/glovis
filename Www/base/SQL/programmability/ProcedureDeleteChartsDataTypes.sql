
DROP PROCEDURE DeleteChartsDataTypes
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
CREATE PROCEDURE DeleteChartsDataTypes 
	@ChartID BIGINT,
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChartsDataTypes
	WHERE (@ChartID = ChartID) AND (@ElementID = ElementID) 
		AND (@DataOwnerID = DataOwnerID)
END
GO