
DROP PROCEDURE AddMessageToProcessLog
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddMessageToProcessLog 
	@ContentsID BIGINT,
	@Message NCHAR(100),
	@MessageTimestamp DATETIME2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableProcessLogMessages

	IF @Count >= 10000
	BEGIN
		DELETE FROM TableProcessLogMessages
		WHERE ID IN (
			SELECT TOP(10) ID FROM TableProcessLogMessages
			ORDER BY ServerTimestamp ASC
			)
	END
		
	INSERT INTO TableProcessLogMessages (ContentsID, Message, MessageTimestamp, ServerTimestamp)
	VALUES (@ContentsID, @Message, @MessageTimestamp, SYSDATETIME())
END
GO
