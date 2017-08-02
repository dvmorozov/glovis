ALTER VIEW ViewElementGroup
AS
SELECT     dbo.ViewGroup.ID, dbo.ViewGroup.Name, dbo.ViewGroup.DeviceType, dbo.ViewGroup.DataOwnerID, dbo.TableCurrentState.DeviceID
FROM         dbo.ViewGroup INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.GroupID = dbo.ViewGroup.ID AND dbo.TableDevice.DataOwnerID = dbo.ViewGroup.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID
GO
