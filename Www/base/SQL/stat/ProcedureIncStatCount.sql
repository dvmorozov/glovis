
USE Oonze
GO

DROP PROCEDURE IncStatCount
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 05/01/2014
-- Description:	evernote:///view/14501366/s132/9926e2a8-1589-41cd-8179-b38843da795c/9926e2a8-1589-41cd-8179-b38843da795c/
-- =============================================
CREATE PROCEDURE IncStatCount 
	@URL NVARCHAR(1000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @URLID BIGINT
	SET @URLID = (SELECT ID FROM stat_RequestCount WHERE URL = @URL)

	IF @URLID IS NULL
	BEGIN
		INSERT INTO stat_RequestCount (URL, Count)
		VALUES (@URL, 1)
	END
	ELSE
	BEGIN
		UPDATE stat_RequestCount
		SET Count = Count + 1
		WHERE ID = @URLID
	END
END
GO
