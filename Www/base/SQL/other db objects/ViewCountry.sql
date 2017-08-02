ALTER VIEW ViewCountry
AS
SELECT     ID, RTRIM(Country) AS Country, RTRIM(PhoneCode) AS PhoneCode, DataOwnerID
FROM         dbo.TableCountry
GO
