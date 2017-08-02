
DROP PROCEDURE AddMessageToAppLog
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 16/11/2013
-- Description:	Adds a messge to the application log.
-- =============================================
CREATE PROCEDURE AddMessageToAppLog 
	@Message NVARCHAR(1000) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @MaxAppLog INT 
    SET @MaxAppLog = (SELECT MaxAppLog FROM GetCurrentAppConfig())
	IF @MaxAppLog IS NULL SET @MaxAppLog = 100
	
	INSERT INTO TableAppLog (Message, ServerTimeStamp)
	VALUES (@Message, GETDATE())
	
	DECLARE @Count BIGINT
	SET @Count = (SELECT COUNT(*) FROM TableAppLog)
	
	IF @Count > @MaxAppLog
	BEGIN
		--	Deletes the oldest rows.
		--  evernote:///view/14501366/s132/93383680-d5b6-4549-b8e9-2d68da10e46b/93383680-d5b6-4549-b8e9-2d68da10e46b/
		DELETE FROM TableAppLog
		WHERE ID IN (SELECT TOP(@Count - @MaxAppLog) ID FROM TableAppLog ORDER BY ID)
	END
END
GO
