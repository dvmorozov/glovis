ALTER VIEW ViewDataType
AS
SELECT     dbo.TableDataType.ID, dbo.TableDataType.COSEMAttributeID, dbo.TableDataType.COSEMObjectID, dbo.TableDataType.DataOwnerID, 
                      RTRIM(dbo.TableDataType.Identifier) AS Identifier, dbo.TableCOSEMAttribute.Standard
FROM         dbo.TableDataType INNER JOIN
                      dbo.TableCOSEMAttribute ON dbo.TableDataType.COSEMAttributeID = dbo.TableCOSEMAttribute.ID
GO
