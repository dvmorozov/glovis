
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableAddress
GO

CREATE PROCEDURE SPTest_CleanTableAddress
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDeviceOwner @DataOwnerID
	EXEC SPTest_CleanTableDevice @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableAddress
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableAddress
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO