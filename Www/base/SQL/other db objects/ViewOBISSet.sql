ALTER VIEW ViewOBISSet
AS
SELECT     dbo.TableOBISSet.ID, dbo.TableOBISSet.AID, dbo.TableOBISSet.BID, dbo.TableOBISSet.CID, dbo.TableOBISSet.DID, dbo.TableOBISSet.EID, dbo.TableOBISSet.FID, 
                      dbo.TableOBISSet.DeviceTypeID, dbo.TableOBISSet.DataOwnerID, g1.Value AS AValue, g2.Value AS BValue, g3.Value AS CValue, g4.Value AS DValue, 
                      g5.Value AS EValue, g6.Value AS FValue, RTRIM(tdt.Description) AS DeviceTypeName, dbo.TableOBISSet.Standard
FROM         dbo.TableOBISSet INNER JOIN
                      dbo.TableOBISGroup AS g1 ON g1.ID = dbo.TableOBISSet.AID INNER JOIN
                      dbo.TableOBISGroup AS g2 ON g2.ID = dbo.TableOBISSet.BID INNER JOIN
                      dbo.TableOBISGroup AS g3 ON g3.ID = dbo.TableOBISSet.CID INNER JOIN
                      dbo.TableOBISGroup AS g4 ON g4.ID = dbo.TableOBISSet.DID INNER JOIN
                      dbo.TableOBISGroup AS g5 ON g5.ID = dbo.TableOBISSet.EID INNER JOIN
                      dbo.TableOBISGroup AS g6 ON g6.ID = dbo.TableOBISSet.FID INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = dbo.TableOBISSet.DeviceTypeID
GO
