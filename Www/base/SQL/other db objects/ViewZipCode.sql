ALTER VIEW ViewZipCode
AS
SELECT     ID, RTRIM(ZipCode) AS ZipCode, CountryID, DataOwnerID
FROM         dbo.TableZipCode
GO
