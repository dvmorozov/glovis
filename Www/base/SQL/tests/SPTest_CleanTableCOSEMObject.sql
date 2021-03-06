
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableCOSEMObject
GO

CREATE PROCEDURE SPTest_CleanTableCOSEMObject
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMObject
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMObject
		WHERE @DataOwnerID = DataOwnerID
	END
END
GO