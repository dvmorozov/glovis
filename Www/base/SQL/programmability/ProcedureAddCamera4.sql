
DROP PROCEDURE AddCamera4
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 20/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE AddCamera4
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
	@ChartType NCHAR(10),
	@Domain NCHAR(20) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddCamera5
		@Name = @Name,
		@InternalAddress = @InternalAddress,
		@AddressType = @AddressType,
		@Port = @Port,
		@GroupID = @GroupID,
		@TypeID = @TypeID,
		@OwnerID = @OwnerID,
		@IP1 = @IP1,
		@IP2 = @IP2,
		@IP3 = @IP3,
		@IP4 = @IP4,
		@SecondaryPort = @SecondaryPort,
		@SecondaryIP1 = @SecondaryIP1,
		@SecondaryIP2 = @SecondaryIP2,
		@SecondaryIP3 = @SecondaryIP3,
		@SecondaryIP4 = @SecondaryIP4, 
		@DataOwnerID = @DataOwnerID,
		@LocationAddressID = @LocationAddressID,
		@SaveSessions = @SaveSessions,
		@ChartName = @ChartName,
		@Width = @Width,
		@Height = @Height, 
		@DataSetType = @DataSetType,
		@DataSetMaxCount = @DataSetMaxCount,
		@ChartType = @ChartType,
		@AttributeName = 'URL',
		@Domain = @Domain
END
GO
