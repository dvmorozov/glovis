
DROP PROCEDURE DeleteCOSEMClass
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
CREATE PROCEDURE DeleteCOSEMClass 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    -- we should not do anything here because record from TableDataType
    -- is deleted by cascade operation through TableCOSEMObject
    DELETE FROM TableCOSEMClass WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
