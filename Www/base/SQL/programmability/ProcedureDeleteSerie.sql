
DROP PROCEDURE DeleteSerie
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE PROCEDURE DeleteSerie 
	-- Add the parameters for the stored procedure here
	@SerieID UNIQUEIDENTIFIER, 
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @STRERRORMESSAGE NVARCHAR(1000)

	--	Deletes associated files.
	DECLARE @Cursor1 CURSOR, @FileName VARCHAR(MAX)
	SET @Cursor1 = CURSOR FOR 
		SELECT StringValue FROM TableDataPoint WHERE Units = @SerieID AND DataOwnerID = @UserID
	OPEN @Cursor1	
		
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor1 INTO @FileName
		IF @@fetch_status <> 0 BREAK

		SELECT @STRERRORMESSAGE = 'DeleteSerie is going to delete ' + @FileName
		EXEC AddMessageToAppLog @STRERRORMESSAGE

		EXEC DeleteFiles @FileName
	END

	--	Deletes data points.
	DELETE FROM TableDataPoint WHERE Units = @SerieID AND DataOwnerID = @UserID
END
GO
