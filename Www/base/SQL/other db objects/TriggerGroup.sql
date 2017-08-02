
DROP TRIGGER TriggerGroup
GO

CREATE TRIGGER TriggerGroup
	ON TableGroup
	FOR INSERT, UPDATE, DELETE
AS
	DECLARE @InsertedCount INT
	DECLARE @DeletedCount INT
	SET @InsertedCount = (SELECT COUNT(*) FROM INSERTED)
	SET @DeletedCount = (SELECT COUNT(*) FROM DELETED)
	IF (@InsertedCount > 0) BEGIN
		INSERT INTO TableGroupLog 
			(Action, Timestamp, GroupID, ActorID,
			DeviceNamePrefix, 
			StartingIP1, StartingIP2, StartingIP3, StartingIP4, 
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4, 
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			MinutesE, MinutesG, MinMode,
			HoursE, HoursG, HourMode,
			DaysE, DaysG, DayMode,
			WeeksG, WeekMode, Monday, Tuesday, Wednesday,
			Thursday, Friday, Saturday, Sunday
			)
		SELECT CASE 
			WHEN (@DeletedCount > 0) THEN 'Update'
			ELSE 'Insert'
			END,
			CURRENT_TIMESTAMP,
			ID, CURRENT_USER, DeviceNamePrefix,
			StartingIP1, StartingIP2, StartingIP3, StartingIP4, 
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4, 
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			MinutesE, MinutesG, MinMode,
			HoursE, HoursG, HourMode,
			DaysE, DaysG, DayMode,
			WeeksG, WeekMode, Monday, Tuesday, Wednesday,
			Thursday, Friday, Saturday, Sunday
		FROM INSERTED
	END
	ELSE IF (@DeletedCount > 0) BEGIN
		INSERT INTO TableGroupLog
			(Action, Timestamp, GroupID, ActorID, DeviceNamePrefix, 
			StartingIP1, StartingIP2, StartingIP3, StartingIP4, 
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4, 
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			MinutesE, MinutesG, MinMode,
			HoursE, HoursG, HourMode,
			DaysE, DaysG, DayMode,
			WeeksG, WeekMode, Monday, Tuesday, Wednesday,
			Thursday, Friday, Saturday, Sunday
			)
		SELECT 'Delete',
			CURRENT_TIMESTAMP,
			ID, CURRENT_USER, DeviceNamePrefix,
			StartingIP1, StartingIP2, StartingIP3, StartingIP4, 
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4, 
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			MinutesE, MinutesG, MinMode,
			HoursE, HoursG, HourMode,
			DaysE, DaysG, DayMode,
			WeeksG, WeekMode, Monday, Tuesday, Wednesday,
			Thursday, Friday, Saturday, Sunday
		FROM DELETED
	END
			