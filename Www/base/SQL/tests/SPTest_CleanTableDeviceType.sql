
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableDeviceType
GO

CREATE PROCEDURE SPTest_CleanTableDeviceType
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableCOSEMObject @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceType
		WHERE DataOwnerID = @DataOwnerID
	END
	--	other tables are cleaned by cascade operations
	COMMIT
END
GO