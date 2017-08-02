

-- Stops the status checking and updating process.
-- evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/

DECLARE @Dialog UNIQUEIDENTIFIER
SET @Dialog = (SELECT TOP(1) CAST(Value AS UNIQUEIDENTIFIER) FROM TableAppAttribute
				WHERE [Key] = 'ResetInProgressStatusDialog')

END CONVERSATION @Dialog
GO
