
DROP PROCEDURE ResetInProgressStatus
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 01/12/13
-- Description:	evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/
--				https://www.evernote.com/shard/s132/nl/14501366/04de2b98-e715-4f61-bcba-8eded24a4269
-- =============================================
CREATE PROCEDURE ResetInProgressStatus
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [Oonze].[dbo].[TableCurrentStateOperation]
	SET OperationInProgress = 0, FinishedSuccessfully = 0
	WHERE OperationInProgress = 1 AND DATEDIFF(second, OperationBegin, SYSDATETIME()) > 30
END
GO
