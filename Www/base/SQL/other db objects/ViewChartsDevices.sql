ALTER VIEW ViewChartsDevices
AS
SELECT     tcdt.ChartID, vein.DeviceID, tcdt.DataOwnerID, vein.DeviceName, vein.GroupName, vein.DeviceDescription, vein.AcquisitionDisabled, tcdt.ElementID, 
                      vein.ValueIdentifier, vein.OperationInProgress, vein.FinishedSuccessfully, vd.URL, vd.Name, vd.Port
FROM         dbo.ViewElementInstanceName AS vein INNER JOIN
                      dbo.TableChartsDataTypes AS tcdt ON vein.ID = tcdt.ElementID INNER JOIN
                      dbo.ViewDevice AS vd ON vein.DeviceID = vd.ID
GO
