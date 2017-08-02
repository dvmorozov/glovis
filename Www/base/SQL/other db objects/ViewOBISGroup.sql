ALTER VIEW ViewOBISGroup
AS
SELECT     ID, RTRIM(Type) AS Type, Value, RTRIM(Description) AS Description, Standard, Reserved, Unusable, Context, DataOwnerID
FROM         dbo.TableOBISGroup
GO
