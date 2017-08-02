
DROP PROCEDURE AddCountry
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE AddCountry
	@Country NCHAR(30),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @InsertedID TABLE (ID BIGINT)	
	DECLARE @COUNT BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @COUNT = COUNT(*), @MAXID = MAX(ID)
	FROM TableCountry
	WHERE Country = @Country AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		-- inserts new country with limitation
		SELECT @COUNT = COUNT(*) FROM TableCountry
		WHERE DataOwnerID = @DataOwnerID
		
		-- reasonable limitation - there are 251 contries in the World now
		-- https://www.evernote.com/shard/s132/nl/14501366/51db755d-a500-4329-a231-7264d343672b
		IF @COUNT >= 255
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			INSERT INTO TableCountry (Country, DataOwnerID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@Country, @DataOwnerID)

			SELECT MAX(ID) FROM @InsertedID		
		END
	END
	ELSE
	BEGIN
		-- returns existing identifier
		SELECT @MAXID
	END
END
GO
