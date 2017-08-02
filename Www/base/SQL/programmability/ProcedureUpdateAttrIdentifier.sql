
DROP PROCEDURE UpdateAttrIdentifier
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/07/11
-- Description:	The procedure adds or updates
--				the link between COSEM object 
--				attribute (COSEM logical model)
--				and device data item identifier
--				(device logical model).
-- =============================================
CREATE PROCEDURE UpdateAttrIdentifier 
	@Identifier NCHAR(20), 
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Standard BIT
	SELECT @Standard = Standard
	FROM TableCOSEMAttribute
	WHERE ID = @COSEMAttributeID

    DECLARE @COUNT BIGINT = 0
    SELECT @COUNT = COUNT(*)
    FROM TableDataType
    WHERE (COSEMAttributeID = @COSEMAttributeID) AND
		-- "standard" attributes also should be accounted!
		(COSEMObjectID = @COSEMObjectID) AND (DataOwnerID = @DataOwnerID OR @Standard = 1)
		
	IF @COUNT = 0
	BEGIN
		INSERT INTO TableDataType(COSEMAttributeID, COSEMObjectID, Identifier, DataOwnerID)
		VALUES (@COSEMAttributeID, @COSEMObjectID, @Identifier, @DataOwnerID)
	END
	ELSE
	BEGIN
		UPDATE TableDataType
		SET Identifier = @Identifier
		-- update is allowed only for owner of the object!
		WHERE (COSEMAttributeID = @COSEMAttributeID) AND
			(COSEMObjectID = @COSEMObjectID) AND (DataOwnerID = @DataOwnerID)
	END
END
GO
