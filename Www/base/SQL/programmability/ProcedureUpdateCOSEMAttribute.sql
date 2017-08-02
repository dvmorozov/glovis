
DROP PROCEDURE UpdateCOSEMAttribute
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
CREATE PROCEDURE UpdateCOSEMAttribute 
	@ID BIGINT,
	@COSEMClassID BIGINT, 
	@Dynamic BIT,
	@Name NCHAR(100),
	@COSEMDataTypeID BIGINT,
	@MinValue FLOAT,
	@MaxValue FLOAT,
	@DefValue FLOAT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMAttribute
	SET COSEMClassID = @COSEMClassID, Dynamic = @Dynamic, Name = @Name, COSEMDataTypeID = @COSEMDataTypeID, 
		MinValue = @MinValue, MaxValue = @MaxValue, DefValue = @DefValue
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
