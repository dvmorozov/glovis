
DROP PROCEDURE GetScheduledDevicesAndUpdateExecTime
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D,Morozov
-- Create date: 12/06/11
-- Description:	The function selects devices for action and updates LastExecTime
-- =============================================
CREATE PROCEDURE GetScheduledDevicesAndUpdateExecTime
AS
BEGIN
	DECLARE @t TABLE (ID BIGINT NOT NULL, DeviceID BIGINT NOT NULL, NextActionTime DATETIME2 NOT NULL, ExecPID BIGINT,
					InternalAddress CHAR(10), AddressType CHAR(5), Port CHAR(5), IP1 CHAR(3), IP2 CHAR(3), IP3 CHAR(3), IP4 CHAR(3))
	-- »звлечение данных по значени€м прежних меток времени
	INSERT INTO @t
		SELECT g.ID, DeviceID, NextActionTime, ExecPID, InternalAddress, AddressType, Port, IP1, IP2, IP3, IP4 
		FROM GetScheduledDevices() AS g JOIN TableDevice AS td ON g.DeviceID = td.ID
	-- ќбновление меток времени
	UPDATE TableSchedule
		SET LastExecTime = SYSDATETIME()
		WHERE ID IN (SELECT ID FROM @t)
	-- ¬озврат списка устройств, полученного на первом шаге
	SELECT * FROM @t
END
GO
