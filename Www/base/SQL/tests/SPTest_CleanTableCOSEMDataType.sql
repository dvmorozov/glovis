
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableCOSEMDataType
GO

CREATE PROCEDURE SPTest_CleanTableCOSEMDataType
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableCOSEMComplexTypeField @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMDataType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMDataType
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END
GO