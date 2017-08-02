
DROP PROCEDURE AddAllDeviceAttrToCollectList
GO

DROP PROCEDURE AddAllDeviceAttrToCollectListInternal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 07/04/14
--				https://www.evernote.com/shard/s132/nl/14501366/04de2b98-e715-4f61-bcba-8eded24a4269
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
-- =============================================
CREATE PROCEDURE AddAllDeviceAttrToCollectListInternal 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER,
	@AcquisitionDisabled BIT
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
		SELECT TOP(@Count) t1.ID, @DeviceID, @DataOwnerID, t1.Identifier, NEWID(), @AcquisitionDisabled
		FROM (
			-- all attributes of all objects...
			SELECT ID, COSEMAttributeID, Identifier FROM ViewDataType
			-- ...of given physical device...
			WHERE COSEMObjectID IN (
				SELECT ID FROM TableCOSEMObject
				WHERE COSEMLogicalDeviceID IN (
					SELECT ID FROM TableCOSEMLogicalDevice
					WHERE DeviceTypeID = (
						SELECT TypeID FROM TableDevice
						WHERE ID = @DeviceID)))
			-- ...except those that already added
			AND (COSEMAttributeID NOT IN
				(SELECT DISTINCT AttributeID FROM ViewCOSEMAttributeValue
				WHERE DeviceID = @DeviceID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NOT NULL
				))
			-- single select condition is applied after all possible objects selection
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))) AS t1
		JOIN (
			SELECT ID, COSEMDataTypeID FROM TableCOSEMAttribute) AS t2
		ON t2.ID = t1.COSEMAttributeID
	END
END
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
-- =============================================
CREATE PROCEDURE AddAllDeviceAttrToCollectList 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddAllDeviceAttrToCollectListInternal @DeviceID, @DataOwnerID, 0	
END
GO
