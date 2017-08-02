
DROP PROCEDURE GetProcessLogMessages
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
CREATE PROCEDURE GetProcessLogMessages 
	@ContentsID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT * 
	FROM TableProcessLogMessages
	WHERE ContentsID = @ContentsID
	ORDER BY ServerTimestamp DESC
END
GO
