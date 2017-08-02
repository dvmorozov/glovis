
USE SGMasterBase
GO

DECLARE @TempTableName NVARCHAR(100) = '##unit_test'
DECLARE @Path VARCHAR(255) = 'c:\temp'
DECLARE @FileName VARCHAR(100) = 'dummy.xml'

CREATE TABLE ##unit_test (Time DATETIME2(7), Value DECIMAL(19, 6))
INSERT INTO ##unit_test (Time, Value) VALUES (SYSDATETIME(), 123.456)

EXEC ExportValueVsTimeAsXML @TempTableName,	@Path, @FileName

DROP TABLE ##unit_test