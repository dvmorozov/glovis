
DROP PROCEDURE TurnRecordingOnOff
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 17/10/13
-- Description:	Turns on and off video recording.
-- =============================================
CREATE PROCEDURE TurnRecordingOnOff
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER, 
	@TurnOff BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	DECLARE @OperationID UNIQUEIDENTIFIER
	SET @OperationID = NEWID()

	DECLARE @OperationType NCHAR(10)

	IF @TurnOff = 1
	BEGIN
		SET @OperationType = 'turn off'
		INSERT INTO TableDeviceOperationLog(Command, ResultingMessage, ExecutingUserID, OperationID, TimeStamp)
		VALUES (@OperationType, '', @DataOwnerID, @OperationID, GETDATE())
	END
	ELSE
	BEGIN
		SET @OperationType = 'turn on'
		INSERT INTO TableDeviceOperationLog(Command, ResultingMessage, ExecutingUserID, OperationID, TimeStamp)
		VALUES (@OperationType, '', @DataOwnerID, @OperationID, GETDATE())
	END

	DECLARE @OperationInProgress BIT
	SET @OperationInProgress = (SELECT OperationInProgress FROM ViewCurrentState WHERE ID = @ElementID)

	IF @OperationInProgress = 0
	BEGIN
		--	Updates task state.	
		UPDATE TableCurrentState
		SET AcquisitionDisabled = @TurnOff
		WHERE ID = @ElementID

		--	Deletes all previous operations.
		DELETE FROM TableCurrentStateOperation
		WHERE CurrentStateID = @ElementID

		--	Inserts a new operation.
		--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
		--  https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459
		INSERT INTO TableCurrentStateOperation (OperationID, OperationInProgress, FinishedSuccessfully, OperationBegin, CurrentStateID, OperationType)
		--  evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/
		VALUES (@OperationID, 1, 0, SYSDATETIME(), @ElementID, @OperationType)
	
		--	Returns value as a recordset to simplify importing into the model.
		SELECT @OperationID
	
		COMMIT
	END
	ELSE
	BEGIN
		ROLLBACK;
	END
END
GO
