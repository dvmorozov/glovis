
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableDataPoint
GO

CREATE PROCEDURE SPTest_CleanTableDataPoint
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDataPoint
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDataPoint
		WHERE @DataOwnerID = DataOwnerID
	END
END
GO