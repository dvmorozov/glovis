
DROP PROCEDURE ExportValueVsTimeAsXML
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE ExportValueVsTimeAsXML 
	@TempTableName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- instead of file names the table contains XML data!
	DECLARE @FileNames TABLE (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	DECLARE @ElementIDs TABLE (ID BIGINT)
	DECLARE @Sql NVARCHAR(MAX)
	SET @Sql = 'SELECT DISTINCT ElementID FROM ' + @TempTableName
	INSERT @ElementIDs
	EXECUTE (@Sql)
	
	DECLARE @Cursor CURSOR, @ElementID BIGINT
	SET     @Cursor = CURSOR FOR 
		SELECT ID 
		FROM @ElementIDs
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @ElementID
		IF @@fetch_status <> 0 BREAK
		
		DECLARE @X XML
		DECLARE @Sql1 NVARCHAR(MAX)
		SET @Sql1 = 'SET @XmlDataOut = (SELECT CONVERT(DECIMAL(19, 9), Time) AS Time, Value, StringValue FROM ' + @TempTableName + ' WHERE ElementID = ' + 
			CONVERT(NVARCHAR(100), @ElementID) + ' FOR XML RAW(''DataPoint''), ELEMENTS)'
		EXECUTE sp_executesql @Sql1, N'@XmlDataOut XML OUTPUT', @XmlDataOut = @X OUTPUT	

		DECLARE @Str VARCHAR(MAX)
		SET @Str = '<DataSet>' + CONVERT(VARCHAR(MAX), @X) + '</DataSet>'
		
		INSERT INTO @FileNames
		VALUES (@Str, 'dataset')
	END
	
	INSERT INTO #file_names
	SELECT * FROM @FileNames
END
GO
