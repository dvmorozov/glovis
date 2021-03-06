
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableSession
GO

CREATE PROCEDURE SPTest_CleanTableSession
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCurrentState WHERE 1 = 1 
		DELETE FROM TableEvent WHERE 1 = 1
		DELETE FROM TableDataPoint WHERE 1 = 1 
		DELETE FROM TableSession WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCurrentState WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableEvent WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableDataPoint WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableSession WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO