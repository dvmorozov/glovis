ALTER VIEW ViewBuilding
AS
SELECT     dbo.TableBuilding.ID, RTRIM(dbo.TableBuilding.Building) AS Building, dbo.TableBuilding.StreetID, dbo.TableBuilding.DataOwnerID, dbo.TableStreet.CityID, 
                      dbo.TableCity.StateID, dbo.TableState.CountryID
FROM         dbo.TableBuilding INNER JOIN
                      dbo.TableStreet ON dbo.TableBuilding.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID
GO
