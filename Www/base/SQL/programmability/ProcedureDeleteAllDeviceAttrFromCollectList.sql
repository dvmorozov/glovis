
DROP PROCEDURE DeleteAllDeviceAttrFromCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure deletes all of physical
--				device attributes from collect list.
-- =============================================
CREATE PROCEDURE DeleteAllDeviceAttrFromCollectList 
	@DeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCurrentState
	WHERE (DataOwnerID = @DataOwnerID) AND (DeviceID = @DeviceID) AND
			(DataTypeID IN (
				SELECT ID FROM ViewDataType
				WHERE COSEMObjectID IN (
					SELECT ID FROM TableCOSEMObject
					WHERE COSEMLogicalDeviceID IN (
						SELECT ID FROM TableCOSEMLogicalDevice
						WHERE DeviceTypeID = (
							SELECT TypeID FROM TableDevice
							WHERE ID = @DeviceID
							)
						)
					)
					AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				)				
			)	
END
GO
