
DROP FUNCTION GetScheduledDevices
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/06/11
-- Description:	The function selects devices for action.
-- =============================================
CREATE FUNCTION GetScheduledDevices ()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM TableSchedule
	WHERE NextActionTime <= SYSDATETIME() and 
	-- Выбираются устройства, с которыми еще не было сеансов работы,
	-- или длительность последнего сеанса работы превышает таймаут.
		((LastExecTime is null) or DATEDIFF(s, LastExecTime, SYSDATETIME()) > 10)
)
GO
