ALTER VIEW ViewCOSEMComplexTypeField
AS
SELECT     dbo.TableCOSEMComplexTypeField.ID, RTRIM(dbo.TableCOSEMComplexTypeField.Name) AS Name, dbo.TableCOSEMComplexTypeField.AggregateTypeID, 
                      dbo.TableCOSEMComplexTypeField.TypeID, dbo.TableCOSEMComplexTypeField.DataOwnerID, RTRIM(t1.Name) AS TypeName, RTRIM(t2.Name) 
                      AS AggregateTypeName, dbo.TableCOSEMComplexTypeField.Standard
FROM         dbo.TableCOSEMComplexTypeField INNER JOIN
                      dbo.TableCOSEMDataType AS t1 ON t1.ID = dbo.TableCOSEMComplexTypeField.TypeID INNER JOIN
                      dbo.TableCOSEMDataType AS t2 ON t2.ID = dbo.TableCOSEMComplexTypeField.AggregateTypeID
GO
