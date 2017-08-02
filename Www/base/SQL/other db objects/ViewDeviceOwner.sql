ALTER VIEW ViewDeviceOwner
AS
SELECT     dbo.TableDeviceOwner.ID, RTRIM(dbo.TableDeviceOwner.FirstName) AS FirstName, RTRIM(dbo.TableDeviceOwner.LastName) AS LastName, 
                      RTRIM(dbo.TableDeviceOwner.Company) AS Company, RTRIM(dbo.TableDeviceOwner.EMail) AS EMail, RTRIM(dbo.TableDeviceOwner.Phone) AS Phone, 
                      RTRIM(dbo.TableDeviceOwner.Cell) AS Cell, dbo.TableDeviceOwner.DataOwnerID, RTRIM(dbo.ViewAddress.Apartament) AS Apartament, 
                      RTRIM(dbo.ViewAddress.Building) AS Building, RTRIM(dbo.ViewAddress.Street) AS Street, RTRIM(dbo.ViewAddress.City) AS City, RTRIM(dbo.ViewAddress.State) 
                      AS State, RTRIM(dbo.ViewAddress.Country) AS Country, RTRIM(dbo.ViewAddress.ZipCode) AS ZipCode
FROM         dbo.TableDeviceOwner INNER JOIN
                      dbo.ViewAddress ON dbo.TableDeviceOwner.AddressID = dbo.ViewAddress.ID
GO
