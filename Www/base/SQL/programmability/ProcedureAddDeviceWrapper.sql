
DROP PROCEDURE AddDeviceWrapper
GO

DROP PROCEDURE AddDeviceWrapper2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE AddDeviceWrapper 
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
	@DeviceID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Devices TABLE(ID BIGINT NOT NULL)
	INSERT INTO @Devices 
	EXEC AddDeviceInternal
		@Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID, @OwnerID,
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3,
		@SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions
		
	SET	@DeviceID = (SELECT TOP(1) ID FROM @Devices)
END
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 20/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE AddDeviceWrapper2
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
	@Domain NCHAR(30) = NULL, 
	@DeviceID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Devices TABLE(ID BIGINT NOT NULL)
	INSERT INTO @Devices 
	EXEC AddDeviceInternal2
		@Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID, @OwnerID,
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3,
		@SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions, @Domain
		
	SET	@DeviceID = (SELECT TOP(1) ID FROM @Devices)
END
GO
