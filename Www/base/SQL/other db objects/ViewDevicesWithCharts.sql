SELECT * FROM
(
SELECT        vein.DeviceID, vein.DeviceName, vein.GroupName, vein.DeviceDescription, vein.AcquisitionDisabled,
                     vein.ValueIdentifier, vein.OperationInProgress, vein.FinishedSuccessfully, vd.URL, vd.Name, vd.Port, vein.DataOwnerID, vein.ID AS ElementID,
                         ROW_NUMBER() OVER (PARTITION BY vein.DeviceID ORDER BY tcdt.ChartID) AS RowNumber
FROM            dbo.ViewElementInstanceName AS vein INNER JOIN
                         dbo.TableChartsDataTypes AS tcdt ON vein.ID = tcdt.ElementID INNER JOIN
                         dbo.ViewDevice AS vd ON vein.DeviceID = vd.ID
) T
WHERE RowNumber = 1