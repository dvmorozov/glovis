
DROP PROCEDURE UpdateDevice
GO

DROP PROCEDURE UpdateDevice2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2013
-- Description:	evernote:///view/14501366/s132/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/
-- =============================================
CREATE PROCEDURE UpdateDevice2
	@DeviceID BIGINT,
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
	@Domain NCHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--  Requires updated table TableDevice.
	UPDATE TableDevice 
	SET Name = @Name, InternalAddress = @InternalAddress, AddressType = @AddressType,
		Port = @Port, GroupID = @GroupID, TypeID = @TypeID, OwnerID = @OwnerID, IP1 = @IP1, IP2 = @IP2, IP3 = @IP3, IP4 = @IP4,
		SecondaryPort = @SecondaryPort, SecondaryIP1 = @SecondaryIP1, SecondaryIP2 = @SecondaryIP2, SecondaryIP3 = @SecondaryIP3, 
		SecondaryIP4 = @SecondaryIP4, Domain = @Domain
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateDevice 
	@DeviceID BIGINT,
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
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice 
	SET Name = @Name, InternalAddress = @InternalAddress, AddressType = @AddressType,
		Port = @Port, GroupID = @GroupID, TypeID = @TypeID, OwnerID = @OwnerID, IP1 = @IP1, IP2 = @IP2, IP3 = @IP3, IP4 = @IP4,
		SecondaryPort = @SecondaryPort, SecondaryIP1 = @SecondaryIP1, SecondaryIP2 = @SecondaryIP2, SecondaryIP3 = @SecondaryIP3, 
		SecondaryIP4 = @SecondaryIP4
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END
GO
