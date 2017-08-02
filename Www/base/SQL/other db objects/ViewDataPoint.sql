
--	evernote:///view/14501366/s132/4e63229b-4ad2-499e-adf7-9df596b40a2a/4e63229b-4ad2-499e-adf7-9df596b40a2a/
--	"StringValue" was added.

ALTER VIEW ViewDataPoint
AS
SELECT        ID, MeasurementTime, AcquisitionTime, Value, RTRIM(Units) AS Units, SessionID, IsOBIS, QualityBad, DataOwnerID, ElementID, StringValue, Units AS Expr1
FROM            dbo.TableDataPoint
GO
