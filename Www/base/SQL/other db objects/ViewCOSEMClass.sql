ALTER VIEW ViewCOSEMClass
AS
SELECT     ID, RTRIM(ClassName) AS ClassName, CardinalityMin, CardinalityMax, COSEMClassID, RTRIM(Version) AS Version, DataOwnerID, Standard
FROM         dbo.TableCOSEMClass
GO
