
DROP PROCEDURE AddDeviceOwner
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	The procedure adds device owner with accociated address.
-- =============================================
CREATE PROCEDURE AddDeviceOwner 
	@FirstName NCHAR(20),
	@LastName NCHAR(20),
	@Company NCHAR(30),
	
	@Apartament NCHAR(5),
	@Building NCHAR(10),
	@Street NCHAR(30),
	@City NCHAR(20),
	@State NCHAR(20),
	@Country NCHAR(30),
	@ZipCode NCHAR(10),
	
	@EMail NCHAR(20),
	@Phone CHAR(20),
	@Cell CHAR(20),
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
	DECLARE @OwnerIDs TABLE (ID BIGINT)

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
	
	IF @CountryID = -1 OR @StateID = -1 OR @ZipCodeID = -1 OR
		@CityID = -1 OR @StreetID = -1 OR @BuildingID = -1 OR
		@ApartamentID = -1
	BEGIN
		ROLLBACK
		SELECT -1
	END
	BEGIN
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
				ROLLBACK
				SELECT -1
			END
			ELSE
			BEGIN
				-- adds new address
				INSERT INTO TableAddress (ZipCodeID, CountryID, StateID, CityID, StreetID, BuildingID, ApartamentID, DataOwnerID)
				OUTPUT INSERTED.ID INTO @InsertedID	
				VALUES (@ZipCodeID, @CountryID, @StateID, @CityID, @StreetID, @BuildingID, @ApartamentID, @DataOwnerID)

				SELECT @AddressID = MAX(ID) FROM @InsertedID
			END
		END
		ELSE
		BEGIN	
			SELECT @AddressID = @MAXID
		END

		SELECT @COUNT = COUNT(*), @MAXID = MAX(ID)
		FROM TableDeviceOwner
		WHERE FirstName = @FirstName AND LastName = @LastName AND Company = @Company AND 
			EMail = @EMail AND Phone = @Phone AND Cell = @Cell AND AddressID = @AddressID AND 
			DataOwnerID = @DataOwnerID

		IF @COUNT = 0
		BEGIN
			SELECT @COUNT = COUNT(*) FROM TableDeviceOwner
			WHERE DataOwnerID = @DataOwnerID
			
			IF @COUNT >= 10
			BEGIN
				ROLLBACK
				SELECT -1
			END
			ELSE
			BEGIN
				INSERT INTO TableDeviceOwner 
					(FirstName, LastName, Company, EMail, Phone, Cell, AddressID, DataOwnerID)
				OUTPUT INSERTED.ID INTO @OwnerIDs
				VALUES
					(@FirstName, @LastName, @Company, @EMail, @Phone, @Cell, @AddressID, @DataOwnerID)
					
				SELECT MAX(ID) FROM @OwnerIDs
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
