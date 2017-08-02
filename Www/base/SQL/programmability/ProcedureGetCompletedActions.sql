
DROP PROCEDURE GetCompletedActions
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetCompletedActions 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM TableSchedule AS ts JOIN
		ViewDeviceScheduleParams AS v
		ON v.ID = ts.DeviceID
	WHERE Completed = 1
END
GO
