
DROP PROCEDURE UpdateCOSEMMethod
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
CREATE PROCEDURE UpdateCOSEMMethod 
	@ID BIGINT,
	@COSEMClassID BIGINT,
	@Name NCHAR(100),
	@Mandatory BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMMethod
	SET COSEMClassID = @COSEMClassID, Name = @Name, Mandatory = @Mandatory
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
