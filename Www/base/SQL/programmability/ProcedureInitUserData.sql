
DROP PROCEDURE InitUserData
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Morozov D.V.
-- Create date: 24/05/2013
-- Description:	The procedure creates default user data.
-- Returns: Data set with the identifier of created group.
-- =============================================
CREATE PROCEDURE InitUserData 
	@UserID UNIQUEIDENTIFIER, @DeviceTypeID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddGroup 'Common',	--@Name NCHAR(100)
		'',					--@DeviceNamePrefix NCHAR(10),
		'0',				--@StartingIP1 NCHAR(3),
		'0',				--@StartingIP2 NCHAR(3),
		'0',				--@StartingIP3 NCHAR(3),
		'0',				--@StartingIP4 NCHAR(3),
		'0',				--@EndingIP1 NCHAR(3),
		'0',				--@EndingIP2 NCHAR(3),
		'0',				--@EndingIP3 NCHAR(3),
		'0',				--@EndingIP4 NCHAR(3),
		'0',				--@SecondaryStartingIP1 NCHAR(3),
		'0',				--@SecondaryStartingIP2 NCHAR(3),
		'0',				--@SecondaryStartingIP3 NCHAR(3),
		'0',				--@SecondaryStartingIP4 NCHAR(3),
		'0',				--@StartingIPPort CHAR(5),
		'0',				--@EndingIPPort CHAR(5),
		'0',				--@SecondaryStartingIPPort CHAR(5),
	@DeviceTypeID,
	@UserID					--@DataOwnerID UNIQUEIDENTIFIER
END
GO
