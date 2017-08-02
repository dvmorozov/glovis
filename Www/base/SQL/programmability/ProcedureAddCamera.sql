
DROP PROCEDURE AddCamera
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	Creates new camera and associates a view with it.
-- =============================================
CREATE PROCEDURE AddCamera 
	--	AddDevice parameters.
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
	EXEC AddAllDeviceAttrToCollectList @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	SELECT @DeviceID
END
GO
