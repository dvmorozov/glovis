
DROP PROCEDURE DeleteFiles
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 11/04/2014
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/9b13b017-204d-4dbc-9b38-a244e29a843f
-- =============================================
CREATE PROCEDURE DeleteFiles 
	@FileName NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--  Replaces the extension by '*' to delete all associated files.
	--  evernote:///view/14501366/s132/70094dfc-3fe5-4fbc-ade7-ccae84c69452/70094dfc-3fe5-4fbc-ade7-ccae84c69452/
	SET @FileName = SUBSTRING(@FileName, 1, LEN(@FileName) - CHARINDEX('.', REVERSE(@FileName))) + '.*'

	EXEC SPDELETEFILE @FileName
END
GO
