ALTER VIEW ViewEventCategory
AS
SELECT     ID, RTRIM(Description) AS Description, DataOwnerID
FROM         dbo.TableEventCategory
GO
