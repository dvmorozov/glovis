ALTER VIEW ViewSession
AS
SELECT     ID, DeviceID, StartTime, EndTime, RTRIM(SessionType) AS SessionType, ResultID, RTRIM(Parameters) AS Parameters, RTRIM(DeviceIdent) AS DeviceIdent, 
                      Secondary, DataOwnerID, Data
FROM         dbo.TableSession
GO
