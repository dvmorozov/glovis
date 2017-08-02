declare @dt datetime2
select @dt = SYSDATETIME()

insert into TableShedule (DeviceID, NextActionTime) values (30, @dt)
insert into TableShedule (DeviceID, NextActionTime) values (31, @dt)
insert into TableShedule (DeviceID, NextActionTime) values (32, @dt)
insert into TableShedule (DeviceID, NextActionTime) values (33, @dt)
insert into TableShedule (DeviceID, NextActionTime) values (34, @dt)


