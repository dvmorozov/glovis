
DROP PROCEDURE DeleteAttrFromCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D. Morozov
-- Create date: 13/07/11
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteAttrFromCollectList 
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    DELETE FROM TableCurrentState
	WHERE DataTypeID IN (
		SELECT ID
		FROM ViewDataType
		WHERE (COSEMAttributeID = @COSEMAttributeID) AND 
				(COSEMObjectID = @COSEMObjectID) AND 
				((DataOwnerID = @DataOwnerID) OR (Standard = 1)))
	AND (DataOwnerID = @DataOwnerID)
END
GO
