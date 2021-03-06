
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableProcessLogContents
GO

CREATE PROCEDURE SPTest_CleanTableProcessLogContents
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableProcessLogMessages @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableProcessLogContents
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableProcessLogContents
		WHERE 1 = 1 --@DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO
