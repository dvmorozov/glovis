
DROP PROCEDURE AddGroup
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 02/08/2011
-- Description:	The procedure adds new device group.
-- =============================================
CREATE PROCEDURE AddGroup
	@Name NCHAR(100), 
	@DeviceNamePrefix NCHAR(10),
	@StartingIP1 NCHAR(3),
	@StartingIP2 NCHAR(3),
	@StartingIP3 NCHAR(3),
	@StartingIP4 NCHAR(3),
	@EndingIP1 NCHAR(3),
	@EndingIP2 NCHAR(3),
	@EndingIP3 NCHAR(3),
	@EndingIP4 NCHAR(3),
	@SecondaryStartingIP1 NCHAR(3),
	@SecondaryStartingIP2 NCHAR(3),
	@SecondaryStartingIP3 NCHAR(3),
	@SecondaryStartingIP4 NCHAR(3),
	@StartingIPPort CHAR(5),
	@EndingIPPort CHAR(5),
	@SecondaryStartingIPPort CHAR(5),
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER --,
	--@GroupID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableGroup WHERE DataOwnerID = @DataOwnerID
	
	IF @Count < 10
	BEGIN
		DECLARE @InsertedID TABLE (ID BIGINT)

		INSERT INTO TableGroup(Name, DeviceNamePrefix, 
			StartingIP1, StartingIP2, StartingIP3, StartingIP4,
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4,
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			DeviceTypeID, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, DataOwnerID)
		OUTPUT INSERTED.ID INTO @InsertedID
		VALUES (@Name, @DeviceNamePrefix, 
			@StartingIP1, @StartingIP2, @StartingIP3, @StartingIP4,
			@EndingIP1, @EndingIP2, @EndingIP3, @EndingIP4,
			@SecondaryStartingIP1, @SecondaryStartingIP2, @SecondaryStartingIP3, @SecondaryStartingIP4,
			@StartingIPPort, @EndingIPPort, @SecondaryStartingIPPort,
			@DeviceTypeID, 0, 0, 0, 0, 0, 0, 0, @DataOwnerID)
			
		--SELECT @GroupID = ID FROM @InsertedID
		SELECT MAX(ID) FROM @InsertedID
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
