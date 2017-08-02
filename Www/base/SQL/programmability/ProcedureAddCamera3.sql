
DROP PROCEDURE AddCamera3
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 21/10/2013
-- Description:	Creates a new camera, 
--				associates view with it and 
--				returns the camera id and
--				the associated data id.
-- =============================================
CREATE PROCEDURE AddCamera3
	-- AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	--	Uses the stored procedure which sets AcquisitionDisable to 1 (true).
	EXEC AddAllDeviceAttrToCollectList2 @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT TOP(1) ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	DECLARE @ValueIdentifier UNIQUEIDENTIFIER
	SET @ValueIdentifier = (SELECT TOP(1) ValueIdentifier FROM ViewElementFiltered
		WHERE DeviceID = @DeviceID AND Attribute = 'URL')

	-- Names must be set up explicitly to 
	SELECT @DeviceID AS CameraID, @ValueIdentifier AS ValueIdentifier, @ElementID AS ElementID
END
GO
