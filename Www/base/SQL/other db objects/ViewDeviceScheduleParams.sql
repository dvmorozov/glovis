ALTER VIEW ViewDeviceScheduleParams
AS
SELECT     td.ID, RTRIM(tg.MinutesE) AS MinutesE, RTRIM(tg.MinutesG) AS MinutesG, RTRIM(tg.MinMode) AS MinMode, RTRIM(tg.HoursE) AS HoursE, RTRIM(tg.HoursG) 
                      AS HoursG, RTRIM(tg.HourMode) AS HourMode, RTRIM(tg.DaysE) AS DaysE, RTRIM(tg.DaysG) AS DaysG, RTRIM(tg.DayMode) AS DayMode, RTRIM(tg.WeeksG) 
                      AS WeeksG, RTRIM(tg.WeekMode) AS WeekMode, tg.Monday, tg.Tuesday, tg.Wednesday, tg.Thursday, tg.Friday, tg.Saturday, tg.Sunday, tg.ID AS GroupID
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableGroup AS tg ON td.GroupID = tg.ID
GO
