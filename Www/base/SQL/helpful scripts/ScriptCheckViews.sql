SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE SGMasterBase
GO

DECLARE @Cursor CURSOR, @ViewName NCHAR(1000)
SET     @Cursor = CURSOR FOR 
	SELECT name
	FROM sysobjects o
	WHERE OBJECTPROPERTY(o.id, N'IsView') = 1 
		AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
		AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
		AND o.name LIKE N'View%'
OPEN @Cursor	

WHILE 1=1
BEGIN
	FETCH FROM @Cursor INTO @ViewName
	IF @@fetch_status <> 0 BREAK
	DECLARE @Select VARCHAR(1000)
	SET @Select = 'SELECT * FROM ' + @ViewName
	EXEC (@Select)			
END
