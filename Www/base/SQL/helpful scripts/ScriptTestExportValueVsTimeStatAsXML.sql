
USE SGMasterBase
GO

DECLARE @TempTableName NVARCHAR(100) = '##unit_test'
DECLARE @Path VARCHAR(255) = 'c:\temp'

CREATE TABLE ##unit_test (Time FLOAT, Value DECIMAL(19, 6), OriginalAcqTime DATETIME2(7))
INSERT INTO ##unit_test (Time, Value, OriginalAcqTime) VALUES (0, 123.456, SYSDATETIME())

EXEC ExportValueVsTimeStatAsXML @TempTableName,	@Path

DROP TABLE ##unit_test