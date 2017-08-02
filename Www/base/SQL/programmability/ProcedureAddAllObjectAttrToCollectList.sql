
DROP PROCEDURE AddAllObjectAttrToCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure adds all attributes
--				of each object of given logical device
--				to collect list.
-- =============================================
CREATE PROCEDURE AddAllObjectAttrToCollectList 
	@DeviceID BIGINT, 
	@LogicalDeviceID BIGINT,
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
		SELECT TOP(@Count) t1.ID, @DeviceID, @DataOwnerID, t1.Identifier, NEWID(), 0
		FROM (
			SELECT ID, COSEMAttributeID, Identifier FROM ViewDataType
			WHERE COSEMObjectID IN (
				SELECT ID FROM TableCOSEMObject
				WHERE COSEMLogicalDeviceID = @LogicalDeviceID)
			AND (
				COSEMAttributeID NOT IN
				(SELECT DISTINCT AttributeID FROM ViewCOSEMAttributeValue
				WHERE DeviceID = @DeviceID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NOT NULL
				))
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))) AS t1
		JOIN (
			SELECT ID, COSEMDataTypeID FROM TableCOSEMAttribute) AS t2
		ON t2.ID = t1.COSEMAttributeID
	END
END
GO
