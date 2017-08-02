
DROP PROCEDURE AddAddress
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 11/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE AddAddress 
	@Apartament NCHAR(5),
	@Building NCHAR(10),
	@Street NCHAR(30),
	@City NCHAR(20),
	@State NCHAR(20),
	@Country NCHAR(30),
	@ZipCode NCHAR(10),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	DECLARE @CountryIDs TABLE (ID BIGINT)
	DECLARE @CountryID BIGINT
	DECLARE @StateIDs TABLE (ID BIGINT)
	DECLARE @StateID BIGINT
	DECLARE @ZipCodeIDs TABLE (ID BIGINT)
	DECLARE @ZipCodeID BIGINT
	DECLARE @CityIDs TABLE (ID BIGINT)
	DECLARE @CityID BIGINT
	DECLARE @StreetIDs TABLE (ID BIGINT)
	DECLARE @StreetID BIGINT
	DECLARE @BuildingIDs TABLE (ID BIGINT)
	DECLARE @BuildingID BIGINT
	DECLARE @ApartamentIDs TABLE (ID BIGINT)
	DECLARE @ApartamentID BIGINT
	DECLARE @AddressIDs TABLE (ID BIGINT)
	DECLARE @AddressID BIGINT

	INSERT INTO @CountryIDs
	EXECUTE AddCountry @Country, @DataOwnerID
	SELECT @CountryID = MAX(ID) FROM @CountryIDs
	
	INSERT @StateIDs
	EXECUTE AddState @State, @CountryID, @DataOwnerID
	SELECT @StateID = MAX(ID) FROM @StateIDs
	
	INSERT @ZipCodeIDs
	EXECUTE AddZipCode @ZipCode, @CountryID, @DataOwnerID
	SELECT @ZipCodeID = MAX(ID) FROM @ZipCodeIDs

	INSERT @CityIDs
	EXECUTE AddCity @City, @StateID, @DataOwnerID
	SELECT @CityID = MAX(ID) FROM @CityIDs

	INSERT @StreetIDs
	EXECUTE AddStreet @Street, @CityID, @DataOwnerID
	SELECT @StreetID = MAX(ID) FROM @StreetIDs

	INSERT @BuildingIDs
	EXECUTE AddBuilding @Building, @StreetID, @DataOwnerID
	SELECT @BuildingID = MAX(ID) FROM @BuildingIDs

	INSERT @ApartamentIDs
	EXECUTE AddApartament @Apartament, @BuildingID, @DataOwnerID
	SELECT @ApartamentID = MAX(ID) FROM @ApartamentIDs
		
	DECLARE @InsertedID TABLE (ID BIGINT)	
	DECLARE @COUNT BIGINT
	DECLARE @MAXID BIGINT
	
	IF @CountryID = -1 OR @StateID = -1 OR @ZipCodeID = -1 OR
		@CityID = -1 OR @StreetID = -1 OR @BuildingID = -1 OR
		@ApartamentID = -1
	BEGIN
		ROLLBACK
		SELECT -1
	END
	ELSE
	BEGIN
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
				ROLLBACK
				SELECT -1
			END
			ELSE
			BEGIN
				-- adds new address
				INSERT INTO TableAddress (ZipCodeID, CountryID, StateID, CityID, StreetID, BuildingID, ApartamentID, DataOwnerID)
				OUTPUT INSERTED.ID INTO @InsertedID	
				VALUES (@ZipCodeID, @CountryID, @StateID, @CityID, @StreetID, @BuildingID, @ApartamentID, @DataOwnerID)

				SELECT MAX(ID) FROM @InsertedID		
				COMMIT
			END
		END
		ELSE
		BEGIN	
			SELECT @MAXID
			COMMIT
		END
	END
END
GO

