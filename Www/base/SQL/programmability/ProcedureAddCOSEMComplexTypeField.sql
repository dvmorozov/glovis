
DROP PROCEDURE AddCOSEMComplexTypeField
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
CREATE PROCEDURE AddCOSEMComplexTypeField 
	@Name NCHAR(20),
	@AggregateTypeID BIGINT,
	@TypeID BIGINT,
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
	FROM TableCOSEMComplexTypeField
	WHERE Name = @Name AND AggregateTypeID = @AggregateTypeID AND 
		TypeID = @TypeID AND DataOwnerID = @DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMComplexTypeField
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMComplexTypeField 
				(Name, AggregateTypeID, TypeID, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@Name, @AggregateTypeID, @TypeID, @DataOwnerID, @Standard)
				
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
