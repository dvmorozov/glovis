
DROP PROCEDURE UpdateCOSEMComplexTypeField
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
CREATE PROCEDURE UpdateCOSEMComplexTypeField 
	@ID BIGINT,
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

	UPDATE TableCOSEMComplexTypeField
	SET Name = @Name, AggregateTypeID = @AggregateTypeID, TypeID = @TypeID, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
