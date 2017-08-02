ALTER VIEW ViewChartSetCharts
AS
SELECT     dbo.TableChartSetsCharts.ColIndex, dbo.TableChartSetsCharts.RowIndex, RTRIM(dbo.TableChart.Name) AS ChartName, RTRIM(dbo.TableChartSet.Name) 
                      AS ChartSetName, dbo.TableChart.DataOwnerID, dbo.TableChartSet.ID AS ChartSetID, dbo.TableChart.ID AS ChartID
FROM         dbo.TableChartSetsCharts INNER JOIN
                      dbo.TableChartSet ON dbo.TableChartSetsCharts.ChartSetID = dbo.TableChartSet.ID RIGHT OUTER JOIN
                      dbo.TableChart ON dbo.TableChartSetsCharts.ChartID = dbo.TableChart.ID
GO
