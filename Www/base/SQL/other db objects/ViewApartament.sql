ALTER VIEW ViewApartament
AS
ASSELECT     dbo.TableApartament.ID, RTRIM(dbo.TableApartament.Apartament) AS Apartament, dbo.TableApartament.BuildingID, dbo.TableApartament.DataOwnerID, 
                      dbo.TableBuilding.StreetID, dbo.TableStreet.CityID, dbo.TableCity.StateID, dbo.TableState.CountryID
FROM         dbo.TableApartament INNER JOIN
                      dbo.TableBuilding ON dbo.TableApartament.BuildingID = dbo.TableBuilding.ID INNER JOIN
                      dbo.TableStreet ON dbo.TableBuilding.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID
GO
