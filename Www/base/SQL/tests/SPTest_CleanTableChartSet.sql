
DROP PROCEDURE SPTest_CleanTableChartSet
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
CREATE PROCEDURE SPTest_CleanTableChartSet 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableChartSet
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableChartSet
		WHERE @DataOwnerID = DataOwnerID
	END
END
GO
