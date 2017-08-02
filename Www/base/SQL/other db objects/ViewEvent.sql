ALTER VIEW ViewEvent
AS
SELECT     ID, Time, RTRIM(Event) AS Event, CategoryID, DeviceID, SessionID, DataOwnerID
FROM         dbo.TableEvent
GO
