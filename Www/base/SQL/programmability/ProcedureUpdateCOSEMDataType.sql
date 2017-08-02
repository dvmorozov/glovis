
DROP PROCEDURE UpdateCOSEMDataType
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateCOSEMDataType 
	@ID BIGINT,
	@Name NCHAR(20), 
	@AncestorTypeID BIGINT,
	@ItemBitSize BIGINT,
	@ItemCount BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMDataType
	SET Name = @Name, AncestorTypeID = @AncestorTypeID, ItemBitSize = @ItemBitSize, 
		ItemCount = @ItemCount, @Standard = Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
