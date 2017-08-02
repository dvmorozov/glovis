
DROP PROCEDURE UpdateCompletedAction
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateCompletedAction 
    @ScheduleID BIGINT,
    @Completed BIT,
    @CompletionTime DATETIME2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableSchedule
	SET Completed = @Completed, @CompletionTime = CompletionTime
	WHERE ID = @ScheduleID
END
GO
