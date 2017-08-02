
DROP PROCEDURE UpdateCOSEMClass
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
CREATE PROCEDURE UpdateCOSEMClass 
	@ID BIGINT,
	@ClassName NCHAR(100),
	@CardinalityMin INT,
	@CardinalityMax INT,
	@COSEMClassID INT,
	@Version NCHAR(10),
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableCOSEMClass
	SET ClassName = @ClassName, CardinalityMin = @CardinalityMin, CardinalityMax = @CardinalityMax,
		COSEMClassID = @COSEMClassID, Version = @Version, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCOSEMAttribute
	SET Standard = @Standard
	WHERE COSEMClassID = @ID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCOSEMMethod
	SET Standard = @Standard
	WHERE COSEMClassID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
