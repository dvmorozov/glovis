ALTER VIEW ViewCOSEMDataType
AS
SELECT     dbo.TableCOSEMDataType.ID, RTRIM(dbo.TableCOSEMDataType.Name) AS Name, dbo.TableCOSEMDataType.AncestorTypeID, 
                      dbo.TableCOSEMDataType.ItemBitSize, dbo.TableCOSEMDataType.ItemCount, dbo.TableCOSEMDataType.DataOwnerID, RTRIM(t.Name) AS AncestorTypeName, 
                      dbo.TableCOSEMDataType.Standard
FROM         dbo.TableCOSEMDataType LEFT OUTER JOIN
                      dbo.TableCOSEMDataType AS t ON t.ID = dbo.TableCOSEMDataType.AncestorTypeID
GO
