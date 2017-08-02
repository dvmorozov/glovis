ALTER VIEW ViewAddress
AS
SELECT     dbo.TableAddress.ID, dbo.TableAddress.DataOwnerID, RTRIM(dbo.TableApartament.Apartament) AS Apartament, RTRIM(dbo.TableBuilding.Building) AS Building, 
                      RTRIM(dbo.TableStreet.Street) AS Street, RTRIM(dbo.TableCity.City) AS City, RTRIM(dbo.TableState.State) AS State, RTRIM(dbo.TableCountry.Country) AS Country, 
                      RTRIM(dbo.TableZipCode.ZipCode) AS ZipCode, dbo.TableAddress.ApartamentID, dbo.TableAddress.BuildingID, dbo.TableAddress.StreetID, dbo.TableAddress.CityID, 
                      dbo.TableAddress.StateID, dbo.TableAddress.CountryID, dbo.TableAddress.ZipCodeID
FROM         dbo.TableAddress INNER JOIN
                      dbo.TableApartament ON dbo.TableAddress.ApartamentID = dbo.TableApartament.ID INNER JOIN
                      dbo.TableBuilding ON dbo.TableAddress.BuildingID = dbo.TableBuilding.ID INNER JOIN
                      dbo.TableCity ON dbo.TableAddress.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableCountry ON dbo.TableAddress.CountryID = dbo.TableCountry.ID INNER JOIN
                      dbo.TableState ON dbo.TableAddress.StateID = dbo.TableState.ID INNER JOIN
                      dbo.TableStreet ON dbo.TableAddress.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableZipCode ON dbo.TableAddress.ZipCodeID = dbo.TableZipCode.ID
GO