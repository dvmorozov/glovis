
DROP PROCEDURE UpdateDeviceStatus
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 22/10/13
-- Description:	evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
-- =============================================
CREATE PROCEDURE UpdateDeviceStatus
	@ElementID BIGINT,
	@FinishedSuccessfully BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
	--  Updates all processing operations to simulate the initial behaviour.
	UPDATE TableCurrentStateOperation
	SET FinishedSuccessfully = @FinishedSuccessfully, OperationInProgress = 0
	WHERE CurrentStateID = @ElementID
END
GO
