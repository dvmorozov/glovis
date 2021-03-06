
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableOBISGroup
GO

CREATE PROCEDURE SPTest_CleanTableOBISGroup
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableOBISSet @DataOwnerID
	EXEC SPTest_CleanTableOBISGroupLink @DataOwnerID
	EXEC SPTest_CleanTableDeviceOBISGroup @DataOwnerID
	EXEC SPTest_CleanTableDeviceType @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableOBISGroup
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableOBISGroup
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO