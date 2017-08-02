
DROP PROCEDURE CreateTempTableForValueVsTime
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE CreateTempTableForValueVsTime 
	@Name NVARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UniqName NVARCHAR(MAX)
	EXEC GetUniqName @UniqName OUTPUT
	
	SET @Name = '##TableDataSet_' + @UniqName

	DECLARE @Sql NVARCHAR(200)
	SET @Sql = 'CREATE TABLE ' + RTRIM(@Name) + ' (Time FLOAT, Value DECIMAL(19, 6), ElementID BIGINT, OriginalAcqTime DATETIME2(7))'
	EXEC(@Sql)
END
GO
