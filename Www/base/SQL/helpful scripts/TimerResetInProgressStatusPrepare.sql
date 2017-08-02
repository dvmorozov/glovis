
--ALTER DATABASE Oonze SET ENABLE_BROKER
--GO

DROP SERVICE ResetInProgressStatusReceiveService
GO

DROP SERVICE ResetInProgressStatusTransmitService
GO

DROP QUEUE ResetInProgressStatusReceiveQueue
GO

DROP QUEUE ResetInProgressStatusTransmitQueue
GO

DROP CONTRACT ResetInProgressStatusContract
GO

DROP MESSAGE TYPE ResetInProgressStatusTick
GO

CREATE MESSAGE TYPE ResetInProgressStatusTick
VALIDATION = NONE
GO

CREATE CONTRACT ResetInProgressStatusContract
(ResetInProgressStatusTick SENT BY INITIATOR)
GO

CREATE QUEUE ResetInProgressStatusReceiveQueue
GO

CREATE QUEUE ResetInProgressStatusTransmitQueue
GO

CREATE SERVICE ResetInProgressStatusReceiveService
ON QUEUE ResetInProgressStatusReceiveQueue (ResetInProgressStatusContract)
GO

CREATE SERVICE ResetInProgressStatusTransmitService
ON QUEUE ResetInProgressStatusTransmitQueue (ResetInProgressStatusContract)
GO

DROP PROCEDURE ResetInProgressStatusActivProc
GO

CREATE PROCEDURE ResetInProgressStatusActivProc
--ALTER PROCEDURE ResetInProgressStatusActivProc
AS
BEGIN
	DECLARE @RecvReqDlgHandle UNIQUEIDENTIFIER;
	DECLARE @RecvReqMsg NVARCHAR(100);
	DECLARE @RecvReqMsgName sysname;

	PRINT 'ResetInProgressStatusActivProc is executed'

	BEGIN TRANSACTION;

	RECEIVE TOP(1)
		@RecvReqDlgHandle = conversation_handle,
		@RecvReqMsg = message_body,
		@RecvReqMsgName = message_type_name
	FROM ResetInProgressStatusReceiveQueue

	IF @@ROWCOUNT = 0
	BEGIN
	  COMMIT TRANSACTION;
	  RETURN;
	END

	PRINT 'ResetInProgressStatusActivProc is processing messages'
	PRINT @RecvReqDlgHandle

	IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer'
	BEGIN
		EXEC ResetInProgressStatus;
		
		DECLARE @Dialog UNIQUEIDENTIFIER
		SET @Dialog = (SELECT TOP(1) CAST(Value AS UNIQUEIDENTIFIER) FROM TableAppAttribute
					   WHERE [Key] = 'ResetInProgressStatusDialog')
		
		IF @Dialog IS NOT NULL
		BEGIN
			BEGIN CONVERSATION TIMER (@Dialog) TIMEOUT = 5;
			PRINT 'ResetInProgressStatusActivProc restarts the timer'
		END
	END
	ELSE IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
	BEGIN
		END CONVERSATION @RecvReqDlgHandle;
	END
	ELSE IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
	BEGIN
		END CONVERSATION @RecvReqDlgHandle;
	END
	  
	COMMIT TRANSACTION;
END  
GO

ALTER QUEUE ResetInProgressStatusReceiveQueue
    WITH ACTIVATION
    ( 
		STATUS = ON,
		PROCEDURE_NAME = ResetInProgressStatusActivProc,
		MAX_QUEUE_READERS = 10,
		EXECUTE AS SELF
    );
GO
