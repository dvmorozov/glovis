
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableDeviceLog
GO

CREATE PROCEDURE SPTest_CleanTableDeviceLog
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceLog
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceLog
		WHERE @DataOwnerID = DataOwnerID
	END
END
GO