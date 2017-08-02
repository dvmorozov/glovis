
DROP PROCEDURE GetSerieList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 18/05/2012
-- Description:	The procedure gets point serie list for given value identifier.
-- =============================================
CREATE PROCEDURE GetSerieList 
	@ValueIdentifier UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT Units AS SerieID FROM TableDataPoint
	WHERE ValueIdentifier = @ValueIdentifier AND 
		DataOwnerID = @DataOwnerID
END
GO
