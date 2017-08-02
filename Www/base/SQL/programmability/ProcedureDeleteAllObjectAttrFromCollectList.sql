
DROP PROCEDURE DeleteAllObjectAttrFromCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure deletes all attributes
--				of each object of given logical device
--				to collect list.
-- =============================================
CREATE PROCEDURE DeleteAllObjectAttrFromCollectList 
	@DeviceID BIGINT,
	@LogicalDeviceID BIGINT,
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
				WHERE (COSEMObjectID IN (
					SELECT ID FROM TableCOSEMObject
					WHERE COSEMLogicalDeviceID = @LogicalDeviceID
					))
					AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				)				
			)	
END
GO
