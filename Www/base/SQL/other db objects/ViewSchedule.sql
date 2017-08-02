ALTER VIEW ViewSchedule
AS
SELECT     ID, DeviceID, NextActionTime, LastExecTime, ExecPID, RTRIM(ExecStationIP) AS ExecStationIP, DataOwnerID
FROM         dbo.TableSchedule
GO
