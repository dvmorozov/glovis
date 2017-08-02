
DROP PROCEDURE CopyCOSEMAttribute
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/01/2012
-- Description:	
-- =============================================
CREATE PROCEDURE CopyCOSEMAttribute 
	@OldAttributeID BIGINT,
	@NewCOSEMClassID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TableCOSEMAttribute (COSEMClassID, Dynamic, Name, 
		COSEMDataTypeID, MinValue, MaxValue, DefValue, DataOwnerID, Standard)
	SELECT @NewCOSEMClassID, Dynamic, Name, 
		COSEMDataTypeID, MinValue, MaxValue, DefValue, @DataOwnerID, 0
	FROM TableCOSEMAttribute
	WHERE ID = @OldAttributeID
END
GO
