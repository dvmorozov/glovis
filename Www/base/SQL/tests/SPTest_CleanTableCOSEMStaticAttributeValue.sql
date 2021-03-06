
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableCOSEMStaticAttributeValue
GO

CREATE PROCEDURE SPTest_CleanTableCOSEMStaticAttributeValue
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMStaticAttributeValue
		WHERE 1 = 1
	END
END
GO