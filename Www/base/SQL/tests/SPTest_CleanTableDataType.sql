
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableDataType
GO

CREATE PROCEDURE SPTest_CleanTableDataType
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDataType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDataType
		WHERE @DataOwnerID = DataOwnerID
	END
	-- all other tables are cleaned by cascade operations
END
GO