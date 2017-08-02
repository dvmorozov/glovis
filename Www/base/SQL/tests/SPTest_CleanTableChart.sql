
DROP PROCEDURE SPTest_CleanTableChart
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
CREATE PROCEDURE SPTest_CleanTableChart 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NOT NULL
	BEGIN
		DELETE FROM TableChart
		WHERE DataOwnerID = @DataOwnerID
	END
	ELSE
	BEGIN
		DELETE FROM TableChart
		WHERE 1 = 1
	END
END
GO
