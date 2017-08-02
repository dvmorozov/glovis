ALTER VIEW ViewCity
AS
SELECT     dbo.TableCity.ID, RTRIM(dbo.TableCity.City) AS City, dbo.TableCity.StateID, RTRIM(dbo.TableCity.PhoneCode) AS PhoneCode, dbo.TableCity.DataOwnerID, 
                      dbo.TableState.CountryID
FROM         dbo.TableCity INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID
GO
