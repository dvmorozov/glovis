
DROP PROCEDURE CreateProcessLog
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
CREATE PROCEDURE CreateProcessLog 
	@PID BIGINT, 
	@CmdLine NCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @InsertedID TABLE (ID BIGINT)

    INSERT INTO TableProcessLogContents (PID, CmdLine)
    OUTPUT INSERTED.ID INTO @InsertedID
    VALUES (@PID, @CmdLine)
    
	SELECT ID FROM @InsertedID
END
GO
