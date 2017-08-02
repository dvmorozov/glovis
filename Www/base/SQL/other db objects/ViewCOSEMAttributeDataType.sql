ALTER VIEW ViewCOSEMAttributeDataType
AS
SELECT     l.COSEMClassID, RTRIM(l.COSEMLogicalName) AS COSEMLogicalName, l.AttributeID, l.Dynamic, RTRIM(l.Name) AS Name, l.MinValue, l.MaxValue, l.DefValue, 
                      l.Standard, l.COSEMDataTypeID, r.ID AS DataTypeID, l.COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, l.COSEMLogicalDeviceID, 
                      l.DataOwnerID, RTRIM(r.Identifier) AS Identifier
FROM         (SELECT     object.ID AS COSEMObjectID, object.COSEMClassID, object.DeviceTypeID, object.COSEMLogicalDeviceID, object.COSEMLogicalName, 
                                              object.DataOwnerID, attribute.ID AS AttributeID, attribute.Dynamic, attribute.Name, attribute.COSEMDataTypeID, attribute.MinValue, attribute.MaxValue, 
                                              attribute.DefValue, attribute.Standard, datatype.Name AS COSEMDataTypeName
                       FROM          dbo.TableCOSEMObject AS object INNER JOIN
                                              dbo.TableCOSEMAttribute AS attribute ON attribute.COSEMClassID = object.COSEMClassID INNER JOIN
                                              dbo.TableCOSEMDataType AS datatype ON attribute.COSEMDataTypeID = datatype.ID) AS l LEFT OUTER JOIN
                          (SELECT     ID, Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID
                            FROM          dbo.TableDataType) AS r ON r.COSEMObjectID = l.COSEMObjectID AND l.AttributeID = r.COSEMAttributeID
GO
