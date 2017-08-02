ALTER VIEW ViewGroup
AS
SELECT     dbo.TableGroup.ID, RTRIM(dbo.TableGroup.Name) AS Name, RTRIM(dbo.TableGroup.DeviceNamePrefix) AS DeviceNamePrefix, 
                      RTRIM(dbo.TableGroup.StartingIP1) AS StartingIP1, RTRIM(dbo.TableGroup.StartingIP2) AS StartingIP2, RTRIM(dbo.TableGroup.StartingIP3) 
                      AS StartingIP3, RTRIM(dbo.TableGroup.StartingIP4) AS StartingIP4, RTRIM(dbo.TableGroup.EndingIP1) AS EndingIP1, 
                      RTRIM(dbo.TableGroup.EndingIP2) AS EndingIP2, RTRIM(dbo.TableGroup.EndingIP3) AS EndingIP3, RTRIM(dbo.TableGroup.EndingIP4) AS EndingIP4, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIP1) AS SecondaryStartingIP1, RTRIM(dbo.TableGroup.SecondaryStartingIP2) AS SecondaryStartingIP2, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIP3) AS SecondaryStartingIP3, RTRIM(dbo.TableGroup.SecondaryStartingIP4) AS SecondaryStartingIP4, 
                      RTRIM(dbo.TableGroup.StartingIPPort) AS StartingIPPort, RTRIM(dbo.TableGroup.EndingIPPort) AS EndingIPPort, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIPPort) AS SecondaryStartingIPPort, dbo.TableGroup.MinutesE, dbo.TableGroup.MinutesG, 
                      RTRIM(dbo.TableGroup.MinMode) AS MinMode, dbo.TableGroup.HoursE, dbo.TableGroup.HoursG, RTRIM(dbo.TableGroup.HourMode) AS HourMode, 
                      dbo.TableGroup.DaysE, dbo.TableGroup.DaysG, RTRIM(dbo.TableGroup.DayMode) AS DayMode, dbo.TableGroup.WeeksG, 
                      RTRIM(dbo.TableGroup.WeekMode) AS WeekMode, dbo.TableGroup.Monday, dbo.TableGroup.Tuesday, dbo.TableGroup.Wednesday, 
                      dbo.TableGroup.Thursday, dbo.TableGroup.Friday, dbo.TableGroup.Saturday, dbo.TableGroup.Sunday, dbo.TableGroup.DataOwnerID, 
                      RTRIM(dbo.TableGroup.StartingApartment) AS StartingApartment, RTRIM(dbo.TableGroup.EndingApartment) AS EndingApartment, 
                      RTRIM(dbo.TableGroup.StartingBuilding) AS StartingBuilding, RTRIM(dbo.TableGroup.EndingBuilding) AS EndingBuilding, 
                      RTRIM(dbo.TableGroup.Street) AS Street, RTRIM(dbo.TableGroup.City) AS City, RTRIM(dbo.TableGroup.State) AS State, RTRIM(dbo.TableGroup.Country) 
                      AS Country, RTRIM(dbo.TableGroup.ZipCode) AS ZipCode, RTRIM(td.Description) AS DeviceType, dbo.TableGroup.DeviceTypeID
FROM         dbo.TableGroup INNER JOIN
                      dbo.TableDeviceType AS td ON td.ID = dbo.TableGroup.DeviceTypeID
GO
