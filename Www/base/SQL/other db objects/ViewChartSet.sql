ALTER VIEW ViewChartSet
AS
SELECT     ID, RTRIM(Name) AS Name, CellWidth, CellHeight, Rows, Cols, Margin, DataOwnerID
FROM         dbo.TableChartSet
GO
