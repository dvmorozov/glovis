
DROP PROCEDURE AddCOSEMDataType
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2001
-- Description:	
-- =============================================
CREATE PROCEDURE AddCOSEMDataType 
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
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableCOSEMDataType
	WHERE Name = @Name AND AncestorTypeID = @AncestorTypeID AND ItemBitSize = @ItemBitSize AND 
		ItemCount = @ItemCount AND DataOwnerID = @DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMDataType
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMDataType 
				(Name, AncestorTypeID, ItemBitSize, ItemCount, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@Name, @AncestorTypeID, @ItemBitSize, @ItemCount, @DataOwnerID, @Standard)
			
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
