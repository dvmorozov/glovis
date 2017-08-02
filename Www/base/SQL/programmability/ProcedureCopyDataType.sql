
DROP PROCEDURE CopyDataType
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE CopyDataType 
	@OldDataTypeID BIGINT,
	@NewCOSEMAttributeID BIGINT,
	@NewCOSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TableDataType (Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID)
	SELECT Identifier, @NewCOSEMAttributeID, @NewCOSEMObjectID, @DataOwnerID
	FROM TableDataType
	WHERE ID = @OldDataTypeID
END
GO
