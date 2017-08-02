ALTER VIEW ViewElementFiltered
AS
SELECT     dbo.ViewElementInstanceName.ID, dbo.ViewElementInstanceName.FullName, dbo.ViewChartsDataTypes.ChartID, 
                      dbo.ViewElementInstanceName.GroupName, dbo.ViewElementInstanceName.DeviceName, dbo.ViewElementInstanceName.LogicalDevice, 
                      dbo.ViewElementInstanceName.LogicalObject, dbo.ViewElementInstanceName.Attribute, dbo.ViewElementInstanceName.Identifier, 
                      dbo.ViewElementInstanceName.Standard, dbo.ViewElementInstanceName.ValueIdentifier, dbo.ViewElementInstanceName.GroupID, 
                      dbo.ViewElementInstanceName.DeviceID, dbo.ViewElementInstanceName.DataOwnerID, dbo.ViewElementInstanceName.LogicalDeviceID, 
                      dbo.ViewElementInstanceName.ObjectID, dbo.ViewElementInstanceName.AttributeID
FROM         dbo.ViewElementInstanceName LEFT OUTER JOIN
                      dbo.ViewChartsDataTypes ON dbo.ViewChartsDataTypes.ElementID = dbo.ViewElementInstanceName.ID
GO
