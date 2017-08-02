
DROP PROCEDURE UpdateNextActionTime 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/09/2011
-- Description:	The procedure updates NextActionTime in TableSchedule.
-- The procedure adds new record when necessary to protect from
-- record duplication.
-- =============================================
CREATE PROCEDURE UpdateNextActionTime 
	@ScheduleID BIGINT, -- Schedule item identifier.
	@NextActionTime DATETIME2(7),
	@DeviceID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT = 0
	SELECT @Count = COUNT(*)
	FROM TableSchedule
	WHERE ID = @ScheduleID

	IF @Count <> 0
	BEGIN
		UPDATE TableSchedule
		SET NextActionTime = @NextActionTime
		WHERE ID = @ScheduleID AND DeviceID = @DeviceID
	END
	ELSE
	BEGIN
		INSERT INTO TableSchedule (NextActionTime, DeviceID)
		VALUES (@NextActionTime, @DeviceID)
	END
END
GO
