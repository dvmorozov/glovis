
DROP PROCEDURE UpdateAddress
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
CREATE PROCEDURE UpdateAddress 
	@AddressID BIGINT,
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
	
	DECLARE @ApartamentID BIGINT = NULL
	DECLARE @BuildingID BIGINT = NULL
	DECLARE @StreetID BIGINT = NULL
	DECLARE @CityID BIGINT = NULL
	DECLARE @StateID BIGINT = NULL
	DECLARE @CountryID BIGINT = NULL
	DECLARE @ZipCodeID BIGINT = NULL
	
	SELECT @ApartamentID = ApartamentID, @BuildingID = BuildingID, @StreetID = StreetID,
		@CityID = CityID, @StateID = StateID, @CountryID = CountryID, @ZipCodeID = ZipCodeID
	FROM TableAddress
	WHERE ID = @AddressID AND DataOwnerID = @DataOwnerID
		
	BEGIN TRANSACTION
	
	UPDATE TableApartament
	SET Apartament = @Apartament
	WHERE ID = @ApartamentID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableBuilding
	SET Building = @Building
	WHERE ID = @BuildingID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableStreet
	SET Street = @Street
	WHERE ID = @StreetID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCity
	SET City = @City
	WHERE ID = @CityID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableState
	SET State = @State
	WHERE ID = @StateID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCountry
	SET Country = @Country
	WHERE ID = @CountryID AND DataOwnerID = @DataOwnerID

	COMMIT
END
GO
