
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanDatabase
GO 
-- =============================================
-- Author:		D.Morozov
-- Create date: 25/11/2011
-- Description:	The procedure cleans all database tables.
-- =============================================
CREATE PROCEDURE SPTest_CleanDatabase 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR, @SPName NCHAR(100)
	SET     @Cursor = CURSOR FOR 
		SELECT 'SPTest_Clean' + name	
		FROM sysobjects o
		WHERE OBJECTPROPERTY(o.id, N'IsTable') = 1 
			AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
			AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
			AND o.name LIKE N'Table%'
	OPEN @Cursor	

	BEGIN TRANSACTION	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @SPName
		IF @@fetch_status <> 0 BREAK
		EXEC @SPName @DataOwnerID
	END

	EXEC SPTest_CleanUsers @DataOwnerID
	COMMIT
END
GO
