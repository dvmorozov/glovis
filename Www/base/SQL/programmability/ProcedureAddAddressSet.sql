
DROP PROCEDURE AddAddressSet
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE AddAddressSet 
	@ApartamentID BIGINT,
	@BuildingID BIGINT,
	@StreetID BIGINT,
	@CityID BIGINT,
	@StateID BIGINT,
	@CountryID BIGINT,
	@ZipCodeID BIGINT,
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
	FROM TableAddress
	WHERE ZipCodeID = @ZipCodeID AND CountryID = @CountryID
		AND StateID = @StateID AND CityID = @CityID AND StreetID = @StreetID
		AND BuildingID = @BuildingID AND ApartamentID = @ApartamentID 
		AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableAddress
		WHERE DataOwnerID = @DataOwnerID
		
		IF @COUNT >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- adds new address
			INSERT INTO TableAddress (ZipCodeID, CountryID, StateID, CityID, StreetID, BuildingID, ApartamentID, DataOwnerID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@ZipCodeID, @CountryID, @StateID, @CityID, @StreetID, @BuildingID, @ApartamentID, @DataOwnerID)

			SELECT MAX(ID) FROM @InsertedID		
		END
	END
	ELSE
	BEGIN	
		SELECT @MAXID
	END
END
GO

