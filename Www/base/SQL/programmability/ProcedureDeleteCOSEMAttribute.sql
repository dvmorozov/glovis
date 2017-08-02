
DROP PROCEDURE DeleteCOSEMAttribute
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteCOSEMAttribute 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableDataType WHERE COSEMAttributeID IN
		-- additional check for consistency
		(SELECT ID FROM TableCOSEMAttribute WHERE DataOwnerID = @DataOwnerID)
    DELETE FROM TableCOSEMAttribute WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
