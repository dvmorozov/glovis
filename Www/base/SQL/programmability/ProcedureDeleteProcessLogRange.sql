
DROP PROCEDURE DeleteProcessLogRange
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
CREATE PROCEDURE DeleteProcessLogRange 
	@StartContentsID BIGINT, 
	@EndContentsID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableProcessLogContents
	WHERE ID BETWEEN @StartContentsID AND @EndContentsID
	COMMIT
END
GO
