ALTER VIEW ViewElementLocation
AS
SELECT     dbo.TableDevice.LocationAddressID, dbo.ViewAddress.Apartament, dbo.ViewAddress.Building, dbo.ViewAddress.Street, dbo.ViewAddress.City, 
                      RTRIM(dbo.ViewAddress.Apartament) + ' ' + RTRIM(dbo.ViewAddress.Building) + ', ' + RTRIM(dbo.ViewAddress.Street) 
                      + ', ' + RTRIM(dbo.ViewAddress.City) AS Location, dbo.ViewAddress.DataOwnerID, dbo.TableCurrentState.DeviceID
FROM         dbo.ViewAddress INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.LocationAddressID = dbo.ViewAddress.ID AND 
                      dbo.TableDevice.DataOwnerID = dbo.ViewAddress.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID
GO
