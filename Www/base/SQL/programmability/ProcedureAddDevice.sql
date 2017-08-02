
DROP PROCEDURE AddDevice
GO

DROP PROCEDURE AddDeviceInternal
GO

DROP PROCEDURE AddDeviceInternal2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 27/05/2013
-- Description:	The procedure adds new device to device group.
-- =============================================
CREATE PROCEDURE AddDeviceInternal
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
	@SaveSessions BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @InsertedID TABLE (ID BIGINT)
	
	INSERT INTO TableDevice (Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID, IP1, IP2, IP3, IP4,
		SecondaryPort, SecondaryIP1, SecondaryIP2, SecondaryIP3, SecondaryIP4, DataOwnerID, LocationAddressID, SaveSessions)
	OUTPUT INSERTED.ID INTO @InsertedID
	VALUES (@Name, @InternalAddress, @AddressType,
		@Port, @GroupID, @TypeID, @OwnerID, @IP1, @IP2, @IP3, @IP4,
		@SecondaryPort, @SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions)
		
	SELECT MAX(ID) FROM @InsertedID
END
GO


-- =============================================
-- Author:		D.Morozov
-- Create date: 21/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE AddDeviceInternal2
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
	@Domain NCHAR(30) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @InsertedID TABLE (ID BIGINT)
	
	INSERT INTO TableDevice (Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID, IP1, IP2, IP3, IP4,
		SecondaryPort, SecondaryIP1, SecondaryIP2, SecondaryIP3, SecondaryIP4, DataOwnerID, LocationAddressID, SaveSessions, Domain)
	OUTPUT INSERTED.ID INTO @InsertedID
	VALUES (@Name, @InternalAddress, @AddressType,
		@Port, @GroupID, @TypeID, @OwnerID, @IP1, @IP2, @IP3, @IP4,
		@SecondaryPort, @SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions, @Domain)
		
	SELECT MAX(ID) FROM @InsertedID
END
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 03/08/2011
-- Description:	The procedure adds new device to device group.
-- =============================================
CREATE PROCEDURE AddDevice 
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
	@SaveSessions BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableDevice
	WHERE Name = @Name AND InternalAddress = @InternalAddress AND 
		AddressType = @AddressType AND Port = @Port AND 
		GroupID = @GroupID AND TypeID = @TypeID AND OwnerID = @OwnerID AND 
		IP1 = @IP1 AND IP2 = @IP2 AND IP3 = @IP3 AND IP4 = @IP4 AND
		SecondaryPort = @SecondaryPort AND SecondaryIP1 = @SecondaryIP1 AND 
		SecondaryIP2 = @SecondaryIP2 AND SecondaryIP3 = @SecondaryIP3 AND SecondaryIP4 = @SecondaryIP4 AND
		DataOwnerID = @DataOwnerID AND LocationAddressID = @LocationAddressID AND SaveSessions = @SaveSessions 

	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableDevice
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			EXEC AddDeviceInternal @Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID,
				@OwnerID, @IP1, @IP2, @IP3,	@IP4, @SecondaryPort, @SecondaryIP1, @SecondaryIP2,	@SecondaryIP3, @SecondaryIP4, 
				@DataOwnerID, @LocationAddressID, @SaveSessions
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
