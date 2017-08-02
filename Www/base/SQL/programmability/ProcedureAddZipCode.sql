
DROP PROCEDURE AddZipCode
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
CREATE PROCEDURE AddZipCode
	@ZipCode NCHAR(20),
	@CountryID BIGINT,
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
	FROM TableZipCode
	WHERE ZipCode = @ZipCode AND CountryID = @CountryID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableZipCode
		WHERE DataOwnerID = @DataOwnerID
		
		IF @COUNT >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- inserts new zip code
			INSERT INTO TableZipCode (ZipCode, DataOwnerID, CountryID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@ZipCode, @DataOwnerID, @CountryID)

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
