ALTER VIEW ViewCOSEMAttributeValue
AS
SELECT *
FROM
	(SELECT		l.COSEMClassID AS COSEMClassID, l.AttributeID AS AttributeID, l.Dynamic AS Dynamic, RTRIM(l.Name) AS Name, l.DataTypeID AS DataTypeID, 
                      l.COSEMObjectID AS COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, r.MeasurementTime AS MeasurementTime, 
                      r.AcquisitionTime AS AcquisitionTime, r.Value AS Value, RTRIM(r.Units) AS Units, r.DeviceID AS DeviceID, r.QualityBad AS QualityBad, 
                      l.COSEMLogicalDeviceID AS COSEMLogicalDeviceID, l.Standard AS Standard, r.DataOwnerID AS DataOwnerID, RTRIM(l.Identifier) AS Identifier, 
                      r.ValueIdentifier AS ValueIdentifier
	FROM		dbo.ViewCOSEMAttributeDataType AS l JOIN
				dbo.ViewCurrentState AS r ON l.DataTypeID = r.DataTypeID
                      )  AS l
UNION
SELECT * FROM 
	(SELECT		l.COSEMClassID AS COSEMClassID, l.AttributeID AS AttributeID, l.Dynamic AS Dynamic, RTRIM(l.Name) AS Name, l.DataTypeID AS DataTypeID, 
                      l.COSEMObjectID AS COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, r.MeasurementTime AS MeasurementTime, 
                      r.AcquisitionTime AS AcquisitionTime, r.Value AS Value, RTRIM(r.Units) AS Units, r.DeviceID AS DeviceID, r.QualityBad AS QualityBad, 
                      l.COSEMLogicalDeviceID AS COSEMLogicalDeviceID, l.Standard AS Standard, l.DataOwnerID AS DataOwnerID, RTRIM(l.Identifier) AS Identifier, 
                      r.ValueIdentifier AS ValueIdentifier
	FROM		dbo.ViewCOSEMAttributeDataType AS l LEFT OUTER JOIN 
				dbo.ViewCurrentState AS r ON l.DataTypeID = r.DataTypeID
                      WHERE ValueIdentifier IS NULL
                      ) AS r
GO
