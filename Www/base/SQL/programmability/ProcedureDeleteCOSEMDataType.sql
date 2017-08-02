
DROP PROCEDURE DeleteCOSEMDataType
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
CREATE PROCEDURE DeleteCOSEMDataType 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableCOSEMComplexTypeField WHERE (TypeID = @ID OR AggregateTypeID = @ID) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMComplexTypeField WHERE (TypeID IN 
		(SELECT ID FROM TableCOSEMDataType WHERE AncestorTypeID = @ID)) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMComplexTypeField WHERE (AggregateTypeID IN 
		(SELECT ID FROM TableCOSEMDataType WHERE AncestorTypeID = @ID)) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMDataType WHERE AncestorTypeID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMDataType WHERE ID = @ID AND DataOwnerID = @DataOwnerID	
	COMMIT
END
GO
