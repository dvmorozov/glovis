SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE AppStarterBase
GO

DECLARE @Cursor CURSOR, @TableName NCHAR(1000)
SET     @Cursor = CURSOR FOR 
	SELECT name
	FROM sysobjects o
	WHERE OBJECTPROPERTY(o.id, N'IsTable') = 1 
		AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
		AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
		AND o.name LIKE N'Table%'
OPEN @Cursor	

WHILE 1=1
BEGIN
	FETCH FROM @Cursor INTO @TableName
	IF @@fetch_status <> 0 BREAK
	DECLARE @Select VARCHAR(1000)
	SET @Select = 'DROP TABLE ' + @TableName
	EXEC (@Select)			
	PRINT @TableName
END
