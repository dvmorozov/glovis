ALTER VIEW ViewChart
AS
SELECT     ID, RTRIM(Name) AS Name, Width, Height, DataOwnerID, RTRIM(DataSetType) AS DataSetType, DataSetMaxCount, RTRIM(ChartType) AS ChartType
FROM         dbo.TableChart
GO
