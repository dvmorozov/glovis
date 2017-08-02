
DROP PROCEDURE GetUnscheduledDevices 
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
CREATE PROCEDURE GetUnscheduledDevices 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewDeviceScheduleParams
	WHERE ID NOT IN (SELECT DeviceID FROM TableSchedule)
	ORDER BY GroupID
END
GO
