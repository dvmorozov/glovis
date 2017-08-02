ALTER VIEW ViewCOSEMMethod
AS
SELECT     dbo.TableCOSEMMethod.ID, dbo.TableCOSEMMethod.COSEMClassID, RTRIM(dbo.TableCOSEMMethod.Name) AS Name, dbo.TableCOSEMMethod.Mandatory, 
                      dbo.TableCOSEMMethod.DataOwnerID, RTRIM(t.ClassName) AS COSEMClassName, dbo.TableCOSEMMethod.Standard
FROM         dbo.TableCOSEMMethod INNER JOIN
                      dbo.TableCOSEMClass AS t ON t.ID = dbo.TableCOSEMMethod.COSEMClassID
GO
