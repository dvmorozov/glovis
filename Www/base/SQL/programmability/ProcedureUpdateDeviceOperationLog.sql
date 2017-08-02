
DROP PROCEDURE UpdateDeviceOperationLog
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 19/10/2013
-- Description:	evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
-- =============================================
CREATE PROCEDURE UpdateDeviceOperationLog 
	@OperationID UNIQUEIDENTIFIER,
	@UserID UNIQUEIDENTIFIER,
	@Message NVARCHAR(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDeviceOperationLog
	SET ResultingMessage = @Message
	WHERE OperationID = @OperationID 
		--	This does not work until 
		--	InstanceStarter will log on
		--	with actual user credentials.
		--AND ExecutingUserID = @UserID
END
GO
