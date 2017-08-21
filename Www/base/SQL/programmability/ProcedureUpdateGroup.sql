
DROP PROCEDURE UpdateGroup
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 11/05/2012
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateGroup
	@ID BIGINT,
	@MinutesE TINYINT, 
	@MinutesG TINYINT, 
	@MinMode CHAR(5), 
	@HoursE TINYINT, 
	@HoursG TINYINT, 
	@HourMode CHAR(5), 
	@DaysE TINYINT, 
	@DaysG TINYINT, 
	@DayMode CHAR(5), 
	@WeeksG TINYINT, 
	@WeekMode CHAR(5), 
	@Monday BIT, 
	@Tuesday BIT, 
	@Wednesday BIT, 
	@Thursday BIT, 
	@Friday BIT, 
	@Saturday BIT, 
	@Sunday BIT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableGroup
	SET MinutesE = @MinutesE, MinutesG = @MinutesG, MinMode = @MinMode, 
		HoursE = @HoursE, HoursG = @HoursG, HourMode = @HourMode,
		DaysE = @DaysE, DaysG = @DaysG, DayMode = @DayMode, 
		WeeksG = @WeeksG, WeekMode = @WeekMode, Monday = @Monday, 
		Tuesday = @Tuesday, Wednesday = @Wednesday, @Thursday = @Thursday, 
		Friday = @Friday, Saturday = @Saturday, Sunday = @Sunday,
		Name = @Name
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO