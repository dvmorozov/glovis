
DROP PROCEDURE UpdateProcess
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 22/03/14
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/78473ff5-ec1e-4748-9ea0-8f80b630d0a5
-- =============================================
CREATE PROCEDURE UpdateProcess
	@TaskID UNIQUEIDENTIFIER,
	@Process NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableTask
	SET Process = @Process
	WHERE TaskID = @TaskID
END
GO
