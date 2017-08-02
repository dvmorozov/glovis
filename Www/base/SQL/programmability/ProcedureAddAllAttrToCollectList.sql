
DROP PROCEDURE AddAllAttrToCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/07/11
-- Description:	The procedure adds all attributes of 
--              given object to collect list.
-- =============================================
CREATE PROCEDURE AddAllAttrToCollectList 
	@DeviceID BIGINT, -- Physical device id
	@ObjectID BIGINT,
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
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, ValueIdentifier, AcquisitionDisabled, Identifier)
		SELECT TOP(@Count) DataTypeID, @DeviceID, @DataOwnerID, NEWID(), 0, Identifier
		FROM ViewCOSEMAttributeValue
		WHERE
			DataTypeID IN
			(SELECT DataTypeID FROM ViewCOSEMAttributeValue
			WHERE COSEMObjectID = @ObjectID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NULL)
	END
END
GO
