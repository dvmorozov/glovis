ALTER VIEW ViewStreet
AS
SELECT     dbo.TableStreet.ID, RTRIM(dbo.TableStreet.Street) AS Street, dbo.TableStreet.CityID, dbo.TableStreet.DataOwnerID, dbo.TableCity.StateID, 
                      dbo.TableState.CountryID
FROM         dbo.TableStreet INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID
GO
