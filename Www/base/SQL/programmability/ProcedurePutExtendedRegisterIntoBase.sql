
DROP PROCEDURE PutExtendedRegisterIntoBase
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 05/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE PutExtendedRegisterIntoBase
	@ValueIdentifier NVARCHAR(MAX),
	@Units NCHAR(36),
	@IntValue INT,
	@StringValue VARCHAR(MAX),
	@IntStatus INT,
	@Year INT,
	@Month INT,
	@DayOfMonth INT,
	@DayOfWeek NVARCHAR(MAX),
	@Hour INT,
	@Minute INT,
	@Second INT,
	@HundredthsOfSecond INT
AS
BEGIN
	EXEC PutExtendedRegisterIntoBase2
		@ValueIdentifier = @ValueIdentifier,
		@Units = @Units,
		@IntValue = @IntValue,
		@StringValue = @StringValue,
		@IntStatus = @IntStatus,
		@Year = @Year,
		@Month = @Month,
		@DayOfMonth = @DayOfMonth,
		@DayOfWeek = @DayOfWeek,
		@Hour = @Hour,
		@Minute = @Minute,
		@Second = @Second,
		@HundredthsOfSecond = @HundredthsOfSecond
END		
		
		
	
