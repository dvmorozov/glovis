
DROP VIEW ViewDeviceType
GO

CREATE VIEW ViewDeviceType
AS
SELECT     ID, RTRIM(Description) AS Description, DataOwnerID, Standard
FROM         dbo.TableDeviceType
GO
