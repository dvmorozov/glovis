SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE SGMasterBase
GO

DECLARE @Cursor CURSOR, @SPName NCHAR(1000)
SET     @Cursor = CURSOR FOR 
	SELECT 'SPTest_Clean' + name	
	FROM sysobjects o
	WHERE OBJECTPROPERTY(o.id, N'IsTable') = 1 
		AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
		AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
		AND o.name LIKE N'Table%'
OPEN @Cursor	

WHILE 1=1
BEGIN
	FETCH FROM @Cursor INTO @SPName
	IF @@fetch_status <> 0 BREAK
	DECLARE @FullName VARCHAR(1000)
	SET @FullName = RTRIM(@SPName) + '.sql'
	DECLARE @Text VARCHAR(1000)
	SET @Text =
'SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ' + RTRIM(@SPName) +  '
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
END
GO'
			
	EXECUTE SPWRITESTRINGTOFILE 
		@Text, 'D:\my\projects\my\appsoft\smart grid\sgscada\base\SQL', @FullName
END
