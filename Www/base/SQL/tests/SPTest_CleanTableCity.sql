
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableCity
GO

CREATE PROCEDURE SPTest_CleanTableCity
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCity
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCity
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO