
-- Starts the status checking and updating process.
-- evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/

DECLARE @Dialog UNIQUEIDENTIFIER
DECLARE @Message NVARCHAR(128)

BEGIN DIALOG CONVERSATION @Dialog
FROM SERVICE ResetInProgressStatusReceiveService
TO SERVICE 'ResetInProgressStatusReceiveService'
WITH ENCRYPTION = OFF

DECLARE @ID BIGINT
SET @ID = (SELECT ID FROM TableAppAttribute WHERE [Key] = 'ResetInProgressStatusDialog')

IF @ID IS NOT NULL 
BEGIN
	UPDATE TableAppAttribute
	SET Value = CAST(@Dialog AS NVARCHAR(1000))
	WHERE [Key] = 'ResetInProgressStatusDialog'
END
ELSE
BEGIN
	INSERT INTO TableAppAttribute ([Key], Value)
	VALUES ('ResetInProgressStatusDialog', CAST(@Dialog AS NVARCHAR(1000)))
END

-- The period is from 5 up to 10 seconds.
BEGIN CONVERSATION TIMER ( @Dialog ) TIMEOUT = 5; 
GO
