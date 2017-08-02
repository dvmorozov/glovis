
DROP PROCEDURE ExportValueVsTimeStatAsXML
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
CREATE PROCEDURE ExportValueVsTimeStatAsXML 
	@TempTableName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Sql NVARCHAR(300)
	
	DECLARE @TMax DATETIME2(7)
	DECLARE @TMin DATETIME2(7)
	SET @Sql = N'SELECT @Max = MAX(OriginalAcqTime), @Min = MIN(OriginalAcqTime) FROM ' + @TempTableName
	EXECUTE sp_executesql @Sql, N'@Max DATETIME2(7) OUTPUT, @Min DATETIME2(7) OUTPUT', @Max = @TMax OUTPUT, @Min = @TMin OUTPUT	
	
	DECLARE @Step INT
	DECLARE @Units NVARCHAR(20)
	DECLARE @Mult FLOAT
	
	EXEC GetTimeMult @TMax,	@TMin, @Step OUTPUT, @Units OUTPUT, @Mult OUTPUT

	DECLARE @X XML
	SET @Sql = N'SET @XmlDataOut = (SELECT MAX(Time) AS TMax, MIN(Time) AS TMin, MAX(Value) AS VMax, MIN(Value) AS VMin, MAX(OriginalAcqTime) AS OrigAcqTimeMax, MIN(OriginalAcqTime) AS OrigAcqTimeMin, @TU AS TimeUnits FROM ' + 
		@TempTableName + ' FOR XML RAW(''ChartDataStat''), ELEMENTS)'
	EXECUTE sp_executesql @Sql, N'@TU NVARCHAR(20), @XmlDataOut XML OUTPUT', @TU = @Units, @XmlDataOut = @X OUTPUT	

	DECLARE @Str VARCHAR(MAX)
	SET @Str = '<DataStat>' + CONVERT(VARCHAR(MAX), @X) + '</DataStat>'

	INSERT INTO #file_names
	SELECT @Str, 'datastat'
END
GO
