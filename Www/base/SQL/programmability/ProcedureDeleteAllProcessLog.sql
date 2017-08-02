
DROP PROCEDURE DeleteAllProcessLog
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteAllProcessLog 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableProcessLogMessages
	WHERE 1=1
	
	DELETE FROM TableProcessLogContents
	WHERE 1=1
	COMMIT
END
GO
