
DROP PROCEDURE BreakOperation
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 04/11/13
-- Description:	evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
-- =============================================
CREATE PROCEDURE BreakOperation
	@OperationID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
	UPDATE TableCurrentStateOperation
	SET FinishedSuccessfully = 0, OperationInProgress = 0
	WHERE OperationID = @OperationID
END
GO
