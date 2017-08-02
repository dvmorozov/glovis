
DROP PROCEDURE GetFilteredElements
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 22/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetFilteredElements 
	@ElementInstanceName NVARCHAR(MAX),
	@OwnerID BIGINT,
	@GroupID BIGINT,
	@LocationID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER,
	@ChartID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @OwnerDeviceIDs TABLE (DeviceID BIGINT)
	IF @OwnerID IS NOT NULL
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE 
			(ID = @OwnerID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE (DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @LocationDeviceIDs TABLE (DeviceID BIGINT)
	IF @LocationID IS NOT NULL
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(LocationAddressID = @LocationID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @GroupDeviceIDs TABLE (DeviceID BIGINT)
	IF @GroupID IS NOT NULL
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(ID = @GroupID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @ElementIDs TABLE (ID BIGINT)
	IF @ElementInstanceName IS NOT NULL
	BEGIN
		INSERT INTO @ElementIDs
		SELECT ID FROM ViewElementInstanceName WHERE
			(FullName = @ElementInstanceName) AND (DataOwnerID = @DataOwnerID)		
	END
	ELSE
	BEGIN
		INSERT INTO @ElementIDs
		SELECT ID FROM ViewElementInstanceName WHERE
			(DataOwnerID = @DataOwnerID)		
	END
	
	SELECT TOP(100) veln.ID, veln.FullName, @ChartID AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.ID IN (SELECT ID FROM @ElementIDs) OR NOT EXISTS (SELECT ID FROM @ElementIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs))
	UNION
	SELECT TOP(100) veln.ID, veln.FullName, NULL AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE NOT EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.ID IN (SELECT ID FROM @ElementIDs) OR NOT EXISTS (SELECT ID FROM @ElementIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs))
END
GO
