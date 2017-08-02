update [Glovis.Www.Dev].[dbo].[TableCurrentState]
set AcquisitionDisabled = 1

delete FROM [Glovis.Www.Dev].[dbo].[TableCurrentStateOperation];

delete FROM [Glovis.Www.Dev].[dbo].[TableDataPoint];

delete FROM [Glovis.Www.Dev].[dbo].[TableAppLog];

delete FROM [AppStarterBase].[dbo].[TableMonitoringLog];

delete FROM [AppStarterBase].[dbo].[TableTask];

delete FROM [InstanceStarterBase].[dbo].[TableTask];

delete FROM [InstanceStarterBase].[dbo].[TableInstance];

delete FROM [ProcessLogBase].[dbo].[MessageSet];

delete FROM [ProcessLogBase].[dbo].[ProcessSet];

delete FROM [ProcessLogBase].[dbo].[ExecutableSet];
