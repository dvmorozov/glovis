SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE AppStarterBase
GO

DECLARE @Cursor CURSOR, @ProcName NCHAR(1000)
SET     @Cursor = CURSOR FOR 
	SELECT name
	FROM sysobjects o
	WHERE OBJECTPROPERTY(o.id, N'IsProcedure') = 1 
		AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
		AND o.name NOT LIKE N'aspnet_%'
		AND o.name NOT LIKE N'sp_%'
		OR o.name LIKE N'SPTest_%'
OPEN @Cursor	

WHILE 1=1
BEGIN
	FETCH FROM @Cursor INTO @ProcName
	IF @@fetch_status <> 0 BREAK
	DECLARE @Select VARCHAR(1000)
	SET @Select = 'DROP PROCEDURE ' + @ProcName
	EXEC (@Select)			
	PRINT @ProcName
END
