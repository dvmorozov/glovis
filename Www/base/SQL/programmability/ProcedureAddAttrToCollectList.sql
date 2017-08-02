
DROP PROCEDURE AddAttrToCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/07/11
-- Description:	The procedure adds attribute to the collection list.
-- =============================================
CREATE PROCEDURE AddAttrToCollectList 
	@DeviceID BIGINT, -- Physical device id
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableCurrentState
	WHERE DataOwnerID = @DataOwnerID
	
	SET @Count = 100 - @Count
	
	IF @Count > 0
	BEGIN
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, Identifier, ValueIdentifier, AcquisitionDisabled)
		SELECT TOP(@Count) ID, @DeviceID, @DataOwnerID, Identifier, NEWID(), 0
		FROM ViewDataType
		WHERE (COSEMObjectID = @COSEMObjectID) AND (COSEMAttributeID = @COSEMAttributeID)
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
	END
END
GO
