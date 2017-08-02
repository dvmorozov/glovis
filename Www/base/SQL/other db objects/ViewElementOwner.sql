ALTER VIEW ViewElementOwner
AS
SELECT     dbo.ViewDeviceOwner.ID, dbo.ViewDeviceOwner.FirstName, dbo.ViewDeviceOwner.LastName, dbo.ViewDeviceOwner.Apartament, 
                      dbo.ViewDeviceOwner.Building, dbo.ViewDeviceOwner.Street, dbo.ViewDeviceOwner.City, dbo.ViewDeviceOwner.DataOwnerID, 
                      RTRIM(dbo.ViewDeviceOwner.FirstName) + ' ' + RTRIM(dbo.ViewDeviceOwner.LastName) + ', ' + RTRIM(dbo.ViewDeviceOwner.Apartament) 
                      + ' ' + RTRIM(dbo.ViewDeviceOwner.Building) + ', ' + RTRIM(dbo.ViewDeviceOwner.Street) + ', ' + RTRIM(dbo.ViewDeviceOwner.City) AS OwnerData, 
                      dbo.TableCurrentState.DeviceID
FROM         dbo.ViewDeviceOwner INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.OwnerID = dbo.ViewDeviceOwner.ID AND 
                      dbo.TableDevice.DataOwnerID = dbo.ViewDeviceOwner.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID
GO
