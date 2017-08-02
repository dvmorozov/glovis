ALTER VIEW ViewCOSEMAttribute
AS
SELECT     dbo.TableCOSEMAttribute.ID, dbo.TableCOSEMAttribute.COSEMClassID, dbo.TableCOSEMAttribute.Dynamic, RTRIM(dbo.TableCOSEMAttribute.Name) AS Name, 
                      dbo.TableCOSEMAttribute.COSEMDataTypeID, dbo.TableCOSEMAttribute.MinValue, dbo.TableCOSEMAttribute.MaxValue, dbo.TableCOSEMAttribute.DefValue, 
                      dbo.TableCOSEMAttribute.DataOwnerID, RTRIM(cl.ClassName) AS COSEMClassName, RTRIM(dt.Name) AS COSEMDataTypeName, 
                      dbo.TableCOSEMAttribute.Standard
FROM         dbo.TableCOSEMAttribute INNER JOIN
                      dbo.TableCOSEMClass AS cl ON cl.ID = dbo.TableCOSEMAttribute.COSEMClassID INNER JOIN
                      dbo.TableCOSEMDataType AS dt ON dt.ID = dbo.TableCOSEMAttribute.COSEMDataTypeID
GO
