USE [master]
GO
/****** Object:  Database [Glovis.Www.Dev]    Script Date: 21.08.2015 10:59:41 ******/
CREATE DATABASE [Glovis.Www.Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Glovis.Www.Dev', FILENAME = N'E:\04 - morozov\my\glovis\tags\databases\Www\Glovis.Www.Dev.mdf' , SIZE = 12928KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Glovis.Www.Dev_log', FILENAME = N'E:\04 - morozov\my\glovis\tags\databases\Www\Glovis.Www.Dev.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Glovis.Www.Dev] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Glovis.Www.Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Glovis.Www.Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Glovis.Www.Dev] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Glovis.Www.Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Glovis.Www.Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Glovis.Www.Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Glovis.Www.Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Glovis.Www.Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Glovis.Www.Dev] SET  MULTI_USER 
GO
ALTER DATABASE [Glovis.Www.Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Glovis.Www.Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Glovis.Www.Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Glovis.Www.Dev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Glovis.Www.Dev]
GO
/****** Object:  User [user]    Script Date: 21.08.2015 10:59:41 ******/
CREATE USER [user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 21.08.2015 10:59:41 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 21.08.2015 10:59:41 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 21.08.2015 10:59:41 ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 21.08.2015 10:59:42 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 11/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddAddress] 
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
/****** Object:  StoredProcedure [dbo].[AddAddressSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddAddressSet] 
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
/****** Object:  StoredProcedure [dbo].[AddAllAttrToCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/07/11
-- Description:	The procedure adds all attributes of 
--              given object to collect list.
-- =============================================
CREATE PROCEDURE [dbo].[AddAllAttrToCollectList] 
	@DeviceID BIGINT, -- Physical device id
	@ObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableCurrentState
	WHERE DataOwnerID = @DataOwnerID
	
	SET @Count = 100 - @Count
	
	IF @Count > 0
	BEGIN
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, ValueIdentifier, AcquisitionDisabled, Identifier)
		SELECT TOP(@Count) DataTypeID, @DeviceID, @DataOwnerID, NEWID(), 0, Identifier
		FROM ViewCOSEMAttributeValue
		WHERE
			DataTypeID IN
			(SELECT DataTypeID FROM ViewCOSEMAttributeValue
			WHERE COSEMObjectID = @ObjectID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NULL)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddAllDeviceAttrToCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
-- =============================================
CREATE PROCEDURE [dbo].[AddAllDeviceAttrToCollectList] 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddAllDeviceAttrToCollectListInternal @DeviceID, @DataOwnerID, 0	
END

GO
/****** Object:  StoredProcedure [dbo].[AddAllDeviceAttrToCollectList2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 21/10/13
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
--				Sets the initial values of AcquisitionDisables to 1 (true).
--				evernote:///view/14501366/s132/d635a0a2-f96d-4f4d-aed7-e391c75a2163/d635a0a2-f96d-4f4d-aed7-e391c75a2163/
-- =============================================
CREATE PROCEDURE [dbo].[AddAllDeviceAttrToCollectList2] 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddAllDeviceAttrToCollectListInternal @DeviceID, @DataOwnerID, 1	
END

GO
/****** Object:  StoredProcedure [dbo].[AddAllDeviceAttrToCollectListInternal]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 07/04/14
--				https://www.evernote.com/shard/s132/nl/14501366/04de2b98-e715-4f61-bcba-8eded24a4269
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
-- =============================================
CREATE PROCEDURE [dbo].[AddAllDeviceAttrToCollectListInternal] 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER,
	@AcquisitionDisabled BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableCurrentState
	WHERE DataOwnerID = @DataOwnerID
	
	SET @Count = 100 - @Count
	
	IF @Count > 0
	BEGIN
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, Identifier, ValueIdentifier, AcquisitionDisabled)
		SELECT TOP(@Count) t1.ID, @DeviceID, @DataOwnerID, t1.Identifier, NEWID(), @AcquisitionDisabled
		FROM (
			-- all attributes of all objects...
			SELECT ID, COSEMAttributeID, Identifier FROM ViewDataType
			-- ...of given physical device...
			WHERE COSEMObjectID IN (
				SELECT ID FROM TableCOSEMObject
				WHERE COSEMLogicalDeviceID IN (
					SELECT ID FROM TableCOSEMLogicalDevice
					WHERE DeviceTypeID = (
						SELECT TypeID FROM TableDevice
						WHERE ID = @DeviceID)))
			-- ...except those that already added
			AND (COSEMAttributeID NOT IN
				(SELECT DISTINCT AttributeID FROM ViewCOSEMAttributeValue
				WHERE DeviceID = @DeviceID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NOT NULL
				))
			-- single select condition is applied after all possible objects selection
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))) AS t1
		JOIN (
			SELECT ID, COSEMDataTypeID FROM TableCOSEMAttribute) AS t2
		ON t2.ID = t1.COSEMAttributeID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddAllObjectAttrToCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure adds all attributes
--				of each object of given logical device
--				to collect list.
-- =============================================
CREATE PROCEDURE [dbo].[AddAllObjectAttrToCollectList] 
	@DeviceID BIGINT, 
	@LogicalDeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableCurrentState
	WHERE DataOwnerID = @DataOwnerID
	
	SET @Count = 100 - @Count
	
	IF @Count > 0
	BEGIN
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, Identifier, ValueIdentifier, AcquisitionDisabled)
		SELECT TOP(@Count) t1.ID, @DeviceID, @DataOwnerID, t1.Identifier, NEWID(), 0
		FROM (
			SELECT ID, COSEMAttributeID, Identifier FROM ViewDataType
			WHERE COSEMObjectID IN (
				SELECT ID FROM TableCOSEMObject
				WHERE COSEMLogicalDeviceID = @LogicalDeviceID)
			AND (
				COSEMAttributeID NOT IN
				(SELECT DISTINCT AttributeID FROM ViewCOSEMAttributeValue
				WHERE DeviceID = @DeviceID AND (DataOwnerID = @DataOwnerID OR Standard = 1) AND ValueIdentifier IS NOT NULL
				))
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))) AS t1
		JOIN (
			SELECT ID, COSEMDataTypeID FROM TableCOSEMAttribute) AS t2
		ON t2.ID = t1.COSEMAttributeID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddApartament]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddApartament]
	@Apartament NCHAR(20),
	@BuildingID BIGINT,
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
	FROM TableApartament
	WHERE Apartament = @Apartament AND BuildingID = @BuildingID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableApartament
		WHERE DataOwnerID = @DataOwnerID
		
		IF @COUNT >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- inserts new apartament
			INSERT INTO TableApartament (Apartament, DataOwnerID, BuildingID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@Apartament, @DataOwnerID, @BuildingID)

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
/****** Object:  StoredProcedure [dbo].[AddAttrToCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/07/11
-- Description:	The procedure adds attribute to the collection list.
-- =============================================
CREATE PROCEDURE [dbo].[AddAttrToCollectList] 
	@DeviceID BIGINT, -- Physical device id
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableCurrentState
	WHERE DataOwnerID = @DataOwnerID
	
	SET @Count = 100 - @Count
	
	IF @Count > 0
	BEGIN
		INSERT INTO TableCurrentState(DataTypeID, DeviceID, DataOwnerID, Identifier, ValueIdentifier, AcquisitionDisabled)
		SELECT TOP(@Count) ID, @DeviceID, @DataOwnerID, Identifier, NEWID(), 0
		FROM ViewDataType
		WHERE (COSEMObjectID = @COSEMObjectID) AND (COSEMAttributeID = @COSEMAttributeID)
			AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddBuilding]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddBuilding]
	@Building NCHAR(20),
	@StreetID BIGINT,
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
	FROM TableBuilding
	WHERE Building = @Building AND StreetID = @StreetID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableBuilding
		WHERE DataOwnerID = @DataOwnerID
		
		IF @COUNT >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- inserts new building
			INSERT INTO TableBuilding (Building, DataOwnerID, StreetID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@Building, @DataOwnerID, @StreetID)

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
/****** Object:  StoredProcedure [dbo].[AddCamera]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	Creates new camera and associates a view with it.
-- =============================================
CREATE PROCEDURE [dbo].[AddCamera] 
	--	AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	EXEC AddAllDeviceAttrToCollectList @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	SELECT @DeviceID
END

GO
/****** Object:  StoredProcedure [dbo].[AddCamera2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 27/07/2013
-- Description:	Creates a new camera, 
--				associates view with it and 
--				returns the camera id and
--				the associated data id.
-- =============================================
CREATE PROCEDURE [dbo].[AddCamera2]
	-- AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	EXEC AddAllDeviceAttrToCollectList @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT TOP(1) ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	DECLARE @ValueIdentifier UNIQUEIDENTIFIER
	SET @ValueIdentifier = (SELECT TOP(1) ValueIdentifier FROM ViewElementFiltered
		WHERE DeviceID = @DeviceID AND Attribute = 'URL')

	-- Names must be set up explicitly to 
	SELECT @DeviceID AS CameraID, @ValueIdentifier AS ValueIdentifier
END

GO
/****** Object:  StoredProcedure [dbo].[AddCamera3]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 21/10/2013
-- Description:	Creates a new camera, 
--				associates view with it and 
--				returns the camera id and
--				the associated data id.
-- =============================================
CREATE PROCEDURE [dbo].[AddCamera3]
	-- AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	--	Uses the stored procedure which sets AcquisitionDisable to 1 (true).
	EXEC AddAllDeviceAttrToCollectList2 @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT TOP(1) ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	DECLARE @ValueIdentifier UNIQUEIDENTIFIER
	SET @ValueIdentifier = (SELECT TOP(1) ValueIdentifier FROM ViewElementFiltered
		WHERE DeviceID = @DeviceID AND Attribute = 'URL')

	-- Names must be set up explicitly to 
	SELECT @DeviceID AS CameraID, @ValueIdentifier AS ValueIdentifier, @ElementID AS ElementID
END

GO
/****** Object:  StoredProcedure [dbo].[AddCamera4]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 20/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE [dbo].[AddCamera4]
	-- AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10),
	@Domain NCHAR(20) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper2 @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @Domain, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	--	Uses the stored procedure which sets AcquisitionDisable to 1 (true).
	EXEC AddAllDeviceAttrToCollectList2 @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT TOP(1) ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = 'URL')
	
	--	Associates the view with the data element (of the camera).
	EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	
	COMMIT
	
	DECLARE @ValueIdentifier UNIQUEIDENTIFIER
	SET @ValueIdentifier = (SELECT TOP(1) ValueIdentifier FROM ViewElementFiltered
		WHERE DeviceID = @DeviceID AND Attribute = 'URL')

	-- Names must be set up explicitly to 
	SELECT @DeviceID AS CameraID, @ValueIdentifier AS ValueIdentifier, @ElementID AS ElementID
END

GO
/****** Object:  StoredProcedure [dbo].[AddCamera5]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 12/06/2014
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/6aa6839d-f9e8-4ad0-b0ee-71b169cfde79
-- =============================================
CREATE PROCEDURE [dbo].[AddCamera5]
	-- AddDevice parameters.
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	--	AddChart parameters.
	@ChartName NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10),
	-- Attribute of the device to link with chart.
	@AttributeName NCHAR(100),
	@Domain NCHAR(30) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DeviceID BIGINT
	DECLARE @ChartID BIGINT
	DECLARE @ElementID BIGINT
	
	SET @DeviceID = -1
	
	BEGIN TRANSACTION

	--	Creates new camera ("device").
	EXEC AddDeviceWrapper2 @Name, @InternalAddress,	@AddressType, @Port, @GroupID, @TypeID,	@OwnerID, 
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, 
		@DataOwnerID, @LocationAddressID, @SaveSessions, @Domain, @DeviceID OUTPUT
	
	--	Creates new view ("chart").
	EXEC AddChartWrapper @ChartName, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType, @ChartID OUTPUT
	
	--	Adds all of device attributes to the collect list (to create data elements).
	--	Uses the stored procedure which sets AcquisitionDisable to 1 (true).
	EXEC AddAllDeviceAttrToCollectList2 @DeviceID, @DataOwnerID

	--	Gets the data element.
	SET @ElementID = (SELECT TOP(1) ID FROM ViewElementFiltered
					  WHERE DeviceID = @DeviceID AND Attribute = @AttributeName)
	
	--	Checks for existence of the corresponding data element.
	IF @ElementID IS NOT NULL
	BEGIN
		--	Associates the view with the data element (of the camera).
		EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
	END
	
	COMMIT
	
	DECLARE @ValueIdentifier UNIQUEIDENTIFIER
	SET @ValueIdentifier = (SELECT TOP(1) ValueIdentifier FROM ViewElementFiltered
		WHERE DeviceID = @DeviceID AND Attribute = @AttributeName)

	-- Names must be set up explicitly to 
	SELECT @DeviceID AS CameraID, @ValueIdentifier AS ValueIdentifier, @ElementID AS ElementID
END

GO
/****** Object:  StoredProcedure [dbo].[AddChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChart] 
	@Name NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataOwnerID UNIQUEIDENTIFIER, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SET @MAXID = -1
	
	--	Checks attributes to protect from creation of duplicates.
	SELECT @Count = COUNT(*), @MAXID = MAX(ID) FROM TableChart
	WHERE Name = @Name AND Width = @Width AND Height = @Height AND 
		DataOwnerID = @DataOwnerID AND DataSetType = @DataSetType AND 
		DataSetMaxCount = @DataSetMaxCount AND ChartType = @ChartType

	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*)
		FROM TableChart
		WHERE DataOwnerID = @DataOwnerID

		IF @Count >= 10
		BEGIN
			SELECT -1
		END		
		ELSE
		BEGIN
			EXEC AddChartInternal @Name, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount,	@ChartType
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddChartInternal]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 21/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChartInternal]
	@Name NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataOwnerID UNIQUEIDENTIFIER, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IDs TABLE (ID BIGINT)
	INSERT INTO TableChart (Name, Width, Height, DataOwnerID, DataSetType, DataSetMaxCount, ChartType)
	OUTPUT INSERTED.ID INTO @IDs
	VALUES (@Name, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType)
	SELECT MAX(ID) FROM @IDs
END

GO
/****** Object:  StoredProcedure [dbo].[AddChartsDataTypes]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChartsDataTypes] 
	@ChartID BIGINT,
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableChartsDataTypes
	WHERE (ChartID = @ChartID) AND (ElementID = @ElementID)
		AND (DataOwnerID = @DataOwnerID)
		
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartsDataTypes
		WHERE (ChartID = @ChartID) AND (DataOwnerID = @DataOwnerID)
		
		IF @Count >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableChartsDataTypes (ChartID, ElementID, DataOwnerID)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES (@ChartID, @ElementID, @DataOwnerID)
			
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChartSet] 
	@Name NCHAR(100),
	@CellWidth INT, 
	@CellHeight INT,
	@Rows INT,
	@Cols INT,
	@Margin INT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @MAXID BIGINT
	DECLARE @Count BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID) FROM TableChartSet
	WHERE Name = @Name AND CellWidth = @CellWidth AND CellHeight = @CellHeight AND Rows = @Rows AND 
		Cols = @Cols AND Margin = @Margin AND DataOwnerID = @DataOwnerID
		
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartSet
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count < 10
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableChartSet (Name, CellWidth, CellHeight, Rows, Cols, Margin, DataOwnerID)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES (@Name, @CellWidth, @CellHeight, @Rows, @Cols, @Margin, @DataOwnerID)
			SELECT MAX(ID) FROM @IDs
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChartSetsCharts] 
	@ChartSetID BIGINT,
	@ChartID BIGINT,
	@ColIndex BIGINT,
	@RowIndex BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*)
	FROM TableChartSetsCharts
	WHERE ChartSetID = @ChartSetID AND ChartID = @ChartID AND DataOwnerID = @DataOwnerID
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartSetsCharts
		WHERE ChartSetID = @ChartSetID AND DataOwnerID = @DataOwnerID
		
		IF @Count < 10
		BEGIN
			INSERT INTO TableChartSetsCharts (ChartSetID, ChartID, ColIndex, RowIndex, DataOwnerID)
			VALUES (@ChartSetID, @ChartID, @ColIndex, @RowIndex, @DataOwnerID)
			SELECT 1
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		EXEC UpdateChartSetsCharts @ChartSetID, @ChartID, @ColIndex, @RowIndex, @DataOwnerID
		SELECT 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddChartWrapper]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddChartWrapper] 
	@Name NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataOwnerID UNIQUEIDENTIFIER, 
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10),
	@ChartID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Charts TABLE(ID BIGINT NOT NULL)
	INSERT INTO @Charts
	-- Does not check attributes for uniqueness.
	EXEC AddChartInternal @Name, @Width, @Height, @DataOwnerID, @DataSetType, @DataSetMaxCount, @ChartType

	SET	@ChartID = (SELECT TOP(1) ID FROM @Charts)
END

GO
/****** Object:  StoredProcedure [dbo].[AddCity]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCity]
	@City NCHAR(20),
	@StateID BIGINT,
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
	FROM TableCity
	WHERE City = @City AND StateID = @StateID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableCity
		WHERE @DataOwnerID = DataOwnerID
		IF @COUNT >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- inserts new city
			INSERT INTO TableCity (City, DataOwnerID, StateID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@City, @DataOwnerID, @StateID)

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
/****** Object:  StoredProcedure [dbo].[AddCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMAttribute] 
	@COSEMClassID BIGINT, 
	@Dynamic BIT,
	@Name NCHAR(100),
	@COSEMDataTypeID BIGINT,
	@MinValue FLOAT,
	@MaxValue FLOAT,
	@DefValue FLOAT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Standard BIT = 0
	SELECT @Standard = Standard 
	FROM TableCOSEMClass
	WHERE ID = @COSEMClassID
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableCOSEMAttribute
	WHERE COSEMClassID = @COSEMClassID AND Dynamic = @Dynamic AND Name = @Name AND 
		COSEMDataTypeID = @COSEMDataTypeID AND MinValue = @MinValue AND MaxValue = @MaxValue AND 
		DefValue = @DefValue AND DataOwnerID = @DataOwnerID AND Standard = @Standard

	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableCOSEMAttribute
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMAttribute 
				(COSEMClassID, Dynamic, Name, COSEMDataTypeID, MinValue, MaxValue, DefValue, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@COSEMClassID, @Dynamic, @Name, @COSEMDataTypeID, @MinValue, @MaxValue, @DefValue, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMClass] 
	@ClassName NCHAR(100),
	@CardinalityMin INT,
	@CardinalityMax INT,
	@COSEMClassID INT,
	@Version NCHAR(10),
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID) FROM TableCOSEMClass
	WHERE ClassName = @ClassName AND CardinalityMin = @CardinalityMin AND 
		CardinalityMax = @CardinalityMax AND COSEMClassID = @COSEMClassID AND 
		Version = @Version AND DataOwnerID = @DataOwnerID AND Standard = @Standard
		
	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableCOSEMClass
		WHERE DataOwnerID = @DataOwnerID
		
		DECLARE @SameNameCount BIGINT
		SELECT @SameNameCount = COUNT(*) 
		FROM TableCOSEMClass
		WHERE ClassName LIKE RTRIM(@ClassName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @UniqClassName NVARCHAR(100)
			SET @UniqClassName = @ClassName
			
			IF @SameNameCount > 0
			BEGIN
				SET @UniqClassName = RTRIM(@UniqClassName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
			END
		
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMClass 
				(ClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@UniqClassName, @CardinalityMin, @CardinalityMax, @COSEMClassID, @Version, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		-- there is exactly such class already
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMComplexTypeField] 
	@Name NCHAR(20),
	@AggregateTypeID BIGINT,
	@TypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableCOSEMComplexTypeField
	WHERE Name = @Name AND AggregateTypeID = @AggregateTypeID AND 
		TypeID = @TypeID AND DataOwnerID = @DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMComplexTypeField
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMComplexTypeField 
				(Name, AggregateTypeID, TypeID, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@Name, @AggregateTypeID, @TypeID, @DataOwnerID, @Standard)
				
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2001
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMDataType] 
	@Name NCHAR(20), 
	@AncestorTypeID BIGINT,
	@ItemBitSize BIGINT,
	@ItemCount BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableCOSEMDataType
	WHERE Name = @Name AND AncestorTypeID = @AncestorTypeID AND ItemBitSize = @ItemBitSize AND 
		ItemCount = @ItemCount AND DataOwnerID = @DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMDataType
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMDataType 
				(Name, AncestorTypeID, ItemBitSize, ItemCount, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@Name, @AncestorTypeID, @ItemBitSize, @ItemCount, @DataOwnerID, @Standard)
			
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMLogicalDevice] 
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DeviceTypeDataOwnerID UNIQUEIDENTIFIER
	SELECT @DeviceTypeDataOwnerID = DataOwnerID FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	
	IF @DeviceTypeDataOwnerID = @DataOwnerID
	BEGIN
		DECLARE @Max BIGINT
		SELECT @Max = MAX(SeqNum)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
		
		IF @Max IS NULL
		BEGIN
			SET @Max = 0
		END
		
		DECLARE @Count BIGINT
		DECLARE @MAXID BIGINT
		SELECT @Count = COUNT(*), @MAXID = MAX(ID)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID AND DataOwnerID = @DataOwnerID
			AND Name = @Name

		IF @Count = 0
		BEGIN	
			SELECT @Count = COUNT(*) FROM TableCOSEMLogicalDevice
			WHERE DataOwnerID = @DataOwnerID
			
			IF @Count >= 1000
			BEGIN
				SELECT -1
			END
			ELSE
			BEGIN
				DECLARE @IDs TABLE (ID BIGINT)
				INSERT INTO TableCOSEMLogicalDevice (DeviceTypeID, DataOwnerID, Name, SeqNum)
				OUTPUT INSERTED.ID INTO @IDs
				VALUES (@DeviceTypeID, @DataOwnerID, @Name, @Max + 1)
				SELECT MAX(ID) FROM TableCOSEMLogicalDevice			
			END
		END
		ELSE
		BEGIN
			SELECT @MAXID
		END
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMMethod] 
	@COSEMClassID BIGINT,
	@Name NCHAR(100),
	@Mandatory BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Standard BIT = 0
	SELECT @Standard = Standard 
	FROM TableCOSEMClass
	WHERE ID = @COSEMClassID
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID) 
	FROM TableCOSEMMethod
	WHERE COSEMClassID = @COSEMClassID AND Name = @Name AND Mandatory = @Mandatory AND 
		DataOwnerID = DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMMethod
		WHERE DataOwnerID = @DataOwnerID

		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMMethod 
				(COSEMClassID, Name, Mandatory, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@COSEMClassID, @Name, @Mandatory, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCOSEMObject] 
	@COSEMLogicalDeviceID BIGINT,
	@COSEMClassID BIGINT,
	@DeviceTypeID BIGINT,
	@COSEMLogicalName NCHAR(20),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	DECLARE @LogicalDeviceDataOwnerID UNIQUEIDENTIFIER
	SELECT @LogicalDeviceDataOwnerID = DataOwnerID
	FROM TableCOSEMLogicalDevice
	WHERE ID = @COSEMLogicalDeviceID
	
	IF @DataOwnerID = @LogicalDeviceDataOwnerID
	BEGIN
		SELECT @Count = COUNT(*), @MAXID = MAX(ID)
		FROM TableCOSEMObject
		WHERE COSEMLogicalDeviceID = @COSEMLogicalDeviceID AND COSEMClassID = @COSEMClassID AND 
			DeviceTypeID = @DeviceTypeID AND COSEMLogicalName = @COSEMLogicalName AND 
			DataOwnerID = @DataOwnerID

		IF @Count = 0
		BEGIN
			SELECT @Count = COUNT(*) FROM TableCOSEMObject
			WHERE DataOwnerID = @DataOwnerID

			IF @Count >= 1000
			BEGIN
				SELECT -2
			END
			ELSE
			BEGIN
				DECLARE @IDs TABLE (ID BIGINT)
				INSERT INTO TableCOSEMObject (COSEMLogicalDeviceID, COSEMClassID, DeviceTypeID, COSEMLogicalName, DataOwnerID)
				OUTPUT INSERTED.ID INTO @IDs
				VALUES (@COSEMLogicalDeviceID, @COSEMClassID, @DeviceTypeID, @COSEMLogicalName, @DataOwnerID)
				SELECT MAX(ID) FROM @IDs
			END
		END
		ELSE
		BEGIN		
			SELECT @MAXID
		END
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddCountry]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddCountry]
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
/****** Object:  StoredProcedure [dbo].[AddDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 03/08/2011
-- Description:	The procedure adds new device to device group.
-- =============================================
CREATE PROCEDURE [dbo].[AddDevice] 
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableDevice
	WHERE Name = @Name AND InternalAddress = @InternalAddress AND 
		AddressType = @AddressType AND Port = @Port AND 
		GroupID = @GroupID AND TypeID = @TypeID AND OwnerID = @OwnerID AND 
		IP1 = @IP1 AND IP2 = @IP2 AND IP3 = @IP3 AND IP4 = @IP4 AND
		SecondaryPort = @SecondaryPort AND SecondaryIP1 = @SecondaryIP1 AND 
		SecondaryIP2 = @SecondaryIP2 AND SecondaryIP3 = @SecondaryIP3 AND SecondaryIP4 = @SecondaryIP4 AND
		DataOwnerID = @DataOwnerID AND LocationAddressID = @LocationAddressID AND SaveSessions = @SaveSessions 

	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableDevice
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			EXEC AddDeviceInternal @Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID,
				@OwnerID, @IP1, @IP2, @IP3,	@IP4, @SecondaryPort, @SecondaryIP1, @SecondaryIP2,	@SecondaryIP3, @SecondaryIP4, 
				@DataOwnerID, @LocationAddressID, @SaveSessions
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceInternal]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 27/05/2013
-- Description:	The procedure adds new device to device group.
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceInternal]
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @InsertedID TABLE (ID BIGINT)
	
	INSERT INTO TableDevice (Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID, IP1, IP2, IP3, IP4,
		SecondaryPort, SecondaryIP1, SecondaryIP2, SecondaryIP3, SecondaryIP4, DataOwnerID, LocationAddressID, SaveSessions)
	OUTPUT INSERTED.ID INTO @InsertedID
	VALUES (@Name, @InternalAddress, @AddressType,
		@Port, @GroupID, @TypeID, @OwnerID, @IP1, @IP2, @IP3, @IP4,
		@SecondaryPort, @SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions)
		
	SELECT MAX(ID) FROM @InsertedID
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceInternal2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		D.Morozov
-- Create date: 21/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceInternal2]
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	@Domain NCHAR(30) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @InsertedID TABLE (ID BIGINT)
	
	INSERT INTO TableDevice (Name, InternalAddress, AddressType,
		Port, GroupID, TypeID, OwnerID, IP1, IP2, IP3, IP4,
		SecondaryPort, SecondaryIP1, SecondaryIP2, SecondaryIP3, SecondaryIP4, DataOwnerID, LocationAddressID, SaveSessions, Domain)
	OUTPUT INSERTED.ID INTO @InsertedID
	VALUES (@Name, @InternalAddress, @AddressType,
		@Port, @GroupID, @TypeID, @OwnerID, @IP1, @IP2, @IP3, @IP4,
		@SecondaryPort, @SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions, @Domain)
		
	SELECT MAX(ID) FROM @InsertedID
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	The procedure adds device owner with accociated address.
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceOwner] 
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
/****** Object:  StoredProcedure [dbo].[AddDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceType] 
	@Description NCHAR(100), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableDeviceType

	IF @Count < 10
	BEGIN
		INSERT INTO TableDeviceType (Description, DataOwnerID, Standard)
		VALUES (@Description, @DataOwnerID, @Standard)
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceWithAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/10/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceWithAddress] 
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 

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
	DECLARE @DeviceIDs TABLE (ID BIGINT)	
	-- AddAddress code is here because MSSQLServer is not
	-- capable to perform nested INSERT EXECUTE calls
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

	BEGIN TRY
		-- subsequent calls can raise an exception, so general handling was added
		-- https://www.evernote.com/shard/s132/nl/14501366/51db755d-a500-4329-a231-7264d343672b
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
		ELSE
		BEGIN
			DECLARE @InsertedID TABLE (ID BIGINT)	
			DECLARE @COUNT BIGINT
			DECLARE @MAXID BIGINT
		
			SELECT @COUNT = COUNT(*) FROM TableAddress
			WHERE DataOwnerID = @DataOwnerID
		
			IF @COUNT >= 10
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
					-- adds new address
					INSERT INTO TableAddress (ZipCodeID, CountryID, StateID, CityID, StreetID, BuildingID, ApartamentID, DataOwnerID)
					OUTPUT INSERTED.ID INTO @InsertedID	
					VALUES (@ZipCodeID, @CountryID, @StateID, @CityID, @StreetID, @BuildingID, @ApartamentID, @DataOwnerID)

					SELECT @AddressID = MAX(ID) FROM @InsertedID		
				END
				ELSE
				BEGIN	
					SELECT @AddressID = @MAXID
				END
			
				DECLARE @DeviceID BIGINT
						
				INSERT @DeviceIDs
				EXECUTE AddDevice @Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID, @OwnerID,
					@IP1, @IP2, @IP3, @IP4, @SecondaryPort, 
					@SecondaryIP1, @SecondaryIP2, @SecondaryIP3, @SecondaryIP4, @DataOwnerID, @AddressID

				SELECT @DeviceID = MAX(ID) FROM @DeviceIDs
				IF @DeviceID = -1
				BEGIN
					ROLLBACK
					SELECT -1
				END
				ELSE
				BEGIN
					COMMIT
					SELECT @DeviceID
				END
			END 
		END
	END TRY
	BEGIN CATCH
		ROLLBACK
		SELECT -1
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceWrapper]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceWrapper] 
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	@DeviceID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Devices TABLE(ID BIGINT NOT NULL)
	INSERT INTO @Devices 
	EXEC AddDeviceInternal
		@Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID, @OwnerID,
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3,
		@SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions
		
	SET	@DeviceID = (SELECT TOP(1) ID FROM @Devices)
END

GO
/****** Object:  StoredProcedure [dbo].[AddDeviceWrapper2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.V.Morozov
-- Create date: 20/01/2014
-- Description:	evernote:///view/14501366/s132/2cad8731-3f89-4eea-b1b6-806dfca9bb24/2cad8731-3f89-4eea-b1b6-806dfca9bb24/
-- =============================================
CREATE PROCEDURE [dbo].[AddDeviceWrapper2]
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@LocationAddressID BIGINT,
	@SaveSessions BIT = 0,
	@Domain NCHAR(30) = NULL, 
	@DeviceID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Devices TABLE(ID BIGINT NOT NULL)
	INSERT INTO @Devices 
	EXEC AddDeviceInternal2
		@Name, @InternalAddress, @AddressType, @Port, @GroupID, @TypeID, @OwnerID,
		@IP1, @IP2,	@IP3, @IP4,	@SecondaryPort,	@SecondaryIP1, @SecondaryIP2, @SecondaryIP3,
		@SecondaryIP4, @DataOwnerID, @LocationAddressID, @SaveSessions, @Domain
		
	SET	@DeviceID = (SELECT TOP(1) ID FROM @Devices)
END

GO
/****** Object:  StoredProcedure [dbo].[AddElementToChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 23/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddElementToChart] 
	@ElementID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableChartsDataTypes
	WHERE @ChartID = ChartID AND @DataOwnerID = DataOwnerID
	
	IF @Count < 10
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartsDataTypes
		WHERE @ChartID = ChartID AND @ElementID = ElementID AND 
			@DataOwnerID = DataOwnerID
			
		IF @Count = 0
		BEGIN
			EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
			
			SELECT 1
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddElementToChartInternal]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 27/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddElementToChartInternal] 
	@ElementID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	INSERT INTO TableChartsDataTypes (ChartID, ElementID, DataOwnerID)
	VALUES (@ChartID, @ElementID, @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[AddGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 02/08/2011
-- Description:	The procedure adds new device group.
-- =============================================
CREATE PROCEDURE [dbo].[AddGroup]
	@Name NCHAR(100), 
	@DeviceNamePrefix NCHAR(10),
	@StartingIP1 NCHAR(3),
	@StartingIP2 NCHAR(3),
	@StartingIP3 NCHAR(3),
	@StartingIP4 NCHAR(3),
	@EndingIP1 NCHAR(3),
	@EndingIP2 NCHAR(3),
	@EndingIP3 NCHAR(3),
	@EndingIP4 NCHAR(3),
	@SecondaryStartingIP1 NCHAR(3),
	@SecondaryStartingIP2 NCHAR(3),
	@SecondaryStartingIP3 NCHAR(3),
	@SecondaryStartingIP4 NCHAR(3),
	@StartingIPPort CHAR(5),
	@EndingIPPort CHAR(5),
	@SecondaryStartingIPPort CHAR(5),
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER --,
	--@GroupID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableGroup WHERE DataOwnerID = @DataOwnerID
	
	IF @Count < 10
	BEGIN
		DECLARE @InsertedID TABLE (ID BIGINT)

		INSERT INTO TableGroup(Name, DeviceNamePrefix, 
			StartingIP1, StartingIP2, StartingIP3, StartingIP4,
			EndingIP1, EndingIP2, EndingIP3, EndingIP4,
			SecondaryStartingIP1, SecondaryStartingIP2, SecondaryStartingIP3, SecondaryStartingIP4,
			StartingIPPort, EndingIPPort, SecondaryStartingIPPort,
			DeviceTypeID, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, DataOwnerID)
		OUTPUT INSERTED.ID INTO @InsertedID
		VALUES (@Name, @DeviceNamePrefix, 
			@StartingIP1, @StartingIP2, @StartingIP3, @StartingIP4,
			@EndingIP1, @EndingIP2, @EndingIP3, @EndingIP4,
			@SecondaryStartingIP1, @SecondaryStartingIP2, @SecondaryStartingIP3, @SecondaryStartingIP4,
			@StartingIPPort, @EndingIPPort, @SecondaryStartingIPPort,
			@DeviceTypeID, 0, 0, 0, 0, 0, 0, 0, @DataOwnerID)
			
		--SELECT @GroupID = ID FROM @InsertedID
		SELECT MAX(ID) FROM @InsertedID
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddMessageToAppLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 16/11/2013
-- Description:	Adds a messge to the application log.
-- =============================================
CREATE PROCEDURE [dbo].[AddMessageToAppLog] 
	@Message NVARCHAR(1000) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @MaxAppLog INT 
    SET @MaxAppLog = (SELECT MaxAppLog FROM GetCurrentAppConfig())
	IF @MaxAppLog IS NULL SET @MaxAppLog = 100
	
	INSERT INTO TableAppLog (Message, ServerTimeStamp)
	VALUES (@Message, GETDATE())
	
	DECLARE @Count BIGINT
	SET @Count = (SELECT COUNT(*) FROM TableAppLog)
	
	IF @Count > @MaxAppLog
	BEGIN
		--	Deletes the oldest rows.
		--  evernote:///view/14501366/s132/93383680-d5b6-4549-b8e9-2d68da10e46b/93383680-d5b6-4549-b8e9-2d68da10e46b/
		DELETE FROM TableAppLog
		WHERE ID IN (SELECT TOP(@Count - @MaxAppLog) ID FROM TableAppLog ORDER BY ID)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddMessageToProcessLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddMessageToProcessLog] 
	@ContentsID BIGINT,
	@Message NCHAR(100),
	@MessageTimestamp DATETIME2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableProcessLogMessages

	IF @Count >= 10000
	BEGIN
		DELETE FROM TableProcessLogMessages
		WHERE ID IN (
			SELECT TOP(10) ID FROM TableProcessLogMessages
			ORDER BY ServerTimestamp ASC
			)
	END
		
	INSERT INTO TableProcessLogMessages (ContentsID, Message, MessageTimestamp, ServerTimestamp)
	VALUES (@ContentsID, @Message, @MessageTimestamp, SYSDATETIME())
END

GO
/****** Object:  StoredProcedure [dbo].[AddOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	The procedure adds new record to TableOBISGroup and its relations.
-- =============================================
CREATE PROCEDURE [dbo].[AddOBISGroup] 
	@Type CHAR(1), 
	@Value TINYINT,
	@Description NCHAR(50),
	@Standard BIT,
	@Reserved BIT,
	@Unusable BIT,
	@Context BIT,
	@DeviceTypeID BIGINT = NULL,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableOBISGroup
	WHERE DataOwnerID = @DataOwnerID
	
	IF @Count < 1000
	BEGIN
		BEGIN TRANSACTION
		DECLARE @InsertedID TABLE (ID BIGINT)
		
		INSERT INTO TableOBISGroup (Type, Value, Description, Standard, Reserved, Unusable, Context, DataOwnerID) 
		OUTPUT INSERTED.ID INTO @InsertedID
		VALUES (@Type, @Value, @Description, @Standard, @Reserved, @Unusable, @Context, @DataOwnerID)
		
		DECLARE @OBISGroupID BIGINT
		-- Извлекается идентификатор последней записи
		SELECT @OBISGroupID = MAX(ID) FROM @InsertedID
		
		IF (@Standard > 0) 
		BEGIN
			-- Добавляется ассоциация со всеми известными на данный момент устройствами
			INSERT INTO TableDeviceOBISGroup (DeviceTypeID, OBISGroupID, DataOwnerID)
				SELECT ID, @OBISGroupID, @DataOwnerID
				FROM TableDeviceType
		END
		ELSE
		BEGIN
			-- Добавляется ассоциация с заданным устройством
			INSERT INTO TableDeviceOBISGroup (DeviceTypeID, OBISGroupID, DataOwnerID)
			VALUES (@DeviceTypeID, @OBISGroupID, @DataOwnerID)
		END
		COMMIT
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddOBISSet] 
	@AID BIGINT,
	@BID BIGINT,
	@CID BIGINT,
	@DID BIGINT,
	@EID BIGINT,
	@FID BIGINT,
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableOBISSet
	WHERE DataOwnerID = @DataOwnerID

	IF @Count < 1000
	BEGIN
		INSERT INTO TableOBISSet 
			(AID, BID, CID, DID, EID, FID, DeviceTypeID, DataOwnerID, Standard)
		VALUES 
			(@AID, @BID, @CID, @DID, @EID, @FID, @DeviceTypeID, @DataOwnerID, @Standard)
		
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddState]
	@State NCHAR(20),
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
	FROM TableState
	WHERE State = @State AND CountryID = @CountryID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableState
		WHERE DataOwnerID = @DataOwnerID
		IF @COUNT < 10
		BEGIN
			-- inserts new state
			INSERT INTO TableState (State, DataOwnerID, CountryID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@State, @DataOwnerID, @CountryID)

			SELECT MAX(ID) FROM @InsertedID		
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		-- returns existing identifier
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddStreet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddStreet]
	@Street NCHAR(20),
	@CityID BIGINT,
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
	FROM TableStreet
	WHERE Street = @Street AND CityID = @CityID AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		SELECT @COUNT = COUNT(*) FROM TableStreet
		WHERE DataOwnerID = @DataOwnerID
		IF @COUNT < 10
		BEGIN
			-- inserts new street
			INSERT INTO TableStreet (Street, DataOwnerID, CityID)
			OUTPUT INSERTED.ID INTO @InsertedID	
			VALUES (@Street, @DataOwnerID, @CityID)

			SELECT MAX(ID) FROM @InsertedID		
		END
		ELSE 
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		-- returns existing identifier
		SELECT @MAXID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[AddZipCode]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddZipCode]
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
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[BreakOperation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 04/11/13
-- Description:	evernote:///view/14501366/s132/801860a7-af6f-4924-8da6-5542ad26321b/801860a7-af6f-4924-8da6-5542ad26321b/
-- =============================================
CREATE PROCEDURE [dbo].[BreakOperation]
	@OperationID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
	UPDATE TableCurrentStateOperation
	SET FinishedSuccessfully = 0, OperationInProgress = 0
	WHERE OperationID = @OperationID
END

GO
/****** Object:  StoredProcedure [dbo].[CheckOBISGroupDevices]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	Определяет, связаны ли типы устройств с данной OBIS-группой.
-- =============================================
CREATE PROCEDURE [dbo].[CheckOBISGroupDevices] 
	-- Add the parameters for the stored procedure here
	@OBISGroupID bigint = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Description, ID,
	CONVERT(BIT, (SELECT COUNT(*) FROM TableDeviceOBISGroup WHERE DeviceTypeID=ID AND OBISGroupID=@OBISGroupID)) AS Checked
	FROM TableDeviceType
END

GO
/****** Object:  StoredProcedure [dbo].[CopyCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/01/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CopyCOSEMAttribute] 
	@OldAttributeID BIGINT,
	@NewCOSEMClassID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TableCOSEMAttribute (COSEMClassID, Dynamic, Name, 
		COSEMDataTypeID, MinValue, MaxValue, DefValue, DataOwnerID, Standard)
	SELECT @NewCOSEMClassID, Dynamic, Name, 
		COSEMDataTypeID, MinValue, MaxValue, DefValue, @DataOwnerID, 0
	FROM TableCOSEMAttribute
	WHERE ID = @OldAttributeID
END

GO
/****** Object:  StoredProcedure [dbo].[CopyCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CopyCOSEMClass] 
	@OldClassID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@NewClassID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	
	DECLARE @ClassName NVARCHAR(MAX)
	SELECT @ClassName = ClassName
	FROM TableCOSEMClass
	WHERE ID = @OldClassID

	DECLARE @SameNameCount BIGINT
	SELECT @SameNameCount = COUNT(*) 
	FROM TableCOSEMClass
	WHERE ClassName LIKE RTRIM(@ClassName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)
	
	DECLARE @UniqClassName NVARCHAR(100)
	SET @UniqClassName = @ClassName
	
	IF @SameNameCount > 0
	BEGIN
		SELECT @UniqClassName = RTRIM(@UniqClassName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
	END
		
	DECLARE @IDs TABLE (ID BIGINT)
	INSERT INTO TableCOSEMClass 
		(ClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, DataOwnerID, Standard)
	OUTPUT INSERTED.ID INTO @IDs
	SELECT @UniqClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, @DataOwnerID, 0
	FROM TableCOSEMClass
	WHERE ID = @OldClassID
	
	DECLARE @NewCOSEMClassID BIGINT
	SELECT @NewCOSEMClassID = MAX(ID) FROM @IDs
	SELECT @NewClassID = @NewCOSEMClassID
	
	DECLARE @AttributeIDs TABLE (ID BIGINT)
	INSERT INTO @AttributeIDs 
	SELECT ID FROM TableCOSEMAttribute
	WHERE COSEMClassID = @OldClassID
	
	DECLARE @Cursor CURSOR, @OldAttributeID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM @AttributeIDs
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldAttributeID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMAttribute @OldAttributeID, @NewCOSEMClassID, @DataOwnerID
	END	
	
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[CopyCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/01/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CopyCOSEMLogicalDevice] 
	@OldLogicalDeviceID BIGINT,
	@NewDeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION

	DECLARE @LogicalDeviceIDs TABLE (ID BIGINT)

	INSERT INTO TableCOSEMLogicalDevice (DeviceTypeID, DataOwnerID, Name, SeqNum)
	OUTPUT INSERTED.ID INTO @LogicalDeviceIDs	
	SELECT @NewDeviceTypeID, @DataOwnerID, Name, SeqNum
	FROM TableCOSEMLogicalDevice
	WHERE ID = @OldLogicalDeviceID
	
	DECLARE @NewLogicalDeviceID BIGINT
	SELECT @NewLogicalDeviceID = MAX(ID) FROM @LogicalDeviceIDs
	
	DECLARE @Cursor CURSOR, @OldCOSEMObjectID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM TableCOSEMObject
		WHERE COSEMLogicalDeviceID = @OldLogicalDeviceID
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldCOSEMObjectID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMObject @OldCOSEMObjectID,	@NewLogicalDeviceID, @NewDeviceTypeID, @DataOwnerID
	END	
	
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[CopyCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CopyCOSEMObject] 
	@OldObjectID BIGINT,
	@NewCOSEMLogicalDeviceID BIGINT,
	@NewDeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	
	DECLARE @OldClassID BIGINT
	DECLARE @NewClassID BIGINT
	
	SELECT @OldClassID = COSEMClassID FROM TableCOSEMObject
	WHERE ID = @OldObjectID -- check of DataOwnerID is forbidden
	-- the procedure creates new class instantion and its attributes
	EXEC CopyCOSEMClass @OldClassID, @DataOwnerID, @NewClassID OUTPUT
	
	-- creating new object instance
	DECLARE @IDs TABLE (ID BIGINT)
	INSERT INTO TableCOSEMObject 
		(COSEMLogicalDeviceID, COSEMClassID, DeviceTypeID, COSEMLogicalName, DataOwnerID)
	OUTPUT INSERTED.ID INTO @IDs
	SELECT @NewCOSEMLogicalDeviceID, @NewClassID, @NewDeviceTypeID, COSEMLogicalName, @DataOwnerID
	FROM TableCOSEMObject
	WHERE ID = @OldObjectID
	
	DECLARE @NewObjectID BIGINT
	SET @NewObjectID = (SELECT MAX(ID) FROM @IDs)
	
	-- copying attribute-object identifiers
	DECLARE @Cursor CURSOR, @NewAttributeID BIGINT, @AttrName NVARCHAR(MAX)
	SET @Cursor = CURSOR FOR 
		SELECT ID, Name
		FROM TableCOSEMAttribute
		WHERE COSEMClassID = @NewClassID AND DataOwnerID = @DataOwnerID
	OPEN @Cursor

	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @NewAttributeID, @AttrName
		IF @@fetch_status <> 0 BREAK
		
		INSERT INTO TableDataType (Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID)
		SELECT @AttrName, @NewAttributeID, @NewObjectID, @DataOwnerID
	END		
	
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[CopyDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CopyDataType] 
	@OldDataTypeID BIGINT,
	@NewCOSEMAttributeID BIGINT,
	@NewCOSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TableDataType (Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID)
	SELECT Identifier, @NewCOSEMAttributeID, @NewCOSEMObjectID, @DataOwnerID
	FROM TableDataType
	WHERE ID = @OldDataTypeID
END

GO
/****** Object:  StoredProcedure [dbo].[CreateCustomDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/01/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CreateCustomDeviceType] 
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	
	-- create unique device type name
	DECLARE @UniqName NVARCHAR(MAX)
	SELECT @UniqName = Description
	FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	SET @UniqName = 'Custom ' + @UniqName

	DECLARE @SameNameCount BIGINT
	SELECT @SameNameCount = COUNT(*) 
	FROM TableDeviceType
	WHERE Description LIKE RTRIM(@UniqName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)

	IF @SameNameCount > 0
	BEGIN
		SET @UniqName = RTRIM(@UniqName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
	END

	DECLARE @DeviceTypeIDs TABLE (ID BIGINT)
	
	INSERT INTO TableDeviceType (Description, DataOwnerID, Standard)
	OUTPUT INSERTED.ID INTO @DeviceTypeIDs
	SELECT @UniqName, @DataOwnerID, Standard
	FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	
	DECLARE @NewDeviceTypeID BIGINT
	SET @NewDeviceTypeID = (SELECT MAX(ID) FROM @DeviceTypeIDs)
	
	DECLARE @Cursor CURSOR, @OldLogicalDeviceID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldLogicalDeviceID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMLogicalDevice @OldLogicalDeviceID, @NewDeviceTypeID, @DataOwnerID
	END		
		
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[CreateProcessLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CreateProcessLog] 
	@PID BIGINT, 
	@CmdLine NCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @InsertedID TABLE (ID BIGINT)

    INSERT INTO TableProcessLogContents (PID, CmdLine)
    OUTPUT INSERTED.ID INTO @InsertedID
    VALUES (@PID, @CmdLine)
    
	SELECT ID FROM @InsertedID
END

GO
/****** Object:  StoredProcedure [dbo].[CreateTempTableForValueVsTime]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[CreateTempTableForValueVsTime] 
	@Name NVARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UniqName NVARCHAR(MAX)
	EXEC GetUniqName @UniqName OUTPUT
	
	SET @Name = '##TableDataSet_' + @UniqName

	DECLARE @Sql NVARCHAR(200)
	SET @Sql = 'CREATE TABLE ' + RTRIM(@Name) + ' (Time FLOAT, Value DECIMAL(19, 6), ElementID BIGINT, OriginalAcqTime DATETIME2(7))'
	EXEC(@Sql)
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 25/09/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAddress] 
	@AddressID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableDevice
	SET LocationAddressID = NULL
	WHERE LocationAddressID = @AddressID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableDevice
	SET BillAddressID = NULL
	WHERE BillAddressID = @AddressID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableDeviceOwner
	SET AddressID = NULL
	WHERE AddressID = @AddressID AND  DataOwnerID = @DataOwnerID
	
	DELETE FROM TableAddress
	WHERE ID = @AddressID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAllAttrFromCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/07/11
-- Description:	The procedure deletes all attributes of
--				given object from collect list.
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAllAttrFromCollectList] 
	@DeviceID BIGINT, -- Physical device id
	@ObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCurrentState
	WHERE (DataOwnerID = @DataOwnerID) AND (DeviceID = @DeviceID) AND
			(DataTypeID IN (
				SELECT ID
				FROM ViewDataType
				WHERE (COSEMObjectID = @ObjectID) AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				))
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAllDeviceAttrFromCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure deletes all of physical
--				device attributes from collect list.
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAllDeviceAttrFromCollectList] 
	@DeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCurrentState
	WHERE (DataOwnerID = @DataOwnerID) AND (DeviceID = @DeviceID) AND
			(DataTypeID IN (
				SELECT ID FROM ViewDataType
				WHERE COSEMObjectID IN (
					SELECT ID FROM TableCOSEMObject
					WHERE COSEMLogicalDeviceID IN (
						SELECT ID FROM TableCOSEMLogicalDevice
						WHERE DeviceTypeID = (
							SELECT TypeID FROM TableDevice
							WHERE ID = @DeviceID
							)
						)
					)
					AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				)				
			)	
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAllObjectAttrFromCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/07/11
-- Description:	The procedure deletes all attributes
--				of each object of given logical device
--				to collect list.
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAllObjectAttrFromCollectList] 
	@DeviceID BIGINT,
	@LogicalDeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCurrentState
	WHERE (DataOwnerID = @DataOwnerID) AND (DeviceID = @DeviceID) AND
			(DataTypeID IN (
				SELECT ID FROM ViewDataType
				WHERE (COSEMObjectID IN (
					SELECT ID FROM TableCOSEMObject
					WHERE COSEMLogicalDeviceID = @LogicalDeviceID
					))
					AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				)				
			)	
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAllProcessLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAllProcessLog] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableProcessLogMessages
	WHERE 1=1
	
	DELETE FROM TableProcessLogContents
	WHERE 1=1
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAttrFromCollectList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D. Morozov
-- Create date: 13/07/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAttrFromCollectList] 
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    DELETE FROM TableCurrentState
	WHERE DataTypeID IN (
		SELECT ID
		FROM ViewDataType
		WHERE (COSEMAttributeID = @COSEMAttributeID) AND 
				(COSEMObjectID = @COSEMObjectID) AND 
				((DataOwnerID = @DataOwnerID) OR (Standard = 1)))
	AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteChart] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChart
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteChartsDataTypes]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteChartsDataTypes] 
	@ChartID BIGINT,
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChartsDataTypes
	WHERE (@ChartID = ChartID) AND (@ElementID = ElementID) 
		AND (@DataOwnerID = DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteChartSet] 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChartSet
	WHERE ID = @ChartSetID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteChartSetsCharts] 
	@ChartSetID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM TableChartSetsCharts
	WHERE (ChartSetID = @ChartSetID) AND (ChartID = @ChartID) 
		AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMAttribute] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableDataType WHERE COSEMAttributeID IN
		-- additional check for consistency
		(SELECT ID FROM TableCOSEMAttribute WHERE DataOwnerID = @DataOwnerID)
    DELETE FROM TableCOSEMAttribute WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMClass] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    -- we should not do anything here because record from TableDataType
    -- is deleted by cascade operation through TableCOSEMObject
    DELETE FROM TableCOSEMClass WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMComplexTypeField] 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCOSEMComplexTypeField
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMDataType] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableCOSEMComplexTypeField WHERE (TypeID = @ID OR AggregateTypeID = @ID) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMComplexTypeField WHERE (TypeID IN 
		(SELECT ID FROM TableCOSEMDataType WHERE AncestorTypeID = @ID)) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMComplexTypeField WHERE (AggregateTypeID IN 
		(SELECT ID FROM TableCOSEMDataType WHERE AncestorTypeID = @ID)) AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMDataType WHERE AncestorTypeID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMDataType WHERE ID = @ID AND DataOwnerID = @DataOwnerID	
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMLogicalDevice] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	DELETE FROM TableCOSEMObject WHERE COSEMLogicalDeviceID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMLogicalDevice WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMMethod] 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableCOSEMMethod
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCOSEMObject] 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM TableCOSEMObject WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDevice] 
	-- Add the parameters for the stored procedure here
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    -- All linked data are deleted by cascade operation.
    DELETE FROM TableDevice WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDeviceOwner] 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableDevice
	SET OwnerID = NULL
	WHERE OwnerID = @ID AND DataOwnerID = @DataOwnerID
	
	DELETE FROM TableDeviceOwner WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDeviceType] 
	-- Add the parameters for the stored procedure here
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	-- explicitly deletes objects because they can't be deleted by cascade operation;
	-- only owner can delete something
	DELETE FROM TableCOSEMObject WHERE DeviceTypeID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableDeviceType WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteElementFromChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 23/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteElementFromChart] 
	@ChartID BIGINT,
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableChartsDataTypes
	WHERE @ChartID = ChartID AND @ElementID = ElementID AND
		@DataOwnerID = DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteFiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 11/04/2014
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/9b13b017-204d-4dbc-9b38-a244e29a843f
-- =============================================
CREATE PROCEDURE [dbo].[DeleteFiles] 
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
/****** Object:  StoredProcedure [dbo].[DeleteGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D. Morozov
-- Create date: 16/05/11
-- Description:	The procedure deletes group and 
-- all associated devices
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGroup] 
	@GroupID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
	DELETE FROM TableGroup WHERE ID = @GroupID AND DataOwnerID = @DataOwnerID
	COMMIT
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	The procedure deletes OBIS group and its relations.
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOBISGroup] 
	-- Add the parameters for the stored procedure here
	@OBISGroupID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    DELETE FROM TableOBISSet WHERE ((AID = @OBISGroupID) OR (BID = @OBISGroupID) OR (CID = @OBISGroupID)
		OR (DID = @OBISGroupID) OR (EID = @OBISGroupID) OR (FID = @OBISGroupID))
		AND (DataOwnerID = @DataOwnerID)
    DELETE FROM TableOBISGroupLink WHERE ((OBISGroupID = @OBISGroupID) OR (TopLevelOBISGroupID = @OBISGroupID)) 
		AND (DataOwnerID = @DataOwnerID)
	DELETE FROM TableOBISGroup WHERE (ID = @OBISGroupID) AND (DataOwnerID = @DataOwnerID)
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOBISSet] 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableOBISSet
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProcessLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProcessLog] 
	@ContentsID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableProcessLogContents
	WHERE ID = @ContentsID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProcessLogRange]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProcessLogRange] 
	@StartContentsID BIGINT, 
	@EndContentsID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM TableProcessLogContents
	WHERE ID BETWEEN @StartContentsID AND @EndContentsID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteSerie]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 11/04/2014
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/9b13b017-204d-4dbc-9b38-a244e29a843f
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSerie] 
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
/****** Object:  StoredProcedure [dbo].[ExportValueVsTimeAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ExportValueVsTimeAsXML] 
	@TempTableName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- instead of file names the table contains XML data!
	DECLARE @FileNames TABLE (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	DECLARE @ElementIDs TABLE (ID BIGINT)
	DECLARE @Sql NVARCHAR(MAX)
	SET @Sql = 'SELECT DISTINCT ElementID FROM ' + @TempTableName
	INSERT @ElementIDs
	EXECUTE (@Sql)
	
	DECLARE @Cursor CURSOR, @ElementID BIGINT
	SET     @Cursor = CURSOR FOR 
		SELECT ID 
		FROM @ElementIDs
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @ElementID
		IF @@fetch_status <> 0 BREAK
		
		DECLARE @X XML
		DECLARE @Sql1 NVARCHAR(MAX)
		SET @Sql1 = 'SET @XmlDataOut = (SELECT CONVERT(DECIMAL(19, 9), Time) AS Time, Value, StringValue FROM ' + @TempTableName + ' WHERE ElementID = ' + 
			CONVERT(NVARCHAR(100), @ElementID) + ' FOR XML RAW(''DataPoint''), ELEMENTS)'
		EXECUTE sp_executesql @Sql1, N'@XmlDataOut XML OUTPUT', @XmlDataOut = @X OUTPUT	

		DECLARE @Str VARCHAR(MAX)
		SET @Str = '<DataSet>' + CONVERT(VARCHAR(MAX), @X) + '</DataSet>'
		
		INSERT INTO @FileNames
		VALUES (@Str, 'dataset')
	END
	
	INSERT INTO #file_names
	SELECT * FROM @FileNames
END

GO
/****** Object:  StoredProcedure [dbo].[ExportValueVsTimeStatAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ExportValueVsTimeStatAsXML] 
	@TempTableName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Sql NVARCHAR(300)
	
	DECLARE @TMax DATETIME2(7)
	DECLARE @TMin DATETIME2(7)
	SET @Sql = N'SELECT @Max = MAX(OriginalAcqTime), @Min = MIN(OriginalAcqTime) FROM ' + @TempTableName
	EXECUTE sp_executesql @Sql, N'@Max DATETIME2(7) OUTPUT, @Min DATETIME2(7) OUTPUT', @Max = @TMax OUTPUT, @Min = @TMin OUTPUT	
	
	DECLARE @Step INT
	DECLARE @Units NVARCHAR(20)
	DECLARE @Mult FLOAT
	
	EXEC GetTimeMult @TMax,	@TMin, @Step OUTPUT, @Units OUTPUT, @Mult OUTPUT

	DECLARE @X XML
	SET @Sql = N'SET @XmlDataOut = (SELECT MAX(Time) AS TMax, MIN(Time) AS TMin, MAX(Value) AS VMax, MIN(Value) AS VMin, MAX(OriginalAcqTime) AS OrigAcqTimeMax, MIN(OriginalAcqTime) AS OrigAcqTimeMin, @TU AS TimeUnits FROM ' + 
		@TempTableName + ' FOR XML RAW(''ChartDataStat''), ELEMENTS)'
	EXECUTE sp_executesql @Sql, N'@TU NVARCHAR(20), @XmlDataOut XML OUTPUT', @TU = @Units, @XmlDataOut = @X OUTPUT	

	DECLARE @Str VARCHAR(MAX)
	SET @Str = '<DataStat>' + CONVERT(VARCHAR(MAX), @X) + '</DataStat>'

	INSERT INTO #file_names
	SELECT @Str, 'datastat'
END

GO
/****** Object:  StoredProcedure [dbo].[ExportXMLTemplate]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ExportXMLTemplate] 
	@DeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @X XML

	SET @X = (
		SELECT Tag, Parent, 
			[device_type!1!name!Element], 
			[logical_device!2!name!Element],
			[logical_object!3!name!Element], 
			[attribute!4!name!Element], 
			[extended_register!6!value_identifier!Element], 
			[value!9!int_value!Element],
			[string_value!10],
			[status!11!int_status!Element],
			[units!7],	
			[capture_time!13!year!Element],
			[month!14],
			[day_of_month!15],
			[day_of_week!16],
			[hour!17],
			[minute!18],
			[second!19],
			[hundredths_of_second!20]
		FROM ViewXMLTemplate
		WHERE (DeviceID = @DeviceID OR DeviceID IS NULL) AND (DataOwnerID = @DataOwnerID)
		ORDER BY ID, SpID, DeviceID, DataOwnerID
		FOR XML EXPLICIT
		)

	DECLARE @Str VARCHAR(MAX)
	SET @Str = '<xml_template>' + CONVERT(VARCHAR(MAX), @X) + '</xml_template>'
	SELECT @Str
END
GO
/****** Object:  StoredProcedure [dbo].[GetChartElements]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 23/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetChartElements] 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ElementID FROM ViewChartsDataTypes
	WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetChartSetCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 05/01/12
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetChartSetCharts] 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewChartSetsCharts
	WHERE (ChartSetID = @ChartSetID OR ChartSetID IS NULL) AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[GetChartSetChartsExt]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/14
-- Description:	https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f
-- =============================================
CREATE PROCEDURE [dbo].[GetChartSetChartsExt] 
	@ChartSetID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewChartSetsChartsExt
	WHERE (ChartSetID = @ChartSetID OR ChartSetID IS NULL) AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[GetCompletedActions]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetCompletedActions] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM TableSchedule AS ts JOIN
		ViewDeviceScheduleParams AS v
		ON v.ID = ts.DeviceID
	WHERE Completed = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetDeviceIdentifiers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2011
-- Description:	The procedure returns data identifiers of given device.
-- =============================================
CREATE PROCEDURE [dbo].[GetDeviceIdentifiers] 
	@DeviceID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT RTRIM(Identifier) FROM TableCurrentState
	WHERE DeviceID = @DeviceID
END

GO
/****** Object:  StoredProcedure [dbo].[GetElementGroups]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetElementGroups] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewElementGroup
	WHERE DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetElementLocations]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetElementLocations] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewElementLocation
	WHERE DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetElementOwners]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetElementOwners]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewElementOwner
	WHERE DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetFilteredByDeviceTypeElements]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D. Morozov
-- Create date: 04/05/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetFilteredByDeviceTypeElements] 
	@DeviceDescription NVARCHAR(MAX),
	@OwnerID BIGINT,
	@GroupID BIGINT,
	@LocationID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER,
	@ChartID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @OwnerDeviceIDs TABLE (DeviceID BIGINT)
	IF @OwnerID IS NOT NULL
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE 
			(ID = @OwnerID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE (DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @LocationDeviceIDs TABLE (DeviceID BIGINT)
	IF @LocationID IS NOT NULL
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(LocationAddressID = @LocationID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @GroupDeviceIDs TABLE (DeviceID BIGINT)
	IF @GroupID IS NOT NULL
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(ID = @GroupID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	SELECT TOP(100) veln.ID, veln.FullName, @ChartID AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs)) AND
		(veln.DeviceDescription = @DeviceDescription)
	UNION
	SELECT TOP(100) veln.ID, veln.FullName, NULL AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE NOT EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs)) AND
		(veln.DeviceDescription = @DeviceDescription)
END

GO
/****** Object:  StoredProcedure [dbo].[GetFilteredElements]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 22/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetFilteredElements] 
	@ElementInstanceName NVARCHAR(MAX),
	@OwnerID BIGINT,
	@GroupID BIGINT,
	@LocationID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER,
	@ChartID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @OwnerDeviceIDs TABLE (DeviceID BIGINT)
	IF @OwnerID IS NOT NULL
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE 
			(ID = @OwnerID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @OwnerDeviceIDs 
		SELECT DeviceID FROM ViewElementOwner WHERE (DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @LocationDeviceIDs TABLE (DeviceID BIGINT)
	IF @LocationID IS NOT NULL
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(LocationAddressID = @LocationID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @LocationDeviceIDs
		SELECT DeviceID FROM ViewElementLocation WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @GroupDeviceIDs TABLE (DeviceID BIGINT)
	IF @GroupID IS NOT NULL
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(ID = @GroupID) AND (DataOwnerID = @DataOwnerID)
	END
	ELSE
	BEGIN
		INSERT INTO @GroupDeviceIDs
		SELECT DeviceID FROM ViewElementGroup WHERE 
			(DataOwnerID = @DataOwnerID)
	END
	
	DECLARE @ElementIDs TABLE (ID BIGINT)
	IF @ElementInstanceName IS NOT NULL
	BEGIN
		INSERT INTO @ElementIDs
		SELECT ID FROM ViewElementInstanceName WHERE
			(FullName = @ElementInstanceName) AND (DataOwnerID = @DataOwnerID)		
	END
	ELSE
	BEGIN
		INSERT INTO @ElementIDs
		SELECT ID FROM ViewElementInstanceName WHERE
			(DataOwnerID = @DataOwnerID)		
	END
	
	SELECT TOP(100) veln.ID, veln.FullName, @ChartID AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.ID IN (SELECT ID FROM @ElementIDs) OR NOT EXISTS (SELECT ID FROM @ElementIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs))
	UNION
	SELECT TOP(100) veln.ID, veln.FullName, NULL AS ChartID, 
		veln.GroupName, veln.DeviceName, veln.LogicalDevice, veln.LogicalObject, veln.Attribute,
		veln.Identifier, veln.Standard, veln.ValueIdentifier, veln.GroupID, veln.DeviceID, veln.DataOwnerID,
		veln.LogicalDeviceID, veln.ObjectID, veln.AttributeID, veln.DeviceDescription	
	FROM ViewElementInstanceName AS veln
	WHERE NOT EXISTS (SELECT ID FROM ViewChartsDataTypes WHERE ElementID = veln.ID AND ChartID = @ChartID) AND	
		(veln.ID IN (SELECT ID FROM @ElementIDs) OR NOT EXISTS (SELECT ID FROM @ElementIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @OwnerDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @OwnerDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @GroupDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @GroupDeviceIDs)) AND
		(veln.DeviceID IN (SELECT DeviceID FROM @LocationDeviceIDs) OR NOT EXISTS (SELECT veln.DeviceID FROM @LocationDeviceIDs))
END

GO
/****** Object:  StoredProcedure [dbo].[GetFirstSnapshot]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetFirstSnapshot] 
	@SerieID UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID
	ORDER BY CAST(Value AS BIGINT) ASC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END

GO
/****** Object:  StoredProcedure [dbo].[GetFirstSnapshotAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetFirstSnapshotAsXML] 
	@SerieID UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetFirstSnapshot @SerieID, @DataOwnerID

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetLastSnapshot]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLastSnapshot] 
	@SerieID UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID
	ORDER BY CAST(Value AS BIGINT) DESC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END

GO
/****** Object:  StoredProcedure [dbo].[GetLastSnapshotAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLastSnapshotAsXML] 
	@SerieID UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetLastSnapshot @SerieID, @DataOwnerID

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetLogicalDeviceName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLogicalDeviceName] 
	@DeviceTypeID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) 
	FROM TableCOSEMLogicalDevice
	WHERE DeviceTypeID = @DeviceTypeID
	
	IF @Count = 0
	BEGIN
		SELECT 'LD 1'
	END
	ELSE
	BEGIN
		DECLARE @Max BIGINT
		SELECT @Max = MAX(SeqNum)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
		
		SELECT 'LD ' + RTRIM(CONVERT(CHAR(20), @Max + 1))
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetNextSnapshot]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetNextSnapshot] 
	@SerieID UNIQUEIDENTIFIER,
	@SnapshotID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID AND CAST(Value AS BIGINT) > @SnapshotID
	ORDER BY CAST(Value AS BIGINT) ASC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END

GO
/****** Object:  StoredProcedure [dbo].[GetNextSnapshotAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetNextSnapshotAsXML] 
	@SerieID UNIQUEIDENTIFIER,
	@SnapshotID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetNextSnapshot @SerieID, @SnapshotID, @DataOwnerID

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetPointsVsAcqTime_Last]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetPointsVsAcqTime_Last] 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@LastPointCount BIGINT	-- number of last points
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetPointsVsAcqTimeDataset_Last @ChartID, @DataOwnerID, @LastPointCount

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetPointsVsAcqTime_Stat_Last]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetPointsVsAcqTime_Stat_Last] 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@LastPointCount BIGINT	-- number of last points
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
		
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetPointsVsAcqTimeDataset_Last @ChartID, @DataOwnerID, @LastPointCount

	-- these procedures fill #file_names
	EXEC ExportValueVsTimeAsXML '#value_vs_time'
	EXEC ExportValueVsTimeStatAsXML '#value_vs_time'
	
	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetPointsVsAcqTimeDataset_Last]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetPointsVsAcqTimeDataset_Last] 
(	
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@LastPointCount BIGINT	-- number of last points
)
AS
BEGIN 
	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	DECLARE @Cursor CURSOR, 
			@ElID BIGINT
			
	SET     @Cursor = CURSOR FOR 
		SELECT ElementID FROM TableChartsDataTypes
		WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
	OPEN @Cursor	
	
	DECLARE @ElementID BIGINT		

	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @ElementID
		IF @@fetch_status <> 0 BREAK
		
		IF @LastPointCount = 1
		BEGIN
			--	optimized variant
			INSERT INTO @T
			-- ElementID should be here because there may be a few elements assiciated with given chart
			SELECT AcquisitionTime, Value, @ElementID AS ElementID, StringValue
			FROM TableCurrentState
			WHERE DataOwnerID = @DataOwnerID AND ID = @ElementID
		END
		ELSE
		BEGIN
			INSERT INTO @T
			SELECT * FROM (
				-- ElementID should be here because there may be a few elements assiciated with given chart
				SELECT TOP(@LastPointCount) AcquisitionTime, Value, @ElementID AS ElementID, StringValue
				FROM TableDataPoint
				WHERE DataOwnerID = @DataOwnerID AND ElementID = @ElementID
				-- order to get "last" values
				ORDER BY AcquisitionTime DESC
				) AS t
			ORDER BY t.AcquisitionTime ASC
		END
	END
	
	DECLARE @TMax DATETIME2(7)
	DECLARE @TMin DATETIME2(7)
	SELECT @TMax = MAX(AcquisitionTime), @TMin = MIN(AcquisitionTime)
	FROM @T
	
	DECLARE @Step INT
	DECLARE @Units NVARCHAR(20)
	DECLARE @Mult FLOAT
	
	EXEC GetTimeMult @TMax,	@TMin, @Step OUTPUT, @Units OUTPUT, @Mult OUTPUT
	
	DECLARE @Offset FLOAT
	SET @Offset = CONVERT(FLOAT, CONVERT(DATETIME, @TMin))
	
	IF @Mult <> 0
	BEGIN
		SELECT CONVERT(FLOAT, (CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) - @Offset) / @Mult) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
	END
	ELSE
	BEGIN
		SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetPrevSnapshot]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetPrevSnapshot] 
	@SerieID UNIQUEIDENTIFIER,
	@SnapshotID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID AND CAST(Value AS BIGINT) < @SnapshotID
	ORDER BY CAST(Value AS BIGINT) ASC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END

GO
/****** Object:  StoredProcedure [dbo].[GetPrevSnapshotAsXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetPrevSnapshotAsXML] 
	@SerieID UNIQUEIDENTIFIER,
	@SnapshotID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #value_vs_time (Time FLOAT, Value DECIMAL(19, 6), StringValue VARCHAR(MAX), ElementID BIGINT, OriginalAcqTime DATETIME2(7))
	CREATE TABLE #file_names (FileName NVARCHAR(MAX), Content NVARCHAR(20))
	
	INSERT INTO #value_vs_time (Time, Value, StringValue, ElementID, OriginalAcqTime) 
	EXEC GetPrevSnapshot @SerieID, @SnapshotID, @DataOwnerID

	EXEC ExportValueVsTimeAsXML '#value_vs_time'

	SELECT * FROM #file_names
END

GO
/****** Object:  StoredProcedure [dbo].[GetProcessLogMessages]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetProcessLogMessages] 
	@ContentsID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT * 
	FROM TableProcessLogMessages
	WHERE ContentsID = @ContentsID
	ORDER BY ServerTimestamp DESC
END

GO
/****** Object:  StoredProcedure [dbo].[GetScheduledDevicesAndUpdateExecTime]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D,Morozov
-- Create date: 12/06/11
-- Description:	The function selects devices for action and updates LastExecTime
-- =============================================
CREATE PROCEDURE [dbo].[GetScheduledDevicesAndUpdateExecTime]
AS
BEGIN
	DECLARE @t TABLE (ID BIGINT NOT NULL, DeviceID BIGINT NOT NULL, NextActionTime DATETIME2 NOT NULL, ExecPID BIGINT,
					InternalAddress CHAR(10), AddressType CHAR(5), Port CHAR(5), IP1 CHAR(3), IP2 CHAR(3), IP3 CHAR(3), IP4 CHAR(3))
	-- Извлечение данных по значениям прежних меток времени
	INSERT INTO @t
		SELECT g.ID, DeviceID, NextActionTime, ExecPID, InternalAddress, AddressType, Port, IP1, IP2, IP3, IP4 
		FROM GetScheduledDevices() AS g JOIN TableDevice AS td ON g.DeviceID = td.ID
	-- Обновление меток времени
	UPDATE TableSchedule
		SET LastExecTime = SYSDATETIME()
		WHERE ID IN (SELECT ID FROM @t)
	-- Возврат списка устройств, полученного на первом шаге
	SELECT * FROM @t
END

GO
/****** Object:  StoredProcedure [dbo].[GetSerieList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 18/05/2012
-- Description:	The procedure gets point serie list for given value identifier.
-- =============================================
CREATE PROCEDURE [dbo].[GetSerieList] 
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
/****** Object:  StoredProcedure [dbo].[GetSnapshotSerieList]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 30.06.2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetSnapshotSerieList] 
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ElementID BIGINT
	SELECT TOP(1) @ElementID = ElementID
	FROM TableChartsDataTypes
	WHERE ChartID = @ChartID AND DataOwnerID = @DataOwnerID
			
	IF @ElementID IS NOT NULL
	BEGIN
		SELECT MIN(AcquisitionTime) AS StartTime, MAX(AcquisitionTime) AS EndTime, CAST(COUNT(*) AS BIGINT) AS [Count], Units, '' AS Name
		FROM TableDataPoint
		WHERE Units IN (SELECT DISTINCT Units FROM TableDataPoint WHERE ElementID = @ElementID)
		GROUP BY Units
		ORDER BY StartTime
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetTimeMult]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	The procedure calculates time multiplier
-- =============================================
CREATE PROCEDURE [dbo].[GetTimeMult] 
	@TMax DATETIME2(7),
	@TMin DATETIME2(7),
	@Step INT OUTPUT,
	@Units NVARCHAR(20) OUTPUT,
	@Mult FLOAT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT @Step = DATEDIFF(YY, @TMin, @TMax) / 10, @Units = N'x 10 year'
	IF @Step > 1
	BEGIN
		SET @Mult = CONVERT(FLOAT, DATEADD(YY, 10, 0))
	END
	ELSE
	BEGIN
		SELECT @Step = DATEDIFF(YY, @TMin, @TMax), @Units = N'year' 
		IF @Step > 1
		BEGIN
			SET @Mult = CONVERT(FLOAT, DATEADD(YY, 1, 0))
		END
		ELSE
		BEGIN
			SELECT @Step = DATEDIFF(DD, @TMin, @TMax) / 100, @Units = N'x 100 day'
			IF @Step > 1
			BEGIN
				SET @Mult = CONVERT(FLOAT, DATEADD(DD, 100, 0))
			END
			ELSE
			BEGIN
				SELECT @Step = DATEDIFF(DD, @TMin, @TMax) / 10, @Units = N'x 10 day'
				IF @Step > 1
				BEGIN
					SET @Mult = CONVERT(FLOAT, DATEADD(DD, 10, 0))
				END
				ELSE
				BEGIN
					SELECT @Step = DATEDIFF(DD, @TMin, @TMax), @Units = N'day'
					IF @Step > 1
					BEGIN
						SET @Mult = CONVERT(FLOAT, DATEADD(DD, 1, 0))
					END
					ELSE
					BEGIN
						SELECT @Step = DATEDIFF(HH, @TMin, @TMax) / 10, @Units = N'x 10 hour'
						IF @Step > 1
						BEGIN
							SET @Mult = CONVERT(FLOAT, DATEADD(HH, 10, 0))
						END
						ELSE
						BEGIN
							SELECT @Step = DATEDIFF(HH, @TMin, @TMax), @Units = N'hour'
							IF @Step > 1
							BEGIN
								SET @Mult = CONVERT(FLOAT, DATEADD(HH, 1, 0))
							END
							ELSE
							BEGIN
								SELECT @Step = DATEDIFF(MI, @TMin, @TMax) / 10, @Units = 'x 10 min'
								IF @Step > 1
								BEGIN
									SET @Mult = CONVERT(FLOAT, DATEADD(MI, 10, 0))
								END
								ELSE
								BEGIN
									SELECT @Step = DATEDIFF(MI, @TMin, @TMax), @Units = 'x 1 min'
									IF @Step > 1
									BEGIN
										SET @Mult = CONVERT(FLOAT, DATEADD(MI, 1, 0))
									END
									ELSE
									BEGIN
										SELECT @Step = DATEDIFF(SS, @TMin, @TMax) / 10, @Units = 'x 10 sec'
										IF @Step > 1
										BEGIN
											SET @Mult = CONVERT(FLOAT, DATEADD(SS, 10, 0))
										END
										ELSE
										BEGIN
											SELECT @Step = DATEDIFF(SS, @TMin, @TMax), @Units = 'x 1 sec'
											IF @Step > 1
											BEGIN
												SET @Mult = CONVERT(FLOAT, DATEADD(SS, 1, 0))
											END
											ELSE
											BEGIN
												SELECT @Step = DATEDIFF(MS, @TMin, @TMax) / 100, @Units = 'x 100 ms'
												IF @Step > 1
												BEGIN
													SET @Mult = CONVERT(FLOAT, DATEADD(MS, 100, 0))
												END
												ELSE
												BEGIN
													SELECT @Step = DATEDIFF(MS, @TMin, @TMax) / 10, @Units = 'x 10 ms'
													IF @Step > 1
													BEGIN
														SET @Mult = CONVERT(FLOAT, DATEADD(MS, 10, 0))
													END
													ELSE
													BEGIN
														SELECT @Step = DATEDIFF(MS, @TMin, @TMax), @Units = 'x 1 ms'
														SET @Mult = CONVERT(FLOAT, DATEADD(MS, 1, 0)) -- this gives zero
													END
												END
											END
										END
									END
								END
							END
						END
					END
				END
			END
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetUniqName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 27/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetUniqName] 
	@UniqName NVARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Uniq NVARCHAR(100)
	SET @Uniq = CONVERT(NVARCHAR(100), NEWID())
	SET @UniqName = SUBSTRING(@Uniq, 1, 8) + SUBSTRING(@Uniq, 10, 4) + SUBSTRING(@Uniq, 15, 4) + SUBSTRING(@Uniq, 20, 4) + SUBSTRING(@Uniq, 25, 12)
END

GO
/****** Object:  StoredProcedure [dbo].[GetUnscheduledDevices]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetUnscheduledDevices] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewDeviceScheduleParams
	WHERE ID NOT IN (SELECT DeviceID FROM TableSchedule)
	ORDER BY GroupID
END

GO
/****** Object:  StoredProcedure [dbo].[IncStatCount]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 05/01/2014
-- Description:	evernote:///view/14501366/s132/9926e2a8-1589-41cd-8179-b38843da795c/9926e2a8-1589-41cd-8179-b38843da795c/
-- =============================================
CREATE PROCEDURE [dbo].[IncStatCount] 
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
/****** Object:  StoredProcedure [dbo].[InitUserData]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Morozov D.V.
-- Create date: 24/05/2013
-- Description:	The procedure creates default user data.
-- Returns: Data set with the identifier of created group.
-- =============================================
CREATE PROCEDURE [dbo].[InitUserData] 
	@UserID UNIQUEIDENTIFIER, @DeviceTypeID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddGroup 'Common',	--@Name NCHAR(100)
		'',					--@DeviceNamePrefix NCHAR(10),
		'0',				--@StartingIP1 NCHAR(3),
		'0',				--@StartingIP2 NCHAR(3),
		'0',				--@StartingIP3 NCHAR(3),
		'0',				--@StartingIP4 NCHAR(3),
		'0',				--@EndingIP1 NCHAR(3),
		'0',				--@EndingIP2 NCHAR(3),
		'0',				--@EndingIP3 NCHAR(3),
		'0',				--@EndingIP4 NCHAR(3),
		'0',				--@SecondaryStartingIP1 NCHAR(3),
		'0',				--@SecondaryStartingIP2 NCHAR(3),
		'0',				--@SecondaryStartingIP3 NCHAR(3),
		'0',				--@SecondaryStartingIP4 NCHAR(3),
		'0',				--@StartingIPPort CHAR(5),
		'0',				--@EndingIPPort CHAR(5),
		'0',				--@SecondaryStartingIPPort CHAR(5),
	@DeviceTypeID,
	@UserID					--@DataOwnerID UNIQUEIDENTIFIER
END

GO
/****** Object:  StoredProcedure [dbo].[PutExtendedRegisterIntoBase]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 05/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[PutExtendedRegisterIntoBase]
	@ValueIdentifier NVARCHAR(MAX),
	@Units NCHAR(36),
	@IntValue INT,
	@StringValue VARCHAR(MAX),
	@IntStatus INT,
	@Year INT,
	@Month INT,
	@DayOfMonth INT,
	@DayOfWeek NVARCHAR(MAX),
	@Hour INT,
	@Minute INT,
	@Second INT,
	@HundredthsOfSecond INT
AS
BEGIN
	EXEC PutExtendedRegisterIntoBase2
		@ValueIdentifier = @ValueIdentifier,
		@Units = @Units,
		@IntValue = @IntValue,
		@StringValue = @StringValue,
		@IntStatus = @IntStatus,
		@Year = @Year,
		@Month = @Month,
		@DayOfMonth = @DayOfMonth,
		@DayOfWeek = @DayOfWeek,
		@Hour = @Hour,
		@Minute = @Minute,
		@Second = @Second,
		@HundredthsOfSecond = @HundredthsOfSecond
END		
		
		
	

GO
/****** Object:  StoredProcedure [dbo].[PutExtendedRegisterIntoBase2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/11/2013
-- Description:	This version uses the configuration table.
-- =============================================
CREATE PROCEDURE [dbo].[PutExtendedRegisterIntoBase2]
	@ValueIdentifier NVARCHAR(MAX),
	@Units NCHAR(36),
	@IntValue INT,
	@StringValue VARCHAR(MAX),
	@IntStatus INT,
	@Year INT,
	@Month INT,
	@DayOfMonth INT,
	@DayOfWeek NVARCHAR(MAX),
	@Hour INT,
	@Minute INT,
	@Second INT,
	@HundredthsOfSecond INT
AS
BEGIN
	DECLARE @T TABLE (ValueIdentifier UNIQUEIDENTIFIER, QualityBad BIT, MeasurementTime DATETIME2(7), Value DECIMAL(19, 6), StringValue VARCHAR(MAX), Units NCHAR(36))
	
	INSERT @T
	SELECT CONVERT(UNIQUEIDENTIFIER, @ValueIdentifier) AS ValueIdentifier, 
		CAST(@IntStatus AS BIT) AS QualityBad,
		CONVERT(DATETIME2(7), 
			CAST(@Year AS NVARCHAR(4)) + '-' +
			CAST(@Month AS NVARCHAR(2)) + '-' +
			CAST(@DayOfMonth AS NVARCHAR(2)) + 
			' ' +
			CAST(@Hour AS NVARCHAR(2)) + ':' +
			CAST(@Minute AS NVARCHAR(2)) + ':' +
			CAST(@Second AS NVARCHAR(2)) + '.' +
			CAST(@HundredthsOfSecond * 10 AS NVARCHAR(3))
			) AS MeasurementTime,
		CAST(@IntValue AS DECIMAL(19, 6)) AS Value,
		CAST(@StringValue AS VARCHAR(MAX)) AS StringValue,
		@Units

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM @T

	DECLARE @STRERRORMESSAGE NVARCHAR(1000)
	SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2: number of items = ' + CAST(@Count AS VARCHAR(MAX))
	EXEC AddMessageToAppLog @STRERRORMESSAGE

	IF @Count <> 0
	BEGIN	
		DECLARE @DeviceID BIGINT = NULL
		DECLARE @StartTime DATETIME2(7) = SYSDATETIME()
		DECLARE @AcquisitionTime DATETIME2(7) = SYSDATETIME() -- single value for all data
		DECLARE @EndTime DATETIME2(7) = NULL
		DECLARE @ResultID BIGINT = 0
		DECLARE @Parameters NCHAR(200) = ''
		DECLARE @DeviceIdent NCHAR(20) = 'XML capable device'
		DECLARE @SessionType NCHAR(20) = 'XML data uploading'
		DECLARE @Secondary BIT = 0
		DECLARE @DataOwnerID UNIQUEIDENTIFIER
		DECLARE @SaveSessions BIT = 0
		DECLARE @IsOBIS BIT = 0
		DECLARE @SessionIDs TABLE (ID BIGINT)
		DECLARE @SessionID BIGINT
		DECLARE @CurrentStateID BIGINT = NULL
		
		-- device identifier is not included into XML-document today,
		-- so it is given from the current state record
		SELECT TOP(1) @DeviceID = tcs.DeviceID, @DataOwnerID = tcs.DataOwnerID, @SaveSessions = td.SaveSessions, @CurrentStateID = tcs.ID
		FROM TableCurrentState AS tcs 
			INNER JOIN TableDevice AS td ON td.ID = tcs.DeviceID
		WHERE ValueIdentifier IN (SELECT ValueIdentifier FROM @T)
		
		-- inserts new data
		SET @EndTime = SYSDATETIME()		
		IF @SaveSessions = 1
		BEGIN
			INSERT INTO TableSession (DeviceID, StartTime, EndTime, SessionType, ResultID, Parameters, 
				DeviceIdent, Secondary, DataOwnerID, Data)
			OUTPUT INSERTED.ID INTO @SessionIDs
			VALUES (@DeviceID, @StartTime, @EndTime, @SessionType, @ResultID, @Parameters, 
				@DeviceIdent, @Secondary, @DataOwnerID, 'PutExtendedRegisterIntoBase2')
		END
		ELSE
		BEGIN
			INSERT INTO TableSession (DeviceID, StartTime, EndTime, SessionType, ResultID, Parameters, 
				DeviceIdent, Secondary, DataOwnerID)
			OUTPUT INSERTED.ID INTO @SessionIDs
			VALUES (@DeviceID, @StartTime, @EndTime, @SessionType, @ResultID, @Parameters, 
				@DeviceIdent, @Secondary, @DataOwnerID)
		END
		
		SELECT @SessionID = MAX(ID) FROM @SessionIDs
	
		DECLARE @Cursor CURSOR, 
				@QualityBad BIT, 
				@MeasurementTime DATETIME2(7), 
				@Value DECIMAL(19, 6)
				
		SET     @Cursor = CURSOR FOR 
			SELECT ValueIdentifier, QualityBad, MeasurementTime, Value, StringValue, Units FROM @T
		OPEN @Cursor	
		
		DECLARE @ElementID BIGINT		

		WHILE 1=1
		BEGIN
			FETCH FROM @Cursor INTO @ValueIdentifier, @QualityBad, @MeasurementTime, @Value, @StringValue, @Units
			IF @@fetch_status <> 0 BREAK
			
			SET @ElementID = (SELECT ID FROM TableCurrentState WHERE ValueIdentifier = @ValueIdentifier)			
			
			UPDATE TableCurrentState
			SET MeasurementTime = @MeasurementTime, AcquisitionTime = @AcquisitionTime,
				Value = @Value, StringValue = @StringValue, Units = @Units, QualityBad = @QualityBad
			WHERE ValueIdentifier = @ValueIdentifier AND AcquisitionDisabled = 0
			
			INSERT INTO TableDataPoint (MeasurementTime, AcquisitionTime, Value, StringValue,
				Units, SessionID, IsOBIS, QualityBad, DataOwnerID, ElementID, ValueIdentifier)
			VALUES (@MeasurementTime, @AcquisitionTime, @Value, @StringValue, @Units, @SessionID, 
				@IsOBIS, @QualityBad, @DataOwnerID, @ElementID, @ValueIdentifier)
		END
		
		-- session number limitation
		-- must be after the insertion for proper number of row calculation
		DECLARE @MaxSessionNumber BIGINT
		SET @MaxSessionNumber = (
			SELECT TOP(1) MaxSessionNumber 
			FROM TableCurrentStateConfig
			WHERE CurrentStateID = @CurrentStateID
			)
		-- use default
		IF @MaxSessionNumber IS NULL SET @MaxSessionNumber = 4000
		
		SELECT @Count = COUNT(*) FROM TableSession
		WHERE DataOwnerID = @DataOwnerID AND DeviceID = @DeviceID
		
		IF @Count > @MaxSessionNumber
		BEGIN
			-- Calculates the number of rows to be deleted.
			SET @Count = @Count - @MaxSessionNumber
			DECLARE @DeletedSessionIDs TABLE (ID BIGINT)
			
			INSERT INTO @DeletedSessionIDs (ID)
			SELECT TOP(@Count) ID FROM TableSession
			WHERE DataOwnerID = @DataOwnerID AND DeviceID = @DeviceID
			ORDER BY ID ASC

			SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2: number of sessions to delete = ' + CAST(@Count AS VARCHAR(MAX))
			EXEC AddMessageToAppLog @STRERRORMESSAGE

			DECLARE @Cursor1 CURSOR, @FileName VARCHAR(MAX)
			SET @Cursor1 = CURSOR FOR 
				SELECT StringValue FROM TableDataPoint WHERE SessionID IN (SELECT ID FROM @DeletedSessionIDs)
			OPEN @Cursor1	
		
			WHILE 1=1
			BEGIN
				FETCH FROM @Cursor1 INTO @FileName
				IF @@fetch_status <> 0 BREAK

				SELECT @STRERRORMESSAGE = 'PutExtendedRegisterIntoBase2 is going to delete ' + @FileName
				EXEC AddMessageToAppLog @STRERRORMESSAGE

				EXEC DeleteFiles @FileName
			END

			DELETE FROM TableDataPoint WHERE SessionID IN (SELECT ID FROM @DeletedSessionIDs)
			DELETE FROM TableSession WHERE ID IN (SELECT ID FROM @DeletedSessionIDs)
		END
	END		
END		
		
		
	

GO
/****** Object:  StoredProcedure [dbo].[ResetInProgressStatus]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 01/12/13
-- Description:	evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/
--				https://www.evernote.com/shard/s132/nl/14501366/04de2b98-e715-4f61-bcba-8eded24a4269
-- =============================================
CREATE PROCEDURE [dbo].[ResetInProgressStatus]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [Oonze].[dbo].[TableCurrentStateOperation]
	SET OperationInProgress = 0, FinishedSuccessfully = 0
	WHERE OperationInProgress = 1 AND DATEDIFF(second, OperationBegin, SYSDATETIME()) > 30
END

GO
/****** Object:  StoredProcedure [dbo].[ResetInProgressStatusActivProc]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ResetInProgressStatusActivProc]
--ALTER PROCEDURE ResetInProgressStatusActivProc
AS
BEGIN
	DECLARE @RecvReqDlgHandle UNIQUEIDENTIFIER;
	DECLARE @RecvReqMsg NVARCHAR(100);
	DECLARE @RecvReqMsgName sysname;

	PRINT 'ResetInProgressStatusActivProc is executed'

	BEGIN TRANSACTION;

	RECEIVE TOP(1)
		@RecvReqDlgHandle = conversation_handle,
		@RecvReqMsg = message_body,
		@RecvReqMsgName = message_type_name
	FROM ResetInProgressStatusReceiveQueue

	IF @@ROWCOUNT = 0
	BEGIN
	  COMMIT TRANSACTION;
	  RETURN;
	END

	PRINT 'ResetInProgressStatusActivProc is processing messages'
	PRINT @RecvReqDlgHandle

	IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer'
	BEGIN
		EXEC ResetInProgressStatus;
		
		DECLARE @Dialog UNIQUEIDENTIFIER
		SET @Dialog = (SELECT TOP(1) CAST(Value AS UNIQUEIDENTIFIER) FROM TableAppAttribute
					   WHERE [Key] = 'ResetInProgressStatusDialog')
		
		IF @Dialog IS NOT NULL
		BEGIN
			BEGIN CONVERSATION TIMER (@Dialog) TIMEOUT = 5;
			PRINT 'ResetInProgressStatusActivProc restarts the timer'
		END
	END
	ELSE IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
	BEGIN
		END CONVERSATION @RecvReqDlgHandle;
	END
	ELSE IF @RecvReqMsgName = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
	BEGIN
		END CONVERSATION @RecvReqDlgHandle;
	END
	  
	COMMIT TRANSACTION;
END  

GO
/****** Object:  StoredProcedure [dbo].[SetAcquisitionDisabled]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 15/10/13
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SetAcquisitionDisabled]
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER, 
	@AcquisitionDisabled BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCurrentState
	SET AcquisitionDisabled = @AcquisitionDisabled
	WHERE ID = @ElementID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[SPDELETEFILE]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[SPDELETEFILE]
(
	-- Full filename, including the path.
	@FILENAME VARCHAR(1000)
)
AS
BEGIN
	DECLARE @OBJFILESYSTEM INT,
			@OBJERROROBJECT INT,
			@STRERRORMESSAGE VARCHAR(1000),
			@COMMAND VARCHAR(1000),
			@HR INT

	SET NOCOUNT ON
	
	DECLARE @TestMode BIT
	SET @TestMode = (SELECT TestMode FROM GetCurrentAppConfig())

	IF @TestMode IS NULL OR @TestMode = 1
	BEGIN
		-- The test mode.
		-- Adds row to the log.
		EXEC AddMessageToAppLog 'SPDELETEFILE (test mode).'
	END
	ELSE
	BEGIN
		--	The operating mode.
		SELECT @STRERRORMESSAGE = 'OPENING THE FILE SYSTEM OBJECT'
		EXECUTE @HR = SP_OACREATE 'SCRIPTING.FILESYSTEMOBJECT', @OBJFILESYSTEM OUT
		
		IF @HR = 0 SELECT @OBJERROROBJECT = @OBJFILESYSTEM, @STRERRORMESSAGE = 'DELETING FILE "' + @FILENAME + '"'
		--	The last parameter disables deleting readonly files.
		IF @HR = 0 EXECUTE @HR = SP_OAMETHOD @OBJFILESYSTEM, 'DeleteFile', NULL, @FILENAME

		IF @HR <> 0
		BEGIN
			DECLARE 
				@SOURCE VARCHAR(255),
				@DESCRIPTION VARCHAR(255),
				@HELPFILE VARCHAR(255),
				@HELPID INT
			
			EXECUTE SP_OAGETERRORINFO @OBJERROROBJECT, 
				@SOURCE OUTPUT, @DESCRIPTION OUTPUT, @HELPFILE OUTPUT, @HELPID OUTPUT
			SELECT @STRERRORMESSAGE = 'ERROR WHILST '
					+ COALESCE(@STRERRORMESSAGE, 'DOING SOMETHING')
					+ ', '+ COALESCE(@DESCRIPTION, '')
			--RAISERROR (@STRERRORMESSAGE, 16, 1)
			EXEC AddMessageToAppLog @STRERRORMESSAGE
		END
		ELSE
		BEGIN
			DECLARE @MESSAGE VARCHAR(1000)
			SET @MESSAGE = 'SPDELETEFILE (' + @FILENAME	+ ')'
			EXEC AddMessageToAppLog @MESSAGE
		END
		
		EXEC SP_OADESTROY @OBJFILESYSTEM
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanDatabase]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 25/11/2011
-- Description:	The procedure cleans all database tables.
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanDatabase] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR, @SPName NCHAR(100)
	SET     @Cursor = CURSOR FOR 
		SELECT 'SPTest_Clean' + name	
		FROM sysobjects o
		WHERE OBJECTPROPERTY(o.id, N'IsTable') = 1 
			AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
			AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
			AND o.name LIKE N'Table%'
	OPEN @Cursor	

	BEGIN TRANSACTION	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @SPName
		IF @@fetch_status <> 0 BREAK
		EXEC @SPName @DataOwnerID
	END

	EXEC SPTest_CleanUsers @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableActorInfo]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableActorInfo]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableActorInfo
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableActorInfo
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableAddress]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDeviceOwner @DataOwnerID
	EXEC SPTest_CleanTableDevice @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableAddress
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableAddress
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableApartament]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableApartament]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableApartament
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableApartament
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableBuilding]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableBuilding]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableBuilding
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableBuilding
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanTableChart] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NOT NULL
	BEGIN
		DELETE FROM TableChart
		WHERE DataOwnerID = @DataOwnerID
	END
	ELSE
	BEGIN
		DELETE FROM TableChart
		WHERE 1 = 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableChartsDataTypes]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanTableChartsDataTypes] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NOT NULL
	BEGIN
		DELETE FROM TableChartsDataTypes
		WHERE DataOwnerID = @DataOwnerID
	END
	ELSE
	BEGIN
		DELETE FROM TableChartsDataTypes
		WHERE 1 = 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanTableChartSet] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableChartSet
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableChartSet
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanTableChartSetsCharts] 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NOT NULL
	BEGIN
		DELETE FROM TableChartSetsCharts
		WHERE DataOwnerID = @DataOwnerID
	END
	ELSE
	BEGIN
		DELETE FROM TableChartSetsCharts
		WHERE 1 = 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCity]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCity]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCity
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCity
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMAttribute]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMAttribute
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMAttribute
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMClass]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDataType @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMClass
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMClass
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMComplexTypeField]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMComplexTypeField
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMComplexTypeField
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMDataType]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableCOSEMComplexTypeField @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMDataType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMDataType
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMLogicalDevice]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableCOSEMObject @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMLogicalDevice
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMLogicalDevice
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMMethod]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMMethod
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMMethod
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMObject]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMObject
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCOSEMObject
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCOSEMStaticAttributeValue]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCOSEMStaticAttributeValue]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCOSEMStaticAttributeValue
		WHERE 1 = 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCountry]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCountry]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCountry
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCountry
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableCurrentState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableCurrentState]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCurrentState
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCurrentState
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDataPoint]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDataPoint]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDataPoint
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDataPoint
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDataType]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDataType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDataType
		WHERE @DataOwnerID = DataOwnerID
	END
	-- all other tables are cleaned by cascade operations
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDevice]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDevice
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDevice
		WHERE @DataOwnerID = DataOwnerID
	END
	-- all other tables are cleaned by cascade operations
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceDataType]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceDataType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceDataType
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceLog]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceLog
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceLog
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceOBISGroup]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceOBISGroup
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceOBISGroup
		WHERE DataOwnerID = @DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceOwner]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDevice @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceOwner
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceOwner
		WHERE DataOwnerID = @DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceOwnerLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceOwnerLog]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceOwnerLog
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceOwnerLog
		WHERE DataOwnerID = @DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableDeviceType]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableCOSEMObject @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableDeviceType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableDeviceType
		WHERE DataOwnerID = @DataOwnerID
	END
	--	other tables are cleaned by cascade operations
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableEvent]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableEvent]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableEvent
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableEvent
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableEventCategory]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableEventCategory]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableEvent @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableEventCategory
		WHERE 1 = 1 
	END
	ELSE
	BEGIN
		DELETE FROM TableEventCategory
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableGroup]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDevice @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableGroup
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableGroup
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableGroupLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableGroupLog]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableGroupLog
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableGroupLog
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableLocation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableLocation]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableDevice @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableLocation
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableLocation
		WHERE 1 = 1 -- DataOwnerID = @DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableOBISGroup]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableOBISSet @DataOwnerID
	EXEC SPTest_CleanTableOBISGroupLink @DataOwnerID
	EXEC SPTest_CleanTableDeviceOBISGroup @DataOwnerID
	EXEC SPTest_CleanTableDeviceType @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableOBISGroup
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableOBISGroup
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableOBISGroupLink]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableOBISGroupLink]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableOBISGroupLink
		WHERE 1 = 1	
	END
	ELSE
	BEGIN
		DELETE FROM TableOBISGroupLink
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableOBISSet]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableOBISSet
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableOBISSet
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableProcessLogContents]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableProcessLogContents]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableProcessLogMessages @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableProcessLogContents
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableProcessLogContents
		WHERE 1 = 1 --@DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableProcessLogMessages]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableProcessLogMessages]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableProcessLogMessages
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableProcessLogMessages
		WHERE 1 = 1 --@DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableSchedule]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableSchedule]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableSchedule WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableSchedule WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableSession]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableSession]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableCurrentState WHERE 1 = 1 
		DELETE FROM TableEvent WHERE 1 = 1
		DELETE FROM TableDataPoint WHERE 1 = 1 
		DELETE FROM TableSession WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableCurrentState WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableEvent WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableDataPoint WHERE @DataOwnerID = DataOwnerID
		DELETE FROM TableSession WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableSessionType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableSessionType]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableSessionType
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableSessionType
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableState]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableState
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableState
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableStreet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableStreet]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableStreet
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableStreet
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableUser]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableUser
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableUser
		WHERE @DataOwnerID = DataOwnerID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanTableZipCode]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTest_CleanTableZipCode]
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	EXEC SPTest_CleanTableAddress @DataOwnerID
	
	IF @DataOwnerID IS NULL
	BEGIN
		DELETE FROM TableZipCode
		WHERE 1 = 1
	END
	ELSE
	BEGIN
		DELETE FROM TableZipCode
		WHERE @DataOwnerID = DataOwnerID
	END
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPTest_CleanUsers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 25/11/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SPTest_CleanUsers] 
	@User UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM aspnet_Membership
	WHERE UserId = @User
	
	DELETE FROM aspnet_UsersInRoles
	WHERE UserId = @User
	
	DELETE FROM aspnet_Profile
	WHERE UserId = @User
	
	DELETE FROM aspnet_PersonalizationPerUser
	WHERE UserId = @User
	
	DELETE FROM aspnet_Users
	WHERE UserId = @User
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[SPWRITESTRINGTOFILE]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPWRITESTRINGTOFILE]
(
	@STRING VARCHAR(MAX), --8000 IN SQL SERVER 2000
	@PATH VARCHAR(255),
	@FILENAME VARCHAR(100)
)
AS
BEGIN
	DECLARE @OBJFILESYSTEM INT,
			@OBJTEXTSTREAM INT,
			@OBJERROROBJECT INT,
			@STRERRORMESSAGE VARCHAR(1000),
			@COMMAND VARCHAR(1000),
			@HR INT,
			@FILEANDPATH VARCHAR(1000)

	SET NOCOUNT ON

	SELECT @STRERRORMESSAGE = 'OPENING THE FILE SYSTEM OBJECT'
	EXECUTE @HR = SP_OACREATE 'SCRIPTING.FILESYSTEMOBJECT', @OBJFILESYSTEM OUT

	SELECT @FILEANDPATH = @PATH + '\' + @FILENAME
	--PRINT @FILEANDPATH
	
	IF @HR=0 SELECT @OBJERROROBJECT = @OBJFILESYSTEM, @STRERRORMESSAGE = 'CREATING FILE "' + @FILEANDPATH + '"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD @OBJFILESYSTEM, 'CREATETEXTFILE', @OBJTEXTSTREAM OUT, @FILEANDPATH, 2, TRUE

	IF @HR=0 SELECT @OBJERROROBJECT = @OBJTEXTSTREAM, 
		@STRERRORMESSAGE = 'WRITING TO THE FILE "' + @FILEANDPATH + '"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD  @OBJTEXTSTREAM, 'WRITE', NULL, @STRING

	IF @HR=0 SELECT @OBJERROROBJECT=@OBJTEXTSTREAM, @STRERRORMESSAGE='CLOSING THE FILE "'+@FILEANDPATH+'"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD  @OBJTEXTSTREAM, 'CLOSE'

	IF @HR<>0
	BEGIN
		DECLARE 
			@SOURCE VARCHAR(255),
			@DESCRIPTION VARCHAR(255),
			@HELPFILE VARCHAR(255),
			@HELPID INT
		
		EXECUTE SP_OAGETERRORINFO @OBJERROROBJECT, 
			@SOURCE OUTPUT,@DESCRIPTION OUTPUT,@HELPFILE OUTPUT,@HELPID OUTPUT
		SELECT @STRERRORMESSAGE='ERROR WHILST '
				+COALESCE(@STRERRORMESSAGE,'DOING SOMETHING')
				+', '+COALESCE(@DESCRIPTION,'')
		RAISERROR (@STRERRORMESSAGE,16,1)
	END
	EXECUTE SP_OADESTROY @OBJTEXTSTREAM
	EXECUTE SP_OADESTROY @OBJTEXTSTREAM
END
GO
/****** Object:  StoredProcedure [dbo].[TestSP_CleanDatabase]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 25/11/2011
-- Description:	The procedure cleans all database tables.
-- =============================================
CREATE PROCEDURE [dbo].[TestSP_CleanDatabase] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Cursor CURSOR, @SPName NCHAR(100)
	SET     @Cursor = CURSOR FOR 
		SELECT 'SPTest_Clean' + name	
		FROM sysobjects o
		WHERE OBJECTPROPERTY(o.id, N'IsTable') = 1 
			AND OBJECTPROPERTY(o.id, N'IsSystemTable') = 0
			AND	OBJECTPROPERTY(o.id, N'IsMSShipped') != 1
			AND o.name LIKE N'Table%'
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @SPName
		IF @@fetch_status <> 0 BREAK
		EXEC @SPName
	END
END

GO
/****** Object:  StoredProcedure [dbo].[TurnRecordingOnOff]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 17/10/13
-- Description:	Turns on and off video recording.
-- =============================================
CREATE PROCEDURE [dbo].[TurnRecordingOnOff]
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER, 
	@TurnOff BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	DECLARE @OperationID UNIQUEIDENTIFIER
	SET @OperationID = NEWID()

	DECLARE @OperationType NCHAR(10)

	IF @TurnOff = 1
	BEGIN
		SET @OperationType = 'turn off'
		INSERT INTO TableDeviceOperationLog(Command, ResultingMessage, ExecutingUserID, OperationID, TimeStamp)
		VALUES (@OperationType, '', @DataOwnerID, @OperationID, GETDATE())
	END
	ELSE
	BEGIN
		SET @OperationType = 'turn on'
		INSERT INTO TableDeviceOperationLog(Command, ResultingMessage, ExecutingUserID, OperationID, TimeStamp)
		VALUES (@OperationType, '', @DataOwnerID, @OperationID, GETDATE())
	END

	DECLARE @OperationInProgress BIT
	SET @OperationInProgress = (SELECT OperationInProgress FROM ViewCurrentState WHERE ID = @ElementID)

	IF @OperationInProgress = 0
	BEGIN
		--	Updates task state.	
		UPDATE TableCurrentState
		SET AcquisitionDisabled = @TurnOff
		WHERE ID = @ElementID

		--	Deletes all previous operations.
		DELETE FROM TableCurrentStateOperation
		WHERE CurrentStateID = @ElementID

		--	Inserts a new operation.
		--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
		--  https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459
		INSERT INTO TableCurrentStateOperation (OperationID, OperationInProgress, FinishedSuccessfully, OperationBegin, CurrentStateID, OperationType)
		--  evernote:///view/14501366/s132/44a1a8a7-fb21-4eb8-bf61-620898655bea/44a1a8a7-fb21-4eb8-bf61-620898655bea/
		VALUES (@OperationID, 1, 0, SYSDATETIME(), @ElementID, @OperationType)
	
		--	Returns value as a recordset to simplify importing into the model.
		SELECT @OperationID
	
		COMMIT
	END
	ELSE
	BEGIN
		ROLLBACK;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 11/10/11
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddress] 
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
/****** Object:  StoredProcedure [dbo].[UpdateAttrIdentifier]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/07/11
-- Description:	The procedure adds or updates
--				the link between COSEM object 
--				attribute (COSEM logical model)
--				and device data item identifier
--				(device logical model).
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAttrIdentifier] 
	@Identifier NCHAR(20), 
	@COSEMAttributeID BIGINT,
	@COSEMObjectID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Standard BIT
	SELECT @Standard = Standard
	FROM TableCOSEMAttribute
	WHERE ID = @COSEMAttributeID

    DECLARE @COUNT BIGINT = 0
    SELECT @COUNT = COUNT(*)
    FROM TableDataType
    WHERE (COSEMAttributeID = @COSEMAttributeID) AND
		-- "standard" attributes also should be accounted!
		(COSEMObjectID = @COSEMObjectID) AND (DataOwnerID = @DataOwnerID OR @Standard = 1)
		
	IF @COUNT = 0
	BEGIN
		INSERT INTO TableDataType(COSEMAttributeID, COSEMObjectID, Identifier, DataOwnerID)
		VALUES (@COSEMAttributeID, @COSEMObjectID, @Identifier, @DataOwnerID)
	END
	ELSE
	BEGIN
		UPDATE TableDataType
		SET Identifier = @Identifier
		-- update is allowed only for owner of the object!
		WHERE (COSEMAttributeID = @COSEMAttributeID) AND
			(COSEMObjectID = @COSEMObjectID) AND (DataOwnerID = @DataOwnerID)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateChart]
	@ID BIGINT,
	@Name NCHAR(50),
	@Width INT,
	@Height INT, 
	@DataOwnerID UNIQUEIDENTIFIER,
	@DataSetType NCHAR(10),
	@DataSetMaxCount INT,
	@ChartType NCHAR(10)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableChart
	SET Name = @Name, Width = @Width, Height = @Height, DataSetType = @DataSetType, 
		DataSetMaxCount = @DataSetMaxCount, ChartType = @ChartType
	WHERE (ID = @ID) AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateChartSet] 
	@Name NCHAR(100),
	@ChartSetID BIGINT,
	@CellWidth INT, 
	@CellHeight INT,
	@Rows INT,
	@Cols INT,
	@Margin INT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableChartSet 
	SET Name = @Name, CellWidth = @CellWidth, CellHeight = @CellHeight, 
		Rows = @Rows, Cols = @Cols, Margin = @Margin
	WHERE ID = @ChartSetID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateChartSetsCharts] 
	@ChartSetID BIGINT,
	@ChartID BIGINT,
	@ColIndex BIGINT,
	@RowIndex BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableChartSetsCharts
	SET ColIndex = @ColIndex, RowIndex = @RowIndex
	WHERE (ChartSetID = @ChartSetID) AND (ChartID = @ChartID) 
		AND (DataOwnerID = @DataOwnerID)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCompletedAction]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCompletedAction] 
    @ScheduleID BIGINT,
    @Completed BIT,
    @CompletionTime DATETIME2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableSchedule
	SET Completed = @Completed, @CompletionTime = CompletionTime
	WHERE ID = @ScheduleID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMAttribute] 
	@ID BIGINT,
	@COSEMClassID BIGINT, 
	@Dynamic BIT,
	@Name NCHAR(100),
	@COSEMDataTypeID BIGINT,
	@MinValue FLOAT,
	@MaxValue FLOAT,
	@DefValue FLOAT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMAttribute
	SET COSEMClassID = @COSEMClassID, Dynamic = @Dynamic, Name = @Name, COSEMDataTypeID = @COSEMDataTypeID, 
		MinValue = @MinValue, MaxValue = @MaxValue, DefValue = @DefValue
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMClass] 
	@ID BIGINT,
	@ClassName NCHAR(100),
	@CardinalityMin INT,
	@CardinalityMax INT,
	@COSEMClassID INT,
	@Version NCHAR(10),
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableCOSEMClass
	SET ClassName = @ClassName, CardinalityMin = @CardinalityMin, CardinalityMax = @CardinalityMax,
		COSEMClassID = @COSEMClassID, Version = @Version, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCOSEMAttribute
	SET Standard = @Standard
	WHERE COSEMClassID = @ID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableCOSEMMethod
	SET Standard = @Standard
	WHERE COSEMClassID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMComplexTypeField] 
	@ID BIGINT,
	@Name NCHAR(20),
	@AggregateTypeID BIGINT,
	@TypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMComplexTypeField
	SET Name = @Name, AggregateTypeID = @AggregateTypeID, TypeID = @TypeID, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMDataType] 
	@ID BIGINT,
	@Name NCHAR(20), 
	@AncestorTypeID BIGINT,
	@ItemBitSize BIGINT,
	@ItemCount BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMDataType
	SET Name = @Name, AncestorTypeID = @AncestorTypeID, ItemBitSize = @ItemBitSize, 
		ItemCount = @ItemCount, @Standard = Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMLogicalDevice] 
	@ID BIGINT,
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMLogicalDevice
	SET DeviceTypeID = @DeviceTypeID, Name = @Name
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMMethod] 
	@ID BIGINT,
	@COSEMClassID BIGINT,
	@Name NCHAR(100),
	@Mandatory BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMMethod
	SET COSEMClassID = @COSEMClassID, Name = @Name, Mandatory = @Mandatory
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCOSEMObject] 
	@ID BIGINT,
	@COSEMLogicalDeviceID BIGINT,
	@COSEMClassID BIGINT,
	@DeviceTypeID BIGINT,
	@COSEMLogicalName NCHAR(20),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMObject
	SET COSEMLogicalDeviceID = @COSEMLogicalDeviceID, COSEMClassID = @COSEMClassID, 
		DeviceTypeID = @DeviceTypeID, COSEMLogicalName = @COSEMLogicalName
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCurrentState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCurrentState] 
	@DeviceID BIGINT,
	@Identifier NCHAR(20),
	@MeasurementTime DATETIME2(7),
	@AcquisitionTime DATETIME2(7),
	@Value FLOAT,
	@Units NCHAR(16),
	@QualityBad BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCurrentState
	SET MeasurementTime = @MeasurementTime, AcquisitionTime = @AcquisitionTime,
		Value = @Value, Units = @Units, QualityBad = @QualityBad
	WHERE DeviceID = @DeviceID AND RTRIM(Identifier) = @Identifier
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCurrentStateFromXML]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 03/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCurrentStateFromXML] 
	@DeviceID BIGINT,
	@ValueIdentifier UNIQUEIDENTIFIER,
	@MeasurementTime DATETIME2(7),
	@AcquisitionTime DATETIME2(7),
	@Value FLOAT,
	@Units NCHAR(16),
	@QualityBad BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCurrentState
	SET MeasurementTime = @MeasurementTime, AcquisitionTime = @AcquisitionTime,
		Value = @Value, Units = @Units, QualityBad = @QualityBad
	WHERE DeviceID = @DeviceID AND ValueIdentifier = @ValueIdentifier
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDevice] 
	@DeviceID BIGINT,
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice 
	SET Name = @Name, InternalAddress = @InternalAddress, AddressType = @AddressType,
		Port = @Port, GroupID = @GroupID, TypeID = @TypeID, OwnerID = @OwnerID, IP1 = @IP1, IP2 = @IP2, IP3 = @IP3, IP4 = @IP4,
		SecondaryPort = @SecondaryPort, SecondaryIP1 = @SecondaryIP1, SecondaryIP2 = @SecondaryIP2, SecondaryIP3 = @SecondaryIP3, 
		SecondaryIP4 = @SecondaryIP4
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDevice2]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2013
-- Description:	evernote:///view/14501366/s132/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/35e632ff-f86d-4f16-9465-94e0e9d3c5fe/
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDevice2]
	@DeviceID BIGINT,
	@Name NCHAR(20),
	@InternalAddress NCHAR(10),
	@AddressType CHAR(10),
	@Port CHAR(5),
	@GroupID BIGINT,
	@TypeID BIGINT,
	@OwnerID BIGINT,
	@IP1 CHAR(3),
	@IP2 CHAR(3),
	@IP3 CHAR(3),
	@IP4 CHAR(3),
	@SecondaryPort CHAR(5),
	@SecondaryIP1 CHAR(3),
	@SecondaryIP2 CHAR(3),
	@SecondaryIP3 CHAR(3),
	@SecondaryIP4 CHAR(3), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@Domain NCHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--  Requires updated table TableDevice.
	UPDATE TableDevice 
	SET Name = @Name, InternalAddress = @InternalAddress, AddressType = @AddressType,
		Port = @Port, GroupID = @GroupID, TypeID = @TypeID, OwnerID = @OwnerID, IP1 = @IP1, IP2 = @IP2, IP3 = @IP3, IP4 = @IP4,
		SecondaryPort = @SecondaryPort, SecondaryIP1 = @SecondaryIP1, SecondaryIP2 = @SecondaryIP2, SecondaryIP3 = @SecondaryIP3, 
		SecondaryIP4 = @SecondaryIP4, Domain = @Domain
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 30/10/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceAddress] 
	@DeviceID BIGINT,
	@AddressID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice
	SET LocationAddressID = @AddressID
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceOperationLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 19/10/2013
-- Description:	evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceOperationLog] 
	@OperationID UNIQUEIDENTIFIER,
	@UserID UNIQUEIDENTIFIER,
	@Message NVARCHAR(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDeviceOperationLog
	SET ResultingMessage = @Message
	WHERE OperationID = @OperationID 
		--	This does not work until 
		--	InstanceStarter will log on
		--	with actual user credentials.
		--AND ExecutingUserID = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	The procedure updates device owner and address fields.
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceOwner] 
	@ID BIGINT,
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
	
	SELECT @COUNT = COUNT(*), @MAXID = MAX(ID)
	FROM TableAddress
	WHERE ZipCodeID = @ZipCodeID AND CountryID = @CountryID
		AND StateID = @StateID AND CityID = @CityID AND StreetID = @StreetID
		AND BuildingID = @BuildingID AND ApartamentID = @ApartamentID 
		AND DataOwnerID = @DataOwnerID

	IF @COUNT = 0
	BEGIN
		-- adds new address
		INSERT INTO TableAddress (ZipCodeID, CountryID, StateID, CityID, StreetID, BuildingID, ApartamentID, DataOwnerID)
		OUTPUT INSERTED.ID INTO @InsertedID	
		VALUES (@ZipCodeID, @CountryID, @StateID, @CityID, @StreetID, @BuildingID, @ApartamentID, @DataOwnerID)

		SELECT @AddressID = MAX(ID) FROM @InsertedID		
	END
	ELSE
	BEGIN	
		SELECT @AddressID = @MAXID
	END
	
	UPDATE TableDeviceOwner 
	SET FirstName = @FirstName, LastName = @LastName, Company = @Company,
		EMail = @EMail, Phone = @Phone, Cell = @Cell, AddressID = @AddressID
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceOwnerID]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 03/11/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceOwnerID] 
	@DeviceID BIGINT,
	@OwnerID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice
	SET OwnerID = @OwnerID
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceStatus]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 22/10/13
-- Description:	evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceStatus]
	@ElementID BIGINT,
	@FinishedSuccessfully BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
	--  Updates all processing operations to simulate the initial behaviour.
	UPDATE TableCurrentStateOperation
	SET FinishedSuccessfully = @FinishedSuccessfully, OperationInProgress = 0
	WHERE CurrentStateID = @ElementID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceStatusByOperation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 23/10/13
-- Description:	evernote:///view/14501366/s132/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/f55c3cd7-765a-43b6-ad8e-f5efced98ce7/
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceStatusByOperation]
	@OperationID UNIQUEIDENTIFIER,
	@FinishedSuccessfully BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--	https://www.evernote.com/shard/s132/nl/14501366/cf204ad5-73f5-41a3-872e-8539d2d150fe
	UPDATE TableCurrentStateOperation
	SET FinishedSuccessfully = @FinishedSuccessfully, OperationInProgress = 0
	WHERE OperationID = @OperationID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDeviceType] 
	@ID BIGINT,
	@Description NCHAR(100), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDeviceType
	SET Description = @Description, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 11/05/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGroup]
	@ID BIGINT,
	@MinutesE TINYINT, 
	@MinutesG TINYINT, 
	@MinMode CHAR(5), 
	@HoursE TINYINT, 
	@HoursG TINYINT, 
	@HourMode CHAR(5), 
	@DaysE TINYINT, 
	@DaysG TINYINT, 
	@DayMode CHAR(5), 
	@WeeksG TINYINT, 
	@WeekMode CHAR(5), 
	@Monday BIT, 
	@Tuesday BIT, 
	@Wednesday BIT, 
	@Thursday BIT, 
	@Friday BIT, 
	@Saturday BIT, 
	@Sunday BIT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableGroup
	SET MinutesE = @MinutesE, MinutesG = @MinutesG, MinMode = @MinMode, 
		HoursE = @HoursE, HoursG = @HoursG, HourMode = @HourMode,
		DaysE = @DaysE, DaysG = @DaysG, DayMode = @DayMode, 
		WeeksG = @WeeksG, WeekMode = @WeekMode, Monday = @Monday, 
		Tuesday = @Tuesday, Wednesday = @Wednesday, @Thursday = @Thursday, 
		Friday = @Friday, Saturday = @Saturday, Sunday = @Sunday,
		Name = @Name
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateGroupShedule]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 08/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGroupShedule] 
	@ID BIGINT,
	@MinutesE TINYINT, 
	@MinutesG TINYINT, 
	@MinMode CHAR(5), 
	@HoursE TINYINT, 
	@HoursG TINYINT, 
	@HourMode CHAR(5), 
	@DaysE TINYINT, 
	@DaysG TINYINT, 
	@DayMode CHAR(5), 
	@WeeksG TINYINT, 
	@WeekMode CHAR(5), 
	@Monday BIT, 
	@Tuesday BIT, 
	@Wednesday BIT, 
	@Thursday BIT, 
	@Friday BIT, 
	@Saturday BIT, 
	@Sunday BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableGroup
	SET MinutesE = @MinutesE, MinutesG = @MinutesG, MinMode = @MinMode, 
		HoursE = @HoursE, HoursG = @HoursG, HourMode = @HourMode,
		DaysE = @DaysE, DaysG = @DaysG, DayMode = @DayMode, 
		WeeksG = @WeeksG, WeekMode = @WeekMode, Monday = @Monday, 
		Tuesday = @Tuesday, Wednesday = @Wednesday, @Thursday = @Thursday, 
		Friday = @Friday, Saturday = @Saturday, Sunday = @Sunday
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateNextActionTime]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/09/2011
-- Description:	The procedure updates NextActionTime in TableSchedule.
-- The procedure adds new record when necessary to protect from
-- record duplication.
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNextActionTime] 
	@ScheduleID BIGINT, -- Schedule item identifier.
	@NextActionTime DATETIME2(7),
	@DeviceID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT = 0
	SELECT @Count = COUNT(*)
	FROM TableSchedule
	WHERE ID = @ScheduleID

	IF @Count <> 0
	BEGIN
		UPDATE TableSchedule
		SET NextActionTime = @NextActionTime
		WHERE ID = @ScheduleID AND DeviceID = @DeviceID
	END
	ELSE
	BEGIN
		INSERT INTO TableSchedule (NextActionTime, DeviceID)
		VALUES (@NextActionTime, @DeviceID)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOBISGroup] 
	@ID BIGINT,
	@Type CHAR(1), 
	@Value TINYINT,
	@Description NCHAR(50),
	@Standard BIT,
	@Reserved BIT,
	@Unusable BIT,
	@Context BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableOBISGroup
	SET Type = @Type, Value = @Value, Description = @Description, Standard = @Standard, 
		Reserved = @Reserved, Unusable = @Unusable, Context = @Context
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOBISSet] 
	@ID BIGINT,
	@AID BIGINT,
	@BID BIGINT,
	@CID BIGINT,
	@DID BIGINT,
	@EID BIGINT,
	@FID BIGINT,
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableOBISSet
	SET AID = @AID, BID = @BID, CID = @CID, DID = @DID, EID = @EID, FID = @FID, 
		DeviceTypeID = @DeviceTypeID, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END

GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_A__C93A4C987F4BDEC0] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__17477DE402284B6B] UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__309103310504B816] UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK__aspnet_M__1788CC4D1DD065E0] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC585708E33C] PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_R__8AFACE1B40257DE4] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
 CONSTRAINT [PK__aspnet_S__5A1E6BC1116A8EFB] PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_U__1788CC4D09C96D33] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
 CONSTRAINT [PK__aspnet_W__7944C8107775B2CE] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nchar](10) NULL,
	[secondname] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fake_File]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fake_File](
	[FileName] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fake_Series]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fake_Series](
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[Count] [bigint] NOT NULL,
	[Units] [nchar](36) NOT NULL,
	[Name] [nchar](36) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[orderdetails] [nchar](200) NULL,
	[orderdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stat_RequestCount]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stat_RequestCount](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](1000) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_stat_RequestCount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableActorInfo]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableActorInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ToDo] [nchar](100) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableActorInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableAddress](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
	[ApartamentID] [bigint] NULL,
	[BuildingID] [bigint] NULL,
	[StreetID] [bigint] NULL,
	[CityID] [bigint] NULL,
	[StateID] [bigint] NULL,
	[CountryID] [bigint] NULL,
	[ZipCodeID] [bigint] NULL,
 CONSTRAINT [PK_TableAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableApartament]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableApartament](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Apartament] [nchar](5) NOT NULL,
	[BuildingID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableApartament] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableAppAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableAppAttribute](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](1000) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_TableApp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableAppConfig]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableAppConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TestMode] [bit] NOT NULL,
	[MaxAppLog] [int] NOT NULL,
 CONSTRAINT [PK_TableAppConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableAppLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableAppLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nchar](1000) NOT NULL,
	[ServerTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_TableAppLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableBuilding]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableBuilding](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Building] [nchar](10) NOT NULL,
	[StreetID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableBuilding] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChart](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
	[DataSetType] [nchar](10) NOT NULL,
	[DataSetMaxCount] [int] NOT NULL,
	[ChartType] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TableChart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableChartsDataTypes]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChartsDataTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ChartID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
	[ElementID] [bigint] NOT NULL,
 CONSTRAINT [PK_TableChartsDataTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChartSet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[CellWidth] [int] NOT NULL,
	[CellHeight] [int] NOT NULL,
	[Rows] [int] NOT NULL,
	[Cols] [int] NOT NULL,
	[Margin] [int] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableChartSetProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableChartSetsCharts](
	[ChartSetID] [bigint] NOT NULL,
	[ChartID] [bigint] NOT NULL,
	[ColIndex] [bigint] NULL,
	[RowIndex] [bigint] NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCity]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCity](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[City] [nchar](20) NOT NULL,
	[StateID] [bigint] NOT NULL,
	[PhoneCode] [nchar](10) NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableCity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMAttribute](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COSEMClassID] [bigint] NOT NULL,
	[Dynamic] [bit] NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[COSEMDataTypeID] [bigint] NOT NULL,
	[MinValue] [float] NULL,
	[MaxValue] [float] NULL,
	[DefValue] [float] NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableCOSEMAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMClass](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassName] [nchar](100) NULL,
	[CardinalityMin] [int] NULL,
	[CardinalityMax] [int] NULL,
	[COSEMClassID] [int] NOT NULL,
	[Version] [nchar](10) NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableCOSEMClass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMComplexTypeField](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[AggregateTypeID] [bigint] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableCOSEMComplexTypeField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMDataType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[AncestorTypeID] [bigint] NULL,
	[ItemBitSize] [bigint] NULL,
	[ItemCount] [bigint] NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableCOSEMDataType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMLogicalDevice](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceTypeID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Name] [nchar](20) NOT NULL,
	[SeqNum] [bigint] NOT NULL,
 CONSTRAINT [PK_TableCOSEMLogicalDevices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMMethod](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COSEMClassID] [bigint] NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Mandatory] [bit] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableCOSEMMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMObject](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COSEMLogicalDeviceID] [bigint] NOT NULL,
	[COSEMClassID] [bigint] NOT NULL,
	[DeviceTypeID] [bigint] NOT NULL,
	[COSEMLogicalName] [nchar](20) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableCOSEMObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCOSEMStaticAttributeValue]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCOSEMStaticAttributeValue](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COSEMAttibuteID] [bigint] NOT NULL,
	[COSEMObjectID] [bigint] NOT NULL,
	[COSEMDataTypeID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableCOSEMStaticAttributeValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCountry]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCountry](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Country] [nchar](30) NOT NULL,
	[PhoneCode] [nchar](10) NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableCountry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCurrentState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableCurrentState](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MeasurementTime] [datetime2](7) NULL,
	[AcquisitionTime] [datetime2](7) NULL,
	[Value] [decimal](19, 6) NULL,
	[StringValue] [varchar](max) NULL,
	[Units] [nchar](36) NULL,
	[DataTypeID] [bigint] NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[QualityBad] [bit] NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Identifier] [nchar](20) NOT NULL,
	[ValueIdentifier] [uniqueidentifier] NOT NULL,
	[AcquisitionDisabled] [bit] NOT NULL,
 CONSTRAINT [PK_TableCurrentState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableCurrentStateConfig]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCurrentStateConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaxSessionNumber] [int] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
	[CurrentStateID] [bigint] NOT NULL,
 CONSTRAINT [PK_TableCurrentStateConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableCurrentStateOperation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCurrentStateOperation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OperationBegin] [datetime2](7) NOT NULL,
	[OperationID] [uniqueidentifier] NOT NULL,
	[FinishedSuccessfully] [bit] NOT NULL,
	[OperationInProgress] [bit] NOT NULL,
	[CurrentStateID] [bigint] NOT NULL,
	[OperationType] [nchar](10) NULL,
 CONSTRAINT [PK_TableCurrentStateOperation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDataPoint]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableDataPoint](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MeasurementTime] [datetime2](7) NULL,
	[AcquisitionTime] [datetime2](7) NOT NULL,
	[Value] [decimal](19, 6) NOT NULL,
	[StringValue] [varchar](max) NULL,
	[Units] [nchar](36) NULL,
	[SessionID] [bigint] NULL,
	[IsOBIS] [bit] NULL,
	[QualityBad] [bit] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[ElementID] [bigint] NOT NULL,
	[ValueIdentifier] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDataPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDataType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Identifier] [nchar](20) NOT NULL,
	[COSEMAttributeID] [bigint] NOT NULL,
	[COSEMObjectID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDataType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableDevice](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
	[InternalAddress] [char](10) NULL,
	[AddressType] [char](10) NOT NULL,
	[Port] [char](5) NULL,
	[GroupID] [bigint] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[OwnerID] [bigint] NULL,
	[IP1] [char](3) NULL,
	[IP2] [char](3) NULL,
	[IP3] [char](3) NULL,
	[IP4] [char](3) NULL,
	[SecondaryPort] [char](5) NULL,
	[SecondaryIP1] [char](3) NULL,
	[SecondaryIP2] [char](3) NULL,
	[SecondaryIP3] [char](3) NULL,
	[SecondaryIP4] [char](3) NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[LocationAddressID] [bigint] NULL,
	[BillAddressID] [bigint] NULL,
	[LocationID] [bigint] NULL,
	[SaveSessions] [bit] NOT NULL,
	[Domain] [nchar](30) NULL,
 CONSTRAINT [PK_TableDevice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableDeviceDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDeviceDataType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDeviceDataType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDeviceLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableDeviceLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action] [char](10) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[ActorID] [nchar](30) NOT NULL,
	[Name] [nchar](20) NULL,
	[InternalAddress] [char](10) NULL,
	[AddressType] [char](10) NULL,
	[Port] [char](5) NULL,
	[GroupID] [bigint] NULL,
	[TypeID] [bigint] NULL,
	[OwnerID] [bigint] NULL,
	[IP1] [char](3) NULL,
	[IP2] [char](3) NULL,
	[IP3] [char](3) NULL,
	[IP4] [char](4) NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDeviceLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableDeviceOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDeviceOBISGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceTypeID] [bigint] NOT NULL,
	[OBISGroupID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDeviceOBISGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDeviceOperationLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDeviceOperationLog](
	[Command] [nchar](10) NOT NULL,
	[ResultingMessage] [nvarchar](500) NOT NULL,
	[ExecutingUserID] [uniqueidentifier] NOT NULL,
	[OperationID] [uniqueidentifier] NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TableDeviceOperationLog_1] PRIMARY KEY CLUSTERED 
(
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDeviceOwner](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](30) NULL,
	[LastName] [nchar](30) NULL,
	[Company] [nchar](30) NULL,
	[EMail] [nchar](30) NULL,
	[Phone] [nchar](20) NULL,
	[Cell] [nchar](20) NULL,
	[AddressID] [bigint] NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableDeviceOwner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDeviceOwnerLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableDeviceOwnerLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action] [char](10) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[DeviceOwnerID] [bigint] NOT NULL,
	[ActorID] [nchar](30) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
	[Company] [nchar](30) NULL,
	[Building] [nchar](10) NULL,
	[StreetAddress] [nchar](30) NULL,
	[City] [nchar](20) NULL,
	[State] [nchar](20) NULL,
	[Country] [nchar](30) NULL,
	[ZipCode] [nchar](10) NULL,
	[EMail] [nchar](20) NULL,
	[Phone] [char](20) NULL,
	[Cell] [char](20) NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableDeviceOwnerLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDeviceType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](100) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NULL,
 CONSTRAINT [PK_TableDeviceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableEvent]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableEvent](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Event] [nchar](200) NOT NULL,
	[CategoryID] [bigint] NULL,
	[DeviceID] [bigint] NOT NULL,
	[SessionID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableEventCategory]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableEventCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](100) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableEventCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[DeviceNamePrefix] [nchar](10) NULL,
	[StartingIP1] [char](3) NULL,
	[StartingIP2] [char](3) NULL,
	[StartingIP3] [char](3) NULL,
	[StartingIP4] [char](3) NULL,
	[EndingIP1] [char](3) NULL,
	[EndingIP2] [char](3) NULL,
	[EndingIP3] [char](3) NULL,
	[EndingIP4] [char](3) NULL,
	[SecondaryStartingIP1] [char](3) NULL,
	[SecondaryStartingIP2] [char](3) NULL,
	[SecondaryStartingIP3] [char](3) NULL,
	[SecondaryStartingIP4] [char](4) NULL,
	[StartingIPPort] [char](5) NULL,
	[EndingIPPort] [char](5) NULL,
	[SecondaryStartingIPPort] [char](5) NULL,
	[MinutesE] [tinyint] NULL,
	[MinutesG] [tinyint] NULL,
	[MinMode] [char](5) NULL,
	[HoursE] [tinyint] NULL,
	[HoursG] [tinyint] NULL,
	[HourMode] [char](5) NULL,
	[DaysE] [tinyint] NULL,
	[DaysG] [tinyint] NULL,
	[DayMode] [char](5) NULL,
	[WeeksG] [tinyint] NULL,
	[WeekMode] [char](5) NULL,
	[Monday] [bit] NULL,
	[Tuesday] [bit] NULL,
	[Wednesday] [bit] NULL,
	[Thursday] [bit] NULL,
	[Friday] [bit] NULL,
	[Saturday] [bit] NULL,
	[Sunday] [bit] NULL,
	[DeviceTypeID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[StartingApartment] [nchar](5) NULL,
	[EndingApartment] [nchar](5) NULL,
	[StartingBuilding] [nchar](5) NULL,
	[EndingBuilding] [nchar](5) NULL,
	[Street] [nchar](30) NULL,
	[City] [nchar](20) NULL,
	[State] [nchar](20) NULL,
	[Country] [nchar](30) NULL,
	[ZipCode] [nchar](10) NULL,
 CONSTRAINT [PK_TableGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableGroupLog]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableGroupLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action] [char](10) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[ActorID] [nchar](30) NOT NULL,
	[DeviceNamePrefix] [nchar](10) NULL,
	[StartingIP1] [char](3) NULL,
	[StartingIP2] [char](3) NULL,
	[StartingIP3] [char](3) NULL,
	[StartingIP4] [char](3) NULL,
	[EndingIP1] [char](3) NULL,
	[EndingIP2] [char](3) NULL,
	[EndingIP3] [char](3) NULL,
	[EndingIP4] [char](3) NULL,
	[SecondaryStartingIP1] [char](3) NULL,
	[SecondaryStartingIP2] [char](3) NULL,
	[SecondaryStartingIP3] [char](3) NULL,
	[SecondaryStartingIP4] [char](3) NULL,
	[StartingIPPort] [char](5) NULL,
	[EndingIPPort] [char](5) NULL,
	[SecondaryStartingIPPort] [char](5) NULL,
	[Address] [char](10) NULL,
	[MinutesE] [tinyint] NULL,
	[MinutesG] [tinyint] NULL,
	[MinMode] [char](5) NULL,
	[HoursE] [tinyint] NULL,
	[HoursG] [tinyint] NULL,
	[HourMode] [char](5) NULL,
	[DaysE] [tinyint] NULL,
	[DaysG] [tinyint] NULL,
	[DayMode] [char](5) NULL,
	[WeeksG] [tinyint] NULL,
	[WeekMode] [char](5) NULL,
	[Monday] [bit] NULL,
	[Tuesday] [bit] NULL,
	[Wednesday] [bit] NULL,
	[Thursday] [bit] NULL,
	[Friday] [bit] NULL,
	[Saturday] [bit] NULL,
	[Sunday] [bit] NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableGroupLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableLocation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableLocation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
 CONSTRAINT [PK_TableLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableOBISGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [char](1) NOT NULL,
	[Value] [tinyint] NOT NULL,
	[Description] [nchar](50) NOT NULL,
	[Standard] [bit] NOT NULL,
	[Reserved] [bit] NOT NULL,
	[Unusable] [bit] NOT NULL,
	[Context] [bit] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableOBISGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableOBISGroupLink]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableOBISGroupLink](
	[TopLevelOBISGroupID] [bigint] NOT NULL,
	[OBISGroupID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableOBISSet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AID] [bigint] NOT NULL,
	[BID] [bigint] NOT NULL,
	[CID] [bigint] NOT NULL,
	[DID] [bigint] NOT NULL,
	[EID] [bigint] NOT NULL,
	[FID] [bigint] NOT NULL,
	[DeviceTypeID] [bigint] NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Standard] [bit] NOT NULL,
 CONSTRAINT [PK_TableOBISSet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableProcessLogContents]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableProcessLogContents](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PID] [bigint] NOT NULL,
	[CmdLine] [nchar](100) NOT NULL,
 CONSTRAINT [PK_TableLogContents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableProcessLogMessages]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableProcessLogMessages](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ContentsID] [bigint] NOT NULL,
	[Message] [nchar](100) NULL,
	[MessageTimestamp] [datetime2](7) NULL,
	[ServerTimestamp] [datetime2](7) NULL,
 CONSTRAINT [PK_TableProcessLogMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableSchedule]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableSchedule](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[NextActionTime] [datetime2](7) NOT NULL,
	[LastExecTime] [datetime2](7) NULL,
	[ExecPID] [bigint] NULL,
	[ExecStationIP] [nchar](15) NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Successfull] [bit] NULL,
	[CompletionTime] [datetime2](7) NULL,
	[Completed] [bit] NULL,
 CONSTRAINT [PK_TableShedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableSession]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableSession](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[SessionType] [char](20) NOT NULL,
	[ResultID] [bigint] NOT NULL,
	[Parameters] [nchar](200) NULL,
	[DeviceIdent] [nchar](20) NULL,
	[Secondary] [bit] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
	[Data] [xml] NULL,
 CONSTRAINT [PK_TableSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableState](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[State] [nchar](20) NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableStreet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableStreet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Street] [nchar](30) NOT NULL,
	[CityID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableStreet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableUnitTestResult]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUnitTestResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeletedPointsCount] [int] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
	[InsertedCurrentStateCount] [int] NOT NULL,
	[DeletedCurrentStateCount] [int] NOT NULL,
 CONSTRAINT [PK_TableUserConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
	[UserName] [nchar](10) NOT NULL,
	[Password] [nchar](10) NOT NULL,
	[Company] [nchar](30) NOT NULL,
	[DataOwnerID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TableCollector] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableYouTubeAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableYouTubeAttribute](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_TableYouTubeAttributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableYouTubeAttributeKeyword]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableYouTubeAttributeKeyword](
	[AttributeId] [bigint] NOT NULL,
	[KeywordId] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableYouTubeAttributeTag]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableYouTubeAttributeTag](
	[AttributeId] [bigint] NOT NULL,
	[TagId] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableYouTubeKeyword]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableYouTubeKeyword](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Keyword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TableYouTubeKeyword] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableYouTubeTag]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableYouTubeTag](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Tag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TableYouTubeTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableZipCode]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableZipCode](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ZipCode] [nchar](10) NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[DataOwnerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TableZipCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDevice]
AS
SELECT     td.ID, RTRIM(td.Name) AS Name, RTRIM(td.InternalAddress) AS InternalAddress, RTRIM(td.AddressType) AS AddressType, RTRIM(td.Port) AS Port, 
                      td.GroupID, td.TypeID, td.OwnerID, RTRIM(td.IP1) AS IP1, RTRIM(td.IP2) AS IP2, RTRIM(td.IP3) AS IP3, RTRIM(td.IP4) AS IP4, RTRIM(td.SecondaryPort) 
                      AS SecondaryPort, RTRIM(td.SecondaryIP1) AS SecondaryIP1, RTRIM(td.SecondaryIP2) AS SecondaryIP2, RTRIM(td.SecondaryIP3) AS SecondaryIP3, 
                      RTRIM(td.SecondaryIP4) AS SecondaryIP4, td.DataOwnerID, td.LocationAddressID, td.BillAddressID, td.LocationID, RTRIM(tdt.Description) 
                      AS DeviceTypeName, RTRIM(tg.Name) AS GroupName, RTRIM(td.Domain) AS Domain, CASE WHEN td.Domain IS NOT NULL AND RTRIM(td.Domain) 
                      <> '' THEN RTRIM(td.Domain) ELSE RTRIM(td.IP1) + '.' + RTRIM(td.IP2) + '.' + RTRIM(td.IP3) + '.' + RTRIM(td.IP4) END AS URL
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = td.TypeID INNER JOIN
                      dbo.TableGroup AS tg ON tg.ID = td.GroupID

GO
/****** Object:  View [dbo].[ViewCurrentState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCurrentState]
AS
SELECT        t1.ID, t1.MeasurementTime, t1.AcquisitionTime, t1.Value, RTRIM(t1.Units) AS Units, t1.DataTypeID, t1.DeviceID, t1.QualityBad, t1.DataOwnerID, RTRIM(t1.ValueIdentifier) AS ValueIdentifier, 
                         t3.OperationBegin AS LastOperationBegin, t1.AcquisitionDisabled, t1.Identifier, CASE WHEN t2.OperationInProgress IS NOT NULL THEN t2.OperationInProgress ELSE CAST(0 AS BIT) END AS OperationInProgress, 
                         CASE WHEN t2.FinishedSuccessfully IS NOT NULL THEN t2.FinishedSuccessfully ELSE CAST(1 AS BIT) END AS FinishedSuccessfully, t3.OperationID AS LastOperationID, t3.OperationType
FROM            dbo.TableCurrentState AS t1 LEFT OUTER JOIN
                             (SELECT        tcs.ID AS ID1, MAX(tcso.ID) AS ID2, CASE WHEN MAX(CAST(tcso.OperationInProgress AS INT)) = 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS OperationInProgress, 
                                                         CASE WHEN MIN(CAST(tcso.FinishedSuccessfully AS INT)) = 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS FinishedSuccessfully
                               FROM            dbo.TableCurrentState AS tcs INNER JOIN
                                                         dbo.TableCurrentStateOperation AS tcso ON tcso.CurrentStateID = tcs.ID
                               GROUP BY tcs.ID) AS t2 ON t2.ID1 = t1.ID LEFT OUTER JOIN
                         dbo.TableCurrentStateOperation AS t3 ON t3.ID = t2.ID2

GO
/****** Object:  View [dbo].[ViewElementInstanceName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementInstanceName]
AS
SELECT        dbo.ViewCurrentState.ID, RTRIM(dbo.TableGroup.Name) AS GroupName, RTRIM(dbo.TableDevice.Name) AS DeviceName, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS LogicalDevice, 
                         RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) AS LogicalObject, RTRIM(dbo.TableCOSEMAttribute.Name) AS Attribute, RTRIM(dbo.TableDataType.Identifier) AS Identifier, RTRIM(dbo.TableGroup.Name) 
                         + '.' + RTRIM(dbo.TableDevice.Name) + '.' + RTRIM(dbo.TableCOSEMLogicalDevice.Name) + '.' + RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) + '.' + RTRIM(dbo.TableCOSEMAttribute.Name) AS FullName, 
                         dbo.TableDeviceType.Standard, RTRIM(dbo.ViewCurrentState.ValueIdentifier) AS ValueIdentifier, dbo.TableGroup.ID AS GroupID, dbo.ViewCurrentState.DeviceID, dbo.ViewCurrentState.DataOwnerID, 
                         dbo.TableCOSEMLogicalDevice.ID AS LogicalDeviceID, dbo.TableCOSEMObject.ID AS ObjectID, dbo.TableCOSEMAttribute.ID AS AttributeID, dbo.TableDeviceType.Description AS DeviceDescription, 
                         dbo.ViewCurrentState.AcquisitionDisabled, dbo.ViewCurrentState.OperationInProgress, dbo.ViewCurrentState.FinishedSuccessfully
FROM            dbo.ViewCurrentState INNER JOIN
                         dbo.TableDataType ON dbo.ViewCurrentState.DataTypeID = dbo.TableDataType.ID INNER JOIN
                         dbo.TableDevice ON dbo.ViewCurrentState.DeviceID = dbo.TableDevice.ID INNER JOIN
                         dbo.TableDeviceType ON dbo.TableDevice.TypeID = dbo.TableDeviceType.ID INNER JOIN
                         dbo.TableGroup ON dbo.TableDevice.GroupID = dbo.TableGroup.ID INNER JOIN
                         dbo.TableCOSEMLogicalDevice ON dbo.TableDeviceType.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID INNER JOIN
                         dbo.TableCOSEMObject ON dbo.TableDeviceType.ID = dbo.TableCOSEMObject.DeviceTypeID INNER JOIN
                         dbo.TableCOSEMClass ON dbo.TableCOSEMObject.COSEMClassID = dbo.TableCOSEMClass.ID INNER JOIN
                         dbo.TableCOSEMAttribute ON dbo.TableCOSEMClass.ID = dbo.TableCOSEMAttribute.COSEMClassID

GO
/****** Object:  View [dbo].[ViewChartsDevices]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChartsDevices]
AS
SELECT        tcdt.ChartID, vein.DeviceID, tcdt.DataOwnerID, vein.DeviceName, vein.GroupName, vein.DeviceDescription, vein.AcquisitionDisabled, tcdt.ElementID, vein.ValueIdentifier, vein.OperationInProgress, 
                         vein.FinishedSuccessfully, vd.URL, vd.Name, vd.Port
FROM            dbo.ViewElementInstanceName AS vein INNER JOIN
                         dbo.TableChartsDataTypes AS tcdt ON vein.ID = tcdt.ElementID INNER JOIN
                         dbo.ViewDevice AS vd ON vein.DeviceID = vd.ID

GO
/****** Object:  View [dbo].[ViewChartSetsCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChartSetsCharts]
AS
SELECT     dbo.TableChartSetsCharts.ColIndex, dbo.TableChartSetsCharts.RowIndex, RTRIM(dbo.TableChart.Name) AS ChartName, RTRIM(dbo.TableChartSet.Name) 
                      AS ChartSetName, dbo.TableChart.DataOwnerID, dbo.TableChartSet.ID AS ChartSetID, dbo.TableChart.ID AS ChartID
FROM         dbo.TableChartSetsCharts INNER JOIN
                      dbo.TableChartSet ON dbo.TableChartSetsCharts.ChartSetID = dbo.TableChartSet.ID RIGHT OUTER JOIN
                      dbo.TableChart ON dbo.TableChartSetsCharts.ChartID = dbo.TableChart.ID

GO
/****** Object:  View [dbo].[ViewChartSetsChartsExt]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChartSetsChartsExt]
AS
SELECT        d.URL, d.Port, s.ColIndex, s.RowIndex, s.ChartName, s.ChartSetName, s.DataOwnerID, s.ChartSetID, s.ChartID
FROM            dbo.ViewChartsDevices AS d INNER JOIN
                         dbo.ViewChartSetsCharts AS s ON s.ChartID = d.ChartID

GO
/****** Object:  View [dbo].[ViewCOSEMAttributeDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMAttributeDataType]
AS
SELECT     l.COSEMClassID, RTRIM(l.COSEMLogicalName) AS COSEMLogicalName, l.AttributeID, l.Dynamic, RTRIM(l.Name) AS Name, l.MinValue, l.MaxValue, 
                      l.DefValue, l.Standard, l.COSEMDataTypeID, r.ID AS DataTypeID, l.COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, 
                      l.COSEMLogicalDeviceID, l.DataOwnerID, RTRIM(r.Identifier) AS Identifier
FROM         (SELECT     object.ID AS COSEMObjectID, object.COSEMClassID, object.DeviceTypeID, object.COSEMLogicalDeviceID, object.COSEMLogicalName, 
                                              object.DataOwnerID, attribute.ID AS AttributeID, attribute.Dynamic, attribute.Name, attribute.COSEMDataTypeID, attribute.MinValue, 
                                              attribute.MaxValue, attribute.DefValue, attribute.Standard, datatype.Name AS COSEMDataTypeName
                       FROM          dbo.TableCOSEMObject AS object INNER JOIN
                                              dbo.TableCOSEMAttribute AS attribute ON attribute.COSEMClassID = object.COSEMClassID INNER JOIN
                                              dbo.TableCOSEMDataType AS datatype ON attribute.COSEMDataTypeID = datatype.ID) AS l LEFT OUTER JOIN
                          (SELECT     ID, Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID
                            FROM          dbo.TableDataType) AS r ON r.COSEMObjectID = l.COSEMObjectID AND l.AttributeID = r.COSEMAttributeID

GO
/****** Object:  View [dbo].[ViewCOSEMAttributeValue]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMAttributeValue]
AS
SELECT     *
FROM         (SELECT     l.COSEMClassID AS COSEMClassID, l.AttributeID AS AttributeID, l.Dynamic AS Dynamic, RTRIM(l.Name) AS Name, l.DataTypeID AS DataTypeID, 
                                              l.COSEMObjectID AS COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, r.MeasurementTime AS MeasurementTime, 
                                              r.AcquisitionTime AS AcquisitionTime, r.Value AS Value, RTRIM(r.Units) AS Units, r.DeviceID AS DeviceID, r.QualityBad AS QualityBad, 
                                              l.COSEMLogicalDeviceID AS COSEMLogicalDeviceID, l.Standard AS Standard, r.DataOwnerID AS DataOwnerID, RTRIM(l.Identifier) AS Identifier, 
                                              r.ValueIdentifier AS ValueIdentifier
                       FROM          dbo.ViewCOSEMAttributeDataType AS l JOIN
                                              dbo.ViewCurrentState AS r ON l.DataTypeID = r.DataTypeID) AS l
UNION
SELECT     *
FROM         (SELECT     l.COSEMClassID AS COSEMClassID, l.AttributeID AS AttributeID, l.Dynamic AS Dynamic, RTRIM(l.Name) AS Name, l.DataTypeID AS DataTypeID, 
                                              l.COSEMObjectID AS COSEMObjectID, RTRIM(l.COSEMDataTypeName) AS COSEMDataTypeName, r.MeasurementTime AS MeasurementTime, 
                                              r.AcquisitionTime AS AcquisitionTime, r.Value AS Value, RTRIM(r.Units) AS Units, r.DeviceID AS DeviceID, r.QualityBad AS QualityBad, 
                                              l.COSEMLogicalDeviceID AS COSEMLogicalDeviceID, l.Standard AS Standard, l.DataOwnerID AS DataOwnerID, RTRIM(l.Identifier) AS Identifier, 
                                              r.ValueIdentifier AS ValueIdentifier
                       FROM          dbo.ViewCOSEMAttributeDataType AS l LEFT OUTER JOIN
                                              dbo.ViewCurrentState AS r ON l.DataTypeID = r.DataTypeID
                       WHERE      ValueIdentifier IS NULL) AS r

GO
/****** Object:  View [dbo].[ViewAddress]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAddress]
AS
SELECT     dbo.TableAddress.ID, dbo.TableAddress.DataOwnerID, RTRIM(dbo.TableApartament.Apartament) AS Apartament, RTRIM(dbo.TableBuilding.Building) AS Building, 
                      RTRIM(dbo.TableStreet.Street) AS Street, RTRIM(dbo.TableCity.City) AS City, RTRIM(dbo.TableState.State) AS State, RTRIM(dbo.TableCountry.Country) AS Country, 
                      RTRIM(dbo.TableZipCode.ZipCode) AS ZipCode, dbo.TableAddress.ApartamentID, dbo.TableAddress.BuildingID, dbo.TableAddress.StreetID, dbo.TableAddress.CityID, 
                      dbo.TableAddress.StateID, dbo.TableAddress.CountryID, dbo.TableAddress.ZipCodeID
FROM         dbo.TableAddress INNER JOIN
                      dbo.TableApartament ON dbo.TableAddress.ApartamentID = dbo.TableApartament.ID INNER JOIN
                      dbo.TableBuilding ON dbo.TableAddress.BuildingID = dbo.TableBuilding.ID INNER JOIN
                      dbo.TableCity ON dbo.TableAddress.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableCountry ON dbo.TableAddress.CountryID = dbo.TableCountry.ID INNER JOIN
                      dbo.TableState ON dbo.TableAddress.StateID = dbo.TableState.ID INNER JOIN
                      dbo.TableStreet ON dbo.TableAddress.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableZipCode ON dbo.TableAddress.ZipCodeID = dbo.TableZipCode.ID

GO
/****** Object:  View [dbo].[ViewDeviceOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDeviceOwner]
AS
SELECT     dbo.TableDeviceOwner.ID, RTRIM(dbo.TableDeviceOwner.FirstName) AS FirstName, RTRIM(dbo.TableDeviceOwner.LastName) AS LastName, 
                      RTRIM(dbo.TableDeviceOwner.Company) AS Company, RTRIM(dbo.TableDeviceOwner.EMail) AS EMail, RTRIM(dbo.TableDeviceOwner.Phone) AS Phone, 
                      RTRIM(dbo.TableDeviceOwner.Cell) AS Cell, dbo.TableDeviceOwner.DataOwnerID, RTRIM(dbo.ViewAddress.Apartament) AS Apartament, 
                      RTRIM(dbo.ViewAddress.Building) AS Building, RTRIM(dbo.ViewAddress.Street) AS Street, RTRIM(dbo.ViewAddress.City) AS City, RTRIM(dbo.ViewAddress.State) 
                      AS State, RTRIM(dbo.ViewAddress.Country) AS Country, RTRIM(dbo.ViewAddress.ZipCode) AS ZipCode
FROM         dbo.TableDeviceOwner INNER JOIN
                      dbo.ViewAddress ON dbo.TableDeviceOwner.AddressID = dbo.ViewAddress.ID

GO
/****** Object:  View [dbo].[ViewElementOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementOwner]
AS
SELECT     dbo.ViewDeviceOwner.ID, dbo.ViewDeviceOwner.FirstName, dbo.ViewDeviceOwner.LastName, dbo.ViewDeviceOwner.Apartament, dbo.ViewDeviceOwner.Building, 
                      dbo.ViewDeviceOwner.Street, dbo.ViewDeviceOwner.City, dbo.ViewDeviceOwner.DataOwnerID, RTRIM(dbo.ViewDeviceOwner.FirstName) 
                      + ' ' + RTRIM(dbo.ViewDeviceOwner.LastName) + ', ' + RTRIM(dbo.ViewDeviceOwner.Apartament) + ' ' + RTRIM(dbo.ViewDeviceOwner.Building) 
                      + ', ' + RTRIM(dbo.ViewDeviceOwner.Street) + ', ' + RTRIM(dbo.ViewDeviceOwner.City) AS OwnerData, dbo.TableCurrentState.DeviceID
FROM         dbo.ViewDeviceOwner INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.OwnerID = dbo.ViewDeviceOwner.ID AND dbo.TableDevice.DataOwnerID = dbo.ViewDeviceOwner.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID

GO
/****** Object:  View [dbo].[ViewElementLogicalName]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementLogicalName]
AS
SELECT     dbo.TableCurrentState.ID, RTRIM(dbo.TableDeviceType.Description) AS DeviceType, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS LogicalDevice, 
                      dbo.TableCOSEMObject.COSEMLogicalName AS LogicalObject, RTRIM(dbo.TableCOSEMAttribute.Name) AS Attribute, RTRIM(dbo.TableDataType.Identifier) 
                      AS Identifier, RTRIM(dbo.TableDeviceType.Description) + '.' + RTRIM(dbo.TableCOSEMLogicalDevice.Name) 
                      + '.' + RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) + '.' + RTRIM(dbo.TableCOSEMAttribute.Name) AS FullName, dbo.TableDeviceType.Standard, 
                      RTRIM(dbo.TableCurrentState.ValueIdentifier) AS ValueIdentifier, dbo.TableCurrentState.DeviceID, dbo.TableCurrentState.DataOwnerID, 
                      dbo.TableDeviceType.ID AS DeviceTypeID, dbo.TableCOSEMLogicalDevice.ID AS LogicalDeviceID, dbo.TableCOSEMObject.ID AS ObjectID, 
                      dbo.TableCOSEMAttribute.ID AS AttributeID
FROM         dbo.TableCurrentState INNER JOIN
                      dbo.TableDataType ON dbo.TableCurrentState.DataTypeID = dbo.TableDataType.ID INNER JOIN
                      dbo.TableDeviceType INNER JOIN
                      dbo.TableCOSEMLogicalDevice ON dbo.TableDeviceType.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID INNER JOIN
                      dbo.TableCOSEMObject ON dbo.TableDeviceType.ID = dbo.TableCOSEMObject.DeviceTypeID AND 
                      dbo.TableCOSEMLogicalDevice.ID = dbo.TableCOSEMObject.COSEMLogicalDeviceID INNER JOIN
                      dbo.TableCOSEMClass ON dbo.TableCOSEMObject.COSEMClassID = dbo.TableCOSEMClass.ID INNER JOIN
                      dbo.TableCOSEMAttribute ON dbo.TableCOSEMClass.ID = dbo.TableCOSEMAttribute.COSEMClassID ON 
                      dbo.TableDataType.COSEMObjectID = dbo.TableCOSEMObject.ID AND dbo.TableDataType.COSEMAttributeID = dbo.TableCOSEMAttribute.ID

GO
/****** Object:  View [dbo].[ViewXMLTemplate]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewXMLTemplate]
AS
SELECT     1 AS Tag, NULL AS Parent, RTRIM(DeviceType) AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 3 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     2 AS Tag, 1 AS Parent, NULL AS [device_type!1!name!Element], RTRIM(LogicalDevice) AS [logical_device!2!name!Element], NULL 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     3 AS Tag, 2 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], RTRIM(LogicalObject) 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 1 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     4 AS Tag, 3 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], RTRIM(Attribute) 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 
                      0 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     6 AS Tag, 4 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], RTRIM(ValueIdentifier) AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 
                      1 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     7 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], 
                      '@@UNITS_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, 4 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     9 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], '@@VALUE_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     10 AS Tag, 9 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], 
                      '@@STRING_VALUE_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [string_value!10], 
                      NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     11 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], 
                      '@@STATUS_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 3 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     13 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], '@@YEAR_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     14 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], '@@MONTH_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     15 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], 
                      '@@DAY_OF_MONTH_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL
                       AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     16 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], 
                      '@@DAY_OF_WEEK_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     17 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], '@@HOUR_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     18 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], '@@MINUTE_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     19 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], '@@SECOND_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     20 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], '@@HUNDREDTHS_OF_SECOND_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName

GO
/****** Object:  View [dbo].[ViewElementLocation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementLocation]
AS
SELECT     dbo.TableDevice.LocationAddressID, dbo.ViewAddress.Apartament, dbo.ViewAddress.Building, dbo.ViewAddress.Street, dbo.ViewAddress.City, 
                      RTRIM(dbo.ViewAddress.Apartament) + ' ' + RTRIM(dbo.ViewAddress.Building) + ', ' + RTRIM(dbo.ViewAddress.Street) + ', ' + RTRIM(dbo.ViewAddress.City) AS Location,
                       dbo.ViewAddress.DataOwnerID, dbo.TableCurrentState.DeviceID
FROM         dbo.ViewAddress INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.LocationAddressID = dbo.ViewAddress.ID AND dbo.TableDevice.DataOwnerID = dbo.ViewAddress.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID

GO
/****** Object:  View [dbo].[ViewGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewGroup]
AS
SELECT     dbo.TableGroup.ID, RTRIM(dbo.TableGroup.Name) AS Name, RTRIM(dbo.TableGroup.DeviceNamePrefix) AS DeviceNamePrefix, 
                      RTRIM(dbo.TableGroup.StartingIP1) AS StartingIP1, RTRIM(dbo.TableGroup.StartingIP2) AS StartingIP2, RTRIM(dbo.TableGroup.StartingIP3) 
                      AS StartingIP3, RTRIM(dbo.TableGroup.StartingIP4) AS StartingIP4, RTRIM(dbo.TableGroup.EndingIP1) AS EndingIP1, 
                      RTRIM(dbo.TableGroup.EndingIP2) AS EndingIP2, RTRIM(dbo.TableGroup.EndingIP3) AS EndingIP3, RTRIM(dbo.TableGroup.EndingIP4) AS EndingIP4, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIP1) AS SecondaryStartingIP1, RTRIM(dbo.TableGroup.SecondaryStartingIP2) AS SecondaryStartingIP2, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIP3) AS SecondaryStartingIP3, RTRIM(dbo.TableGroup.SecondaryStartingIP4) AS SecondaryStartingIP4, 
                      RTRIM(dbo.TableGroup.StartingIPPort) AS StartingIPPort, RTRIM(dbo.TableGroup.EndingIPPort) AS EndingIPPort, 
                      RTRIM(dbo.TableGroup.SecondaryStartingIPPort) AS SecondaryStartingIPPort, dbo.TableGroup.MinutesE, dbo.TableGroup.MinutesG, 
                      RTRIM(dbo.TableGroup.MinMode) AS MinMode, dbo.TableGroup.HoursE, dbo.TableGroup.HoursG, RTRIM(dbo.TableGroup.HourMode) AS HourMode, 
                      dbo.TableGroup.DaysE, dbo.TableGroup.DaysG, RTRIM(dbo.TableGroup.DayMode) AS DayMode, dbo.TableGroup.WeeksG, 
                      RTRIM(dbo.TableGroup.WeekMode) AS WeekMode, dbo.TableGroup.Monday, dbo.TableGroup.Tuesday, dbo.TableGroup.Wednesday, 
                      dbo.TableGroup.Thursday, dbo.TableGroup.Friday, dbo.TableGroup.Saturday, dbo.TableGroup.Sunday, dbo.TableGroup.DataOwnerID, 
                      RTRIM(dbo.TableGroup.StartingApartment) AS StartingApartment, RTRIM(dbo.TableGroup.EndingApartment) AS EndingApartment, 
                      RTRIM(dbo.TableGroup.StartingBuilding) AS StartingBuilding, RTRIM(dbo.TableGroup.EndingBuilding) AS EndingBuilding, 
                      RTRIM(dbo.TableGroup.Street) AS Street, RTRIM(dbo.TableGroup.City) AS City, RTRIM(dbo.TableGroup.State) AS State, RTRIM(dbo.TableGroup.Country) 
                      AS Country, RTRIM(dbo.TableGroup.ZipCode) AS ZipCode, RTRIM(td.Description) AS DeviceType, dbo.TableGroup.DeviceTypeID
FROM         dbo.TableGroup INNER JOIN
                      dbo.TableDeviceType AS td ON td.ID = dbo.TableGroup.DeviceTypeID

GO
/****** Object:  View [dbo].[ViewElementGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementGroup]
AS
SELECT     dbo.ViewGroup.ID, dbo.ViewGroup.Name, dbo.ViewGroup.DeviceType, dbo.ViewGroup.DataOwnerID, dbo.TableCurrentState.DeviceID
FROM         dbo.ViewGroup INNER JOIN
                      dbo.TableDevice ON dbo.TableDevice.GroupID = dbo.ViewGroup.ID AND dbo.TableDevice.DataOwnerID = dbo.ViewGroup.DataOwnerID INNER JOIN
                      dbo.TableCurrentState ON dbo.TableDevice.ID = dbo.TableCurrentState.DeviceID

GO
/****** Object:  View [dbo].[ViewDevicesWithCharts]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDevicesWithCharts]
AS
SELECT * FROM
(
SELECT        vein.DeviceID, vein.DeviceName, vein.GroupName, vein.DeviceDescription, vein.AcquisitionDisabled,
                     vein.ValueIdentifier, vein.OperationInProgress, vein.FinishedSuccessfully, vd.URL, vd.Name, vd.Port, vein.DataOwnerID, vein.ID AS ElementID,
                         ROW_NUMBER() OVER (PARTITION BY vein.DeviceID ORDER BY tcdt.ChartID) AS RowNumber
FROM            dbo.ViewElementInstanceName AS vein INNER JOIN
                         dbo.TableChartsDataTypes AS tcdt ON vein.ID = tcdt.ElementID INNER JOIN
                         dbo.ViewDevice AS vd ON vein.DeviceID = vd.ID
) T
WHERE RowNumber = 1

GO
/****** Object:  View [dbo].[ViewChartsDataTypes]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChartsDataTypes]
AS
SELECT     ID, ChartID, DataOwnerID, ElementID
FROM         dbo.TableChartsDataTypes

GO
/****** Object:  View [dbo].[ViewElementFiltered]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewElementFiltered]
AS
SELECT     dbo.ViewElementInstanceName.ID, dbo.ViewElementInstanceName.FullName, dbo.ViewChartsDataTypes.ChartID, 
                      dbo.ViewElementInstanceName.GroupName, dbo.ViewElementInstanceName.DeviceName, dbo.ViewElementInstanceName.LogicalDevice, 
                      dbo.ViewElementInstanceName.LogicalObject, dbo.ViewElementInstanceName.Attribute, dbo.ViewElementInstanceName.Identifier, 
                      dbo.ViewElementInstanceName.Standard, dbo.ViewElementInstanceName.ValueIdentifier, dbo.ViewElementInstanceName.GroupID, 
                      dbo.ViewElementInstanceName.DeviceID, dbo.ViewElementInstanceName.DataOwnerID, dbo.ViewElementInstanceName.LogicalDeviceID, 
                      dbo.ViewElementInstanceName.ObjectID, dbo.ViewElementInstanceName.AttributeID
FROM         dbo.ViewElementInstanceName LEFT OUTER JOIN
                      dbo.ViewChartsDataTypes ON dbo.ViewChartsDataTypes.ElementID = dbo.ViewElementInstanceName.ID

GO
/****** Object:  UserDefinedFunction [dbo].[GetCurrentAppConfig]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 16/11/2013
-- Description:	Selects current application configuration.
-- =============================================
CREATE FUNCTION [dbo].[GetCurrentAppConfig] ()
RETURNS TABLE 
AS
RETURN 
(
	--	It is better to enumerate columns.
	SELECT TestMode, MaxAppLog FROM TableAppConfig
	WHERE ID = (SELECT MAX(ID) FROM TableAppConfig)
)

GO
/****** Object:  UserDefinedFunction [dbo].[GetScheduledDevices]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/06/11
-- Description:	The function selects devices for action.
-- =============================================
CREATE FUNCTION [dbo].[GetScheduledDevices] ()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM TableSchedule
	WHERE NextActionTime <= SYSDATETIME() and 
	-- Выбираются устройства, с которыми еще не было сеансов работы,
	-- или длительность последнего сеанса работы превышает таймаут.
		((LastExecTime is null) or DATEDIFF(s, LastExecTime, SYSDATETIME()) > 10)
)

GO
/****** Object:  View [dbo].[ViewApartament]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewApartament]
AS
SELECT     dbo.TableApartament.ID, RTRIM(dbo.TableApartament.Apartament) AS Apartament, dbo.TableApartament.BuildingID, dbo.TableApartament.DataOwnerID, 
                      dbo.TableBuilding.StreetID, dbo.TableStreet.CityID, dbo.TableCity.StateID, dbo.TableState.CountryID
FROM         dbo.TableApartament INNER JOIN
                      dbo.TableBuilding ON dbo.TableApartament.BuildingID = dbo.TableBuilding.ID INNER JOIN
                      dbo.TableStreet ON dbo.TableBuilding.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID

GO
/****** Object:  View [dbo].[ViewBuilding]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewBuilding]
AS
SELECT     dbo.TableBuilding.ID, RTRIM(dbo.TableBuilding.Building) AS Building, dbo.TableBuilding.StreetID, dbo.TableBuilding.DataOwnerID, dbo.TableStreet.CityID, 
                      dbo.TableCity.StateID, dbo.TableState.CountryID
FROM         dbo.TableBuilding INNER JOIN
                      dbo.TableStreet ON dbo.TableBuilding.StreetID = dbo.TableStreet.ID INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID

GO
/****** Object:  View [dbo].[ViewChart]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChart]
AS
SELECT     ID, RTRIM(Name) AS Name, Width, Height, DataOwnerID, RTRIM(DataSetType) AS DataSetType, DataSetMaxCount, RTRIM(ChartType) AS ChartType
FROM         dbo.TableChart

GO
/****** Object:  View [dbo].[ViewChartSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewChartSet]
AS
SELECT     ID, RTRIM(Name) AS Name, CellWidth, CellHeight, Rows, Cols, Margin, DataOwnerID
FROM         dbo.TableChartSet

GO
/****** Object:  View [dbo].[ViewCity]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCity]
AS
SELECT     dbo.TableCity.ID, RTRIM(dbo.TableCity.City) AS City, dbo.TableCity.StateID, RTRIM(dbo.TableCity.PhoneCode) AS PhoneCode, dbo.TableCity.DataOwnerID, 
                      dbo.TableState.CountryID
FROM         dbo.TableCity INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID

GO
/****** Object:  View [dbo].[ViewCOSEMAttribute]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMAttribute]
AS
SELECT     dbo.TableCOSEMAttribute.ID, dbo.TableCOSEMAttribute.COSEMClassID, dbo.TableCOSEMAttribute.Dynamic, RTRIM(dbo.TableCOSEMAttribute.Name) AS Name, 
                      dbo.TableCOSEMAttribute.COSEMDataTypeID, dbo.TableCOSEMAttribute.MinValue, dbo.TableCOSEMAttribute.MaxValue, dbo.TableCOSEMAttribute.DefValue, 
                      dbo.TableCOSEMAttribute.DataOwnerID, RTRIM(cl.ClassName) AS COSEMClassName, RTRIM(dt.Name) AS COSEMDataTypeName, 
                      dbo.TableCOSEMAttribute.Standard
FROM         dbo.TableCOSEMAttribute INNER JOIN
                      dbo.TableCOSEMClass AS cl ON cl.ID = dbo.TableCOSEMAttribute.COSEMClassID INNER JOIN
                      dbo.TableCOSEMDataType AS dt ON dt.ID = dbo.TableCOSEMAttribute.COSEMDataTypeID

GO
/****** Object:  View [dbo].[ViewCOSEMClass]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMClass]
AS
SELECT     ID, RTRIM(ClassName) AS ClassName, CardinalityMin, CardinalityMax, COSEMClassID, RTRIM(Version) AS Version, DataOwnerID, Standard
FROM         dbo.TableCOSEMClass

GO
/****** Object:  View [dbo].[ViewCOSEMComplexTypeField]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMComplexTypeField]
AS
SELECT     dbo.TableCOSEMComplexTypeField.ID, RTRIM(dbo.TableCOSEMComplexTypeField.Name) AS Name, dbo.TableCOSEMComplexTypeField.AggregateTypeID, 
                      dbo.TableCOSEMComplexTypeField.TypeID, dbo.TableCOSEMComplexTypeField.DataOwnerID, RTRIM(t1.Name) AS TypeName, RTRIM(t2.Name) 
                      AS AggregateTypeName, dbo.TableCOSEMComplexTypeField.Standard
FROM         dbo.TableCOSEMComplexTypeField INNER JOIN
                      dbo.TableCOSEMDataType AS t1 ON t1.ID = dbo.TableCOSEMComplexTypeField.TypeID INNER JOIN
                      dbo.TableCOSEMDataType AS t2 ON t2.ID = dbo.TableCOSEMComplexTypeField.AggregateTypeID

GO
/****** Object:  View [dbo].[ViewCOSEMDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMDataType]
AS
SELECT     dbo.TableCOSEMDataType.ID, RTRIM(dbo.TableCOSEMDataType.Name) AS Name, dbo.TableCOSEMDataType.AncestorTypeID, 
                      dbo.TableCOSEMDataType.ItemBitSize, dbo.TableCOSEMDataType.ItemCount, dbo.TableCOSEMDataType.DataOwnerID, RTRIM(t.Name) AS AncestorTypeName, 
                      dbo.TableCOSEMDataType.Standard
FROM         dbo.TableCOSEMDataType LEFT OUTER JOIN
                      dbo.TableCOSEMDataType AS t ON t.ID = dbo.TableCOSEMDataType.AncestorTypeID

GO
/****** Object:  View [dbo].[ViewCOSEMLogicalDevice]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMLogicalDevice]
AS
SELECT     dbo.TableCOSEMLogicalDevice.ID, dbo.TableCOSEMLogicalDevice.DeviceTypeID, dbo.TableCOSEMLogicalDevice.DataOwnerID, RTRIM(t.Description) 
                      AS DeviceTypeName, t.Standard, RTRIM(dbo.TableCOSEMLogicalDevice.Name) AS Name
FROM         dbo.TableCOSEMLogicalDevice INNER JOIN
                      dbo.TableDeviceType AS t ON t.ID = dbo.TableCOSEMLogicalDevice.DeviceTypeID

GO
/****** Object:  View [dbo].[ViewCOSEMMethod]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMMethod]
AS
SELECT     dbo.TableCOSEMMethod.ID, dbo.TableCOSEMMethod.COSEMClassID, RTRIM(dbo.TableCOSEMMethod.Name) AS Name, dbo.TableCOSEMMethod.Mandatory, 
                      dbo.TableCOSEMMethod.DataOwnerID, RTRIM(t.ClassName) AS COSEMClassName, dbo.TableCOSEMMethod.Standard
FROM         dbo.TableCOSEMMethod INNER JOIN
                      dbo.TableCOSEMClass AS t ON t.ID = dbo.TableCOSEMMethod.COSEMClassID

GO
/****** Object:  View [dbo].[ViewCOSEMObject]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMObject]
AS
SELECT     dbo.TableCOSEMObject.ID, dbo.TableCOSEMObject.COSEMLogicalDeviceID, dbo.TableCOSEMObject.COSEMClassID, dbo.TableCOSEMObject.DeviceTypeID, 
                      RTRIM(dbo.TableCOSEMObject.COSEMLogicalName) AS COSEMLogicalName, dbo.TableCOSEMObject.DataOwnerID, RTRIM(class.ClassName) AS COSEMClassName,
                       RTRIM(dt.Description) AS DeviceTypeName, class.Standard
FROM         dbo.TableCOSEMObject INNER JOIN
                      dbo.TableCOSEMClass AS class ON class.ID = dbo.TableCOSEMObject.COSEMClassID INNER JOIN
                      dbo.TableDeviceType AS dt ON dt.ID = dbo.TableCOSEMObject.DeviceTypeID

GO
/****** Object:  View [dbo].[ViewCOSEMStaticAttributeValue]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCOSEMStaticAttributeValue]
AS
SELECT     ID, COSEMAttibuteID, COSEMObjectID, COSEMDataTypeID, DataOwnerID
FROM         dbo.TableCOSEMStaticAttributeValue

GO
/****** Object:  View [dbo].[ViewCountry]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCountry]
AS
SELECT     ID, RTRIM(Country) AS Country, RTRIM(PhoneCode) AS PhoneCode, DataOwnerID
FROM         dbo.TableCountry

GO
/****** Object:  View [dbo].[ViewCurrentStateOperation]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCurrentStateOperation]
AS
SELECT        dbo.TableCurrentStateOperation.*
FROM            dbo.TableCurrentStateOperation

GO
/****** Object:  View [dbo].[ViewDataPoint]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDataPoint]
AS
SELECT        ID, MeasurementTime, AcquisitionTime, Value, RTRIM(Units) AS Units, SessionID, IsOBIS, QualityBad, DataOwnerID, ElementID, StringValue, Units AS Expr1
FROM            dbo.TableDataPoint

GO
/****** Object:  View [dbo].[ViewDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDataType]
AS
SELECT     dbo.TableDataType.ID, dbo.TableDataType.COSEMAttributeID, dbo.TableDataType.COSEMObjectID, dbo.TableDataType.DataOwnerID, 
                      RTRIM(dbo.TableDataType.Identifier) AS Identifier, dbo.TableCOSEMAttribute.Standard
FROM         dbo.TableDataType INNER JOIN
                      dbo.TableCOSEMAttribute ON dbo.TableDataType.COSEMAttributeID = dbo.TableCOSEMAttribute.ID

GO
/****** Object:  View [dbo].[ViewDeviceDataType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDeviceDataType]
AS
SELECT     ID, TypeID, DeviceID, DataOwnerID
FROM         dbo.TableDeviceDataType

GO
/****** Object:  View [dbo].[ViewDeviceScheduleParams]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDeviceScheduleParams]
AS
SELECT     td.ID, RTRIM(tg.MinutesE) AS MinutesE, RTRIM(tg.MinutesG) AS MinutesG, RTRIM(tg.MinMode) AS MinMode, RTRIM(tg.HoursE) AS HoursE, RTRIM(tg.HoursG) 
                      AS HoursG, RTRIM(tg.HourMode) AS HourMode, RTRIM(tg.DaysE) AS DaysE, RTRIM(tg.DaysG) AS DaysG, RTRIM(tg.DayMode) AS DayMode, RTRIM(tg.WeeksG) 
                      AS WeeksG, RTRIM(tg.WeekMode) AS WeekMode, tg.Monday, tg.Tuesday, tg.Wednesday, tg.Thursday, tg.Friday, tg.Saturday, tg.Sunday, tg.ID AS GroupID
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableGroup AS tg ON td.GroupID = tg.ID

GO
/****** Object:  View [dbo].[ViewDeviceType]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDeviceType]
AS
SELECT     ID, RTRIM(Description) AS Description, DataOwnerID, Standard
FROM         dbo.TableDeviceType

GO
/****** Object:  View [dbo].[ViewDeviceTypeAndOwner]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDeviceTypeAndOwner]
AS
SELECT     TOP (100) PERCENT td.ID, tg.ID AS GroupID, RTRIM(td.Name) AS DeviceName, RTRIM(tdt.Description) AS DeviceTypeName, RTRIM(tdo.FirstName) 
                      + ' ' + RTRIM(tdo.LastName) AS DeviceOwnerName, RTRIM(tg.Name) AS GroupName, RTRIM(td.IP1) + '.' + RTRIM(td.IP2) + '.' + RTRIM(td.IP3) + '.' + RTRIM(td.IP4) 
                      AS PrimaryIP, RTRIM(td.Port) AS PrimaryPort, RTRIM(td.SecondaryIP1) + '.' + RTRIM(td.SecondaryIP2) + '.' + RTRIM(td.SecondaryIP3) + '.' + RTRIM(td.SecondaryIP4) 
                      AS SecondaryIP, RTRIM(td.SecondaryPort) AS SecondaryPort, RTRIM(td.InternalAddress) AS InternalAddress, td.DataOwnerID, td.LocationAddressID
FROM         dbo.TableDevice AS td INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = td.TypeID LEFT OUTER JOIN
                      dbo.TableDeviceOwner AS tdo ON tdo.ID = td.OwnerID INNER JOIN
                      dbo.TableGroup AS tg ON tg.ID = td.GroupID
ORDER BY DeviceName

GO
/****** Object:  View [dbo].[ViewEvent]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent]
AS
SELECT     ID, Time, RTRIM(Event) AS Event, CategoryID, DeviceID, SessionID, DataOwnerID
FROM         dbo.TableEvent

GO
/****** Object:  View [dbo].[ViewEventCategory]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventCategory]
AS
SELECT     ID, RTRIM(Description) AS Description, DataOwnerID
FROM         dbo.TableEventCategory

GO
/****** Object:  View [dbo].[ViewFile]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewFile]
AS
SELECT     dbo.fake_File.*
FROM         dbo.fake_File

GO
/****** Object:  View [dbo].[ViewOBISGroup]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOBISGroup]
AS
SELECT     ID, RTRIM(Type) AS Type, Value, RTRIM(Description) AS Description, Standard, Reserved, Unusable, Context, DataOwnerID
FROM         dbo.TableOBISGroup

GO
/****** Object:  View [dbo].[ViewOBISSet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOBISSet]
AS
SELECT     dbo.TableOBISSet.ID, dbo.TableOBISSet.AID, dbo.TableOBISSet.BID, dbo.TableOBISSet.CID, dbo.TableOBISSet.DID, dbo.TableOBISSet.EID, dbo.TableOBISSet.FID, 
                      dbo.TableOBISSet.DeviceTypeID, dbo.TableOBISSet.DataOwnerID, g1.Value AS AValue, g2.Value AS BValue, g3.Value AS CValue, g4.Value AS DValue, 
                      g5.Value AS EValue, g6.Value AS FValue, RTRIM(tdt.Description) AS DeviceTypeName, dbo.TableOBISSet.Standard
FROM         dbo.TableOBISSet INNER JOIN
                      dbo.TableOBISGroup AS g1 ON g1.ID = dbo.TableOBISSet.AID INNER JOIN
                      dbo.TableOBISGroup AS g2 ON g2.ID = dbo.TableOBISSet.BID INNER JOIN
                      dbo.TableOBISGroup AS g3 ON g3.ID = dbo.TableOBISSet.CID INNER JOIN
                      dbo.TableOBISGroup AS g4 ON g4.ID = dbo.TableOBISSet.DID INNER JOIN
                      dbo.TableOBISGroup AS g5 ON g5.ID = dbo.TableOBISSet.EID INNER JOIN
                      dbo.TableOBISGroup AS g6 ON g6.ID = dbo.TableOBISSet.FID INNER JOIN
                      dbo.TableDeviceType AS tdt ON tdt.ID = dbo.TableOBISSet.DeviceTypeID

GO
/****** Object:  View [dbo].[ViewSchedule]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSchedule]
AS
SELECT     ID, DeviceID, NextActionTime, LastExecTime, ExecPID, RTRIM(ExecStationIP) AS ExecStationIP, DataOwnerID
FROM         dbo.TableSchedule

GO
/****** Object:  View [dbo].[ViewSeries]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewSeries]
AS
SELECT     StartTime, EndTime, Count, Units, Name
FROM         dbo.fake_Series


GO
/****** Object:  View [dbo].[ViewSession]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSession]
AS
SELECT     ID, DeviceID, StartTime, EndTime, RTRIM(SessionType) AS SessionType, ResultID, RTRIM(Parameters) AS Parameters, RTRIM(DeviceIdent) AS DeviceIdent, 
                      Secondary, DataOwnerID, Data
FROM         dbo.TableSession

GO
/****** Object:  View [dbo].[ViewState]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewState]
AS
SELECT     ID, RTRIM(State) AS State, CountryID, DataOwnerID
FROM         dbo.TableState

GO
/****** Object:  View [dbo].[ViewStreet]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStreet]
AS
SELECT     dbo.TableStreet.ID, RTRIM(dbo.TableStreet.Street) AS Street, dbo.TableStreet.CityID, dbo.TableStreet.DataOwnerID, dbo.TableCity.StateID, 
                      dbo.TableState.CountryID
FROM         dbo.TableStreet INNER JOIN
                      dbo.TableCity ON dbo.TableStreet.CityID = dbo.TableCity.ID INNER JOIN
                      dbo.TableState ON dbo.TableCity.StateID = dbo.TableState.ID

GO
/****** Object:  View [dbo].[ViewUser]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUser]
AS
SELECT     ID, RTRIM(FirstName) AS FirstName, RTRIM(LastName) AS LastName, RTRIM(UserName) AS UserName, RTRIM(Password) AS Password, RTRIM(Company) 
                      AS Company, DataOwnerID
FROM         dbo.TableUser

GO
/****** Object:  View [dbo].[ViewZipCode]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewZipCode]
AS
SELECT     ID, RTRIM(ZipCode) AS ZipCode, CountryID, DataOwnerID
FROM         dbo.TableZipCode

GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 21.08.2015 10:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 21.08.2015 10:59:42 ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 21.08.2015 10:59:42 ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 21.08.2015 10:59:42 ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 21.08.2015 10:59:42 ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TableCurrentStateConfig]    Script Date: 21.08.2015 10:59:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TableCurrentStateConfig] ON [dbo].[TableCurrentStateConfig]
(
	[CurrentStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  CONSTRAINT [DF__aspnet_Ap__Appli__06ED0088]  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  CONSTRAINT [DF__aspnet_Me__Passw__21A0F6C4]  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  CONSTRAINT [DF__aspnet_Pa__PathI__59E54FE7]  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__4301EA8F]  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__0CA5D9DE]  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__0D99FE17]  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__0E8E2250]  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[stat_RequestCount] ADD  CONSTRAINT [DF_stat_RequestCount_Count]  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[TableAppConfig] ADD  CONSTRAINT [DF_TableAppConfig_TestMode]  DEFAULT ((1)) FOR [TestMode]
GO
ALTER TABLE [dbo].[TableAppConfig] ADD  CONSTRAINT [DF_TableAppConfig_MaxAppLog]  DEFAULT ((100)) FOR [MaxAppLog]
GO
ALTER TABLE [dbo].[TableAppLog] ADD  CONSTRAINT [DF_TableAppLog_Message]  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[TableCurrentState] ADD  CONSTRAINT [DF_TableCurrentState_AcquisitionDisabled]  DEFAULT ((0)) FOR [AcquisitionDisabled]
GO
ALTER TABLE [dbo].[TableCurrentStateConfig] ADD  CONSTRAINT [DF_TableCurrentStateConfig_MaxSessionNumber]  DEFAULT ((100)) FOR [MaxSessionNumber]
GO
ALTER TABLE [dbo].[TableUnitTestResult] ADD  CONSTRAINT [DF_TableUserConfig_DeletedPointsCount]  DEFAULT ((0)) FOR [DeletedPointsCount]
GO
ALTER TABLE [dbo].[TableUnitTestResult] ADD  CONSTRAINT [DF_TableUnitTestResult_InsertedCurrentStateCount]  DEFAULT ((0)) FOR [InsertedCurrentStateCount]
GO
ALTER TABLE [dbo].[TableUnitTestResult] ADD  CONSTRAINT [DF_TableUnitTestResult_DeletedCurrentStateCount]  DEFAULT ((0)) FOR [DeletedCurrentStateCount]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__Appli__1FB8AE52] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__Appli__1FB8AE52]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__UserI__20ACD28B] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__UserI__20ACD28B]
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pa__Appli__58F12BAE] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Paths] CHECK CONSTRAINT [FK__aspnet_Pa__Appli__58F12BAE]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__60924D76] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__60924D76]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__664B26CC] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__664B26CC]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__UserI__673F4B05] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__UserI__673F4B05]
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pr__UserI__369C13AA] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile] CHECK CONSTRAINT [FK__aspnet_Pr__UserI__369C13AA]
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__420DC656] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__420DC656]
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__0BB1B5A5] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__0BB1B5A5]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__48BAC3E5] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__48BAC3E5]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__UserI__47C69FAC] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__UserI__47C69FAC]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [customers_pk] FOREIGN KEY([customerid])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [customers_pk]
GO
ALTER TABLE [dbo].[TableActorInfo]  WITH CHECK ADD  CONSTRAINT [FK_TableActorInfo_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableActorInfo] CHECK CONSTRAINT [FK_TableActorInfo_aspnet_Users]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableApartament] FOREIGN KEY([ApartamentID])
REFERENCES [dbo].[TableApartament] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableApartament]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableBuilding] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[TableBuilding] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableBuilding]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableCity] FOREIGN KEY([CityID])
REFERENCES [dbo].[TableCity] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableCity]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TableCountry] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableCountry]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableState] FOREIGN KEY([StateID])
REFERENCES [dbo].[TableState] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableState]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableStreet] FOREIGN KEY([StreetID])
REFERENCES [dbo].[TableStreet] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableStreet]
GO
ALTER TABLE [dbo].[TableAddress]  WITH CHECK ADD  CONSTRAINT [FK_TableAddress_TableZipCode] FOREIGN KEY([ZipCodeID])
REFERENCES [dbo].[TableZipCode] ([ID])
GO
ALTER TABLE [dbo].[TableAddress] CHECK CONSTRAINT [FK_TableAddress_TableZipCode]
GO
ALTER TABLE [dbo].[TableApartament]  WITH CHECK ADD  CONSTRAINT [FK_TableApartament_TableBuilding] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[TableBuilding] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableApartament] CHECK CONSTRAINT [FK_TableApartament_TableBuilding]
GO
ALTER TABLE [dbo].[TableBuilding]  WITH CHECK ADD  CONSTRAINT [FK_TableBuilding_TableStreet] FOREIGN KEY([StreetID])
REFERENCES [dbo].[TableStreet] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableBuilding] CHECK CONSTRAINT [FK_TableBuilding_TableStreet]
GO
ALTER TABLE [dbo].[TableChartsDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_TableChartsDataTypes_TableChart] FOREIGN KEY([ChartID])
REFERENCES [dbo].[TableChart] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableChartsDataTypes] CHECK CONSTRAINT [FK_TableChartsDataTypes_TableChart]
GO
ALTER TABLE [dbo].[TableChartsDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_TableChartsDataTypes_TableCurrentState] FOREIGN KEY([ElementID])
REFERENCES [dbo].[TableCurrentState] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableChartsDataTypes] CHECK CONSTRAINT [FK_TableChartsDataTypes_TableCurrentState]
GO
ALTER TABLE [dbo].[TableChartSetsCharts]  WITH CHECK ADD  CONSTRAINT [FK_TableChartSetsCharts_TableChart] FOREIGN KEY([ChartID])
REFERENCES [dbo].[TableChart] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableChartSetsCharts] CHECK CONSTRAINT [FK_TableChartSetsCharts_TableChart]
GO
ALTER TABLE [dbo].[TableChartSetsCharts]  WITH CHECK ADD  CONSTRAINT [FK_TableChartSetsCharts_TableChartSet] FOREIGN KEY([ChartSetID])
REFERENCES [dbo].[TableChartSet] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableChartSetsCharts] CHECK CONSTRAINT [FK_TableChartSetsCharts_TableChartSet]
GO
ALTER TABLE [dbo].[TableCity]  WITH CHECK ADD  CONSTRAINT [FK_TableCity_TableState] FOREIGN KEY([StateID])
REFERENCES [dbo].[TableState] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCity] CHECK CONSTRAINT [FK_TableCity_TableState]
GO
ALTER TABLE [dbo].[TableCOSEMAttribute]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMAttribute_TableCOSEMClass] FOREIGN KEY([COSEMClassID])
REFERENCES [dbo].[TableCOSEMClass] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCOSEMAttribute] CHECK CONSTRAINT [FK_TableCOSEMAttribute_TableCOSEMClass]
GO
ALTER TABLE [dbo].[TableCOSEMAttribute]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMAttribute_TableCOSEMDataType] FOREIGN KEY([COSEMDataTypeID])
REFERENCES [dbo].[TableCOSEMDataType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCOSEMAttribute] CHECK CONSTRAINT [FK_TableCOSEMAttribute_TableCOSEMDataType]
GO
ALTER TABLE [dbo].[TableCOSEMComplexTypeField]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMComplexTypeField_TableCOSEMDataType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TableCOSEMDataType] ([ID])
GO
ALTER TABLE [dbo].[TableCOSEMComplexTypeField] CHECK CONSTRAINT [FK_TableCOSEMComplexTypeField_TableCOSEMDataType]
GO
ALTER TABLE [dbo].[TableCOSEMComplexTypeField]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMComplexTypeField_TableCOSEMDataType1] FOREIGN KEY([AggregateTypeID])
REFERENCES [dbo].[TableCOSEMDataType] ([ID])
GO
ALTER TABLE [dbo].[TableCOSEMComplexTypeField] CHECK CONSTRAINT [FK_TableCOSEMComplexTypeField_TableCOSEMDataType1]
GO
ALTER TABLE [dbo].[TableCOSEMDataType]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMDataType_TableCOSEMDataType] FOREIGN KEY([AncestorTypeID])
REFERENCES [dbo].[TableCOSEMDataType] ([ID])
GO
ALTER TABLE [dbo].[TableCOSEMDataType] CHECK CONSTRAINT [FK_TableCOSEMDataType_TableCOSEMDataType]
GO
ALTER TABLE [dbo].[TableCOSEMLogicalDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMLogicalDevice_TableDeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCOSEMLogicalDevice] CHECK CONSTRAINT [FK_TableCOSEMLogicalDevice_TableDeviceType]
GO
ALTER TABLE [dbo].[TableCOSEMMethod]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMMethod_TableCOSEMClass] FOREIGN KEY([COSEMClassID])
REFERENCES [dbo].[TableCOSEMClass] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCOSEMMethod] CHECK CONSTRAINT [FK_TableCOSEMMethod_TableCOSEMClass]
GO
ALTER TABLE [dbo].[TableCOSEMObject]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMObject_TableCOSEMClass] FOREIGN KEY([COSEMClassID])
REFERENCES [dbo].[TableCOSEMClass] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCOSEMObject] CHECK CONSTRAINT [FK_TableCOSEMObject_TableCOSEMClass]
GO
ALTER TABLE [dbo].[TableCOSEMObject]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMObject_TableCOSEMLogicalDevices] FOREIGN KEY([COSEMLogicalDeviceID])
REFERENCES [dbo].[TableCOSEMLogicalDevice] ([ID])
GO
ALTER TABLE [dbo].[TableCOSEMObject] CHECK CONSTRAINT [FK_TableCOSEMObject_TableCOSEMLogicalDevices]
GO
ALTER TABLE [dbo].[TableCOSEMObject]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMObject_TableDeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
GO
ALTER TABLE [dbo].[TableCOSEMObject] CHECK CONSTRAINT [FK_TableCOSEMObject_TableDeviceType]
GO
ALTER TABLE [dbo].[TableCOSEMStaticAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_TableCOSEMStaticAttributeValues_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableCOSEMStaticAttributeValue] CHECK CONSTRAINT [FK_TableCOSEMStaticAttributeValues_aspnet_Users]
GO
ALTER TABLE [dbo].[TableCurrentState]  WITH CHECK ADD  CONSTRAINT [FK_TableCurrentState_TableDataType] FOREIGN KEY([DataTypeID])
REFERENCES [dbo].[TableDataType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCurrentState] CHECK CONSTRAINT [FK_TableCurrentState_TableDataType]
GO
ALTER TABLE [dbo].[TableCurrentState]  WITH CHECK ADD  CONSTRAINT [FK_TableCurrentState_TableDevice] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[TableDevice] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCurrentState] CHECK CONSTRAINT [FK_TableCurrentState_TableDevice]
GO
ALTER TABLE [dbo].[TableCurrentStateOperation]  WITH CHECK ADD  CONSTRAINT [FK_TableCurrentStateOperation_TableCurrentState] FOREIGN KEY([CurrentStateID])
REFERENCES [dbo].[TableCurrentState] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableCurrentStateOperation] CHECK CONSTRAINT [FK_TableCurrentStateOperation_TableCurrentState]
GO
ALTER TABLE [dbo].[TableDataPoint]  WITH CHECK ADD  CONSTRAINT [FK_TableDataPoint_TableCurrentState] FOREIGN KEY([ElementID])
REFERENCES [dbo].[TableCurrentState] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableDataPoint] CHECK CONSTRAINT [FK_TableDataPoint_TableCurrentState]
GO
ALTER TABLE [dbo].[TableDataPoint]  WITH CHECK ADD  CONSTRAINT [FK_TableDataPoint62056_TableSession62056] FOREIGN KEY([SessionID])
REFERENCES [dbo].[TableSession] ([ID])
GO
ALTER TABLE [dbo].[TableDataPoint] CHECK CONSTRAINT [FK_TableDataPoint62056_TableSession62056]
GO
ALTER TABLE [dbo].[TableDataType]  WITH CHECK ADD  CONSTRAINT [FK_TableDataType_TableCOSEMAttribute] FOREIGN KEY([COSEMAttributeID])
REFERENCES [dbo].[TableCOSEMAttribute] ([ID])
GO
ALTER TABLE [dbo].[TableDataType] CHECK CONSTRAINT [FK_TableDataType_TableCOSEMAttribute]
GO
ALTER TABLE [dbo].[TableDataType]  WITH CHECK ADD  CONSTRAINT [FK_TableDataType_TableCOSEMObject] FOREIGN KEY([COSEMObjectID])
REFERENCES [dbo].[TableCOSEMObject] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableDataType] CHECK CONSTRAINT [FK_TableDataType_TableCOSEMObject]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableAddress] FOREIGN KEY([LocationAddressID])
REFERENCES [dbo].[TableAddress] ([ID])
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableAddress]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableAddress1] FOREIGN KEY([BillAddressID])
REFERENCES [dbo].[TableAddress] ([ID])
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableAddress1]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableDeviceOwner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[TableDeviceOwner] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableDeviceOwner]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableDeviceType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableDeviceType]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[TableGroup] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableGroup]
GO
ALTER TABLE [dbo].[TableDevice]  WITH CHECK ADD  CONSTRAINT [FK_TableDevice_TableLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[TableLocation] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TableDevice] CHECK CONSTRAINT [FK_TableDevice_TableLocation]
GO
ALTER TABLE [dbo].[TableDeviceDataType]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceDataType_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableDeviceDataType] CHECK CONSTRAINT [FK_TableDeviceDataType_aspnet_Users]
GO
ALTER TABLE [dbo].[TableDeviceLog]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceLog_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableDeviceLog] CHECK CONSTRAINT [FK_TableDeviceLog_aspnet_Users]
GO
ALTER TABLE [dbo].[TableDeviceOBISGroup]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceOBISGroup_TableDeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableDeviceOBISGroup] CHECK CONSTRAINT [FK_TableDeviceOBISGroup_TableDeviceType]
GO
ALTER TABLE [dbo].[TableDeviceOBISGroup]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceOBISGroup_TableOBISGroup] FOREIGN KEY([OBISGroupID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableDeviceOBISGroup] CHECK CONSTRAINT [FK_TableDeviceOBISGroup_TableOBISGroup]
GO
ALTER TABLE [dbo].[TableDeviceOwner]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceOwner_TableAddress] FOREIGN KEY([AddressID])
REFERENCES [dbo].[TableAddress] ([ID])
GO
ALTER TABLE [dbo].[TableDeviceOwner] CHECK CONSTRAINT [FK_TableDeviceOwner_TableAddress]
GO
ALTER TABLE [dbo].[TableDeviceOwnerLog]  WITH CHECK ADD  CONSTRAINT [FK_TableDeviceOwnerLog_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableDeviceOwnerLog] CHECK CONSTRAINT [FK_TableDeviceOwnerLog_aspnet_Users]
GO
ALTER TABLE [dbo].[TableEvent]  WITH CHECK ADD  CONSTRAINT [FK_TableEvent_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableEvent] CHECK CONSTRAINT [FK_TableEvent_aspnet_Users]
GO
ALTER TABLE [dbo].[TableEvent]  WITH CHECK ADD  CONSTRAINT [FK_TableEvent_TableDevice] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[TableDevice] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableEvent] CHECK CONSTRAINT [FK_TableEvent_TableDevice]
GO
ALTER TABLE [dbo].[TableEvent]  WITH CHECK ADD  CONSTRAINT [FK_TableEvent_TableEventCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TableEventCategory] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TableEvent] CHECK CONSTRAINT [FK_TableEvent_TableEventCategory]
GO
ALTER TABLE [dbo].[TableEvent]  WITH CHECK ADD  CONSTRAINT [FK_TableEvent_TableSession] FOREIGN KEY([SessionID])
REFERENCES [dbo].[TableSession] ([ID])
GO
ALTER TABLE [dbo].[TableEvent] CHECK CONSTRAINT [FK_TableEvent_TableSession]
GO
ALTER TABLE [dbo].[TableEventCategory]  WITH CHECK ADD  CONSTRAINT [FK_TableEventCategory_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableEventCategory] CHECK CONSTRAINT [FK_TableEventCategory_aspnet_Users]
GO
ALTER TABLE [dbo].[TableGroup]  WITH CHECK ADD  CONSTRAINT [FK_TableGroup_TableDeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableGroup] CHECK CONSTRAINT [FK_TableGroup_TableDeviceType]
GO
ALTER TABLE [dbo].[TableGroupLog]  WITH CHECK ADD  CONSTRAINT [FK_TableGroupLog_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableGroupLog] CHECK CONSTRAINT [FK_TableGroupLog_aspnet_Users]
GO
ALTER TABLE [dbo].[TableOBISGroupLink]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISGroupLink_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableOBISGroupLink] CHECK CONSTRAINT [FK_TableOBISGroupLink_aspnet_Users]
GO
ALTER TABLE [dbo].[TableOBISGroupLink]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISGroupLink_TableOBISGroup] FOREIGN KEY([TopLevelOBISGroupID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISGroupLink] CHECK CONSTRAINT [FK_TableOBISGroupLink_TableOBISGroup]
GO
ALTER TABLE [dbo].[TableOBISGroupLink]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISGroupLink_TableOBISGroup1] FOREIGN KEY([OBISGroupID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISGroupLink] CHECK CONSTRAINT [FK_TableOBISGroupLink_TableOBISGroup1]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableDeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[TableDeviceType] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableDeviceType]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupA] FOREIGN KEY([AID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupA]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupB] FOREIGN KEY([BID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupB]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupC] FOREIGN KEY([CID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupC]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupD] FOREIGN KEY([DID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupD]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupE] FOREIGN KEY([EID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupE]
GO
ALTER TABLE [dbo].[TableOBISSet]  WITH CHECK ADD  CONSTRAINT [FK_TableOBISSet_TableOBISGroupF] FOREIGN KEY([FID])
REFERENCES [dbo].[TableOBISGroup] ([ID])
GO
ALTER TABLE [dbo].[TableOBISSet] CHECK CONSTRAINT [FK_TableOBISSet_TableOBISGroupF]
GO
ALTER TABLE [dbo].[TableProcessLogMessages]  WITH CHECK ADD  CONSTRAINT [FK_TableProcessLogMessages_TableProcessLogContents] FOREIGN KEY([ContentsID])
REFERENCES [dbo].[TableProcessLogContents] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableProcessLogMessages] CHECK CONSTRAINT [FK_TableProcessLogMessages_TableProcessLogContents]
GO
ALTER TABLE [dbo].[TableSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TableShedule_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableSchedule] CHECK CONSTRAINT [FK_TableShedule_aspnet_Users]
GO
ALTER TABLE [dbo].[TableSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TableShedule_TableDevice] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[TableDevice] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableSchedule] CHECK CONSTRAINT [FK_TableShedule_TableDevice]
GO
ALTER TABLE [dbo].[TableSession]  WITH CHECK ADD  CONSTRAINT [FK_TableSession_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableSession] CHECK CONSTRAINT [FK_TableSession_aspnet_Users]
GO
ALTER TABLE [dbo].[TableSession]  WITH CHECK ADD  CONSTRAINT [FK_TableSession62056_TableDevice] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[TableDevice] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableSession] CHECK CONSTRAINT [FK_TableSession62056_TableDevice]
GO
ALTER TABLE [dbo].[TableState]  WITH CHECK ADD  CONSTRAINT [FK_TableState_TableCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TableCountry] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableState] CHECK CONSTRAINT [FK_TableState_TableCountry]
GO
ALTER TABLE [dbo].[TableStreet]  WITH CHECK ADD  CONSTRAINT [FK_TableStreet_TableCity] FOREIGN KEY([CityID])
REFERENCES [dbo].[TableCity] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableStreet] CHECK CONSTRAINT [FK_TableStreet_TableCity]
GO
ALTER TABLE [dbo].[TableUser]  WITH CHECK ADD  CONSTRAINT [FK_TableUser_aspnet_Users] FOREIGN KEY([DataOwnerID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[TableUser] CHECK CONSTRAINT [FK_TableUser_aspnet_Users]
GO
ALTER TABLE [dbo].[TableYouTubeAttribute]  WITH CHECK ADD  CONSTRAINT [FK_TableYouTubeAttributes_TableDevice] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[TableDevice] ([ID])
GO
ALTER TABLE [dbo].[TableYouTubeAttribute] CHECK CONSTRAINT [FK_TableYouTubeAttributes_TableDevice]
GO
ALTER TABLE [dbo].[TableYouTubeAttributeKeyword]  WITH CHECK ADD  CONSTRAINT [FK_TableYouTubeAttributeKeyword_TableYouTubeAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[TableYouTubeAttribute] ([ID])
GO
ALTER TABLE [dbo].[TableYouTubeAttributeKeyword] CHECK CONSTRAINT [FK_TableYouTubeAttributeKeyword_TableYouTubeAttribute]
GO
ALTER TABLE [dbo].[TableYouTubeAttributeKeyword]  WITH CHECK ADD  CONSTRAINT [FK_TableYouTubeAttributeKeyword_TableYouTubeKeyword] FOREIGN KEY([KeywordId])
REFERENCES [dbo].[TableYouTubeKeyword] ([ID])
GO
ALTER TABLE [dbo].[TableYouTubeAttributeKeyword] CHECK CONSTRAINT [FK_TableYouTubeAttributeKeyword_TableYouTubeKeyword]
GO
ALTER TABLE [dbo].[TableYouTubeAttributeTag]  WITH CHECK ADD  CONSTRAINT [FK_TableAttributeTag_TableYouTubeAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[TableYouTubeAttribute] ([ID])
GO
ALTER TABLE [dbo].[TableYouTubeAttributeTag] CHECK CONSTRAINT [FK_TableAttributeTag_TableYouTubeAttribute]
GO
ALTER TABLE [dbo].[TableYouTubeAttributeTag]  WITH CHECK ADD  CONSTRAINT [FK_TableAttributeTag_TableYouTubeTag] FOREIGN KEY([TagId])
REFERENCES [dbo].[TableYouTubeTag] ([ID])
GO
ALTER TABLE [dbo].[TableYouTubeAttributeTag] CHECK CONSTRAINT [FK_TableAttributeTag_TableYouTubeTag]
GO
ALTER TABLE [dbo].[TableZipCode]  WITH CHECK ADD  CONSTRAINT [FK_TableZipCode_TableCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TableCountry] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TableZipCode] CHECK CONSTRAINT [FK_TableZipCode_TableCountry]
GO
ALTER TABLE [dbo].[TableChart]  WITH CHECK ADD  CONSTRAINT [CK_TableChart_DataSetMaxCount] CHECK  (([DataSetMaxCount]>=(2) AND [DataSetMaxCount]<=(1000)))
GO
ALTER TABLE [dbo].[TableChart] CHECK CONSTRAINT [CK_TableChart_DataSetMaxCount]
GO
ALTER TABLE [dbo].[TableChart]  WITH CHECK ADD  CONSTRAINT [CK_TableChart_Height] CHECK  (([Height]>=(30) AND [Height]<=(2000)))
GO
ALTER TABLE [dbo].[TableChart] CHECK CONSTRAINT [CK_TableChart_Height]
GO
ALTER TABLE [dbo].[TableChart]  WITH CHECK ADD  CONSTRAINT [CK_TableChart_Width] CHECK  (([Width]>=(30) AND [Width]<=(2000)))
GO
ALTER TABLE [dbo].[TableChart] CHECK CONSTRAINT [CK_TableChart_Width]
GO
ALTER TABLE [dbo].[TableChartSet]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetProperties_CellHeight] CHECK  (([CellHeight]>=(30) AND [CellHeight]<=(2000)))
GO
ALTER TABLE [dbo].[TableChartSet] CHECK CONSTRAINT [CK_TableChartSetProperties_CellHeight]
GO
ALTER TABLE [dbo].[TableChartSet]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetProperties_CellWidth] CHECK  (([CellWidth]>=(30) AND [CellWidth]<=(2000)))
GO
ALTER TABLE [dbo].[TableChartSet] CHECK CONSTRAINT [CK_TableChartSetProperties_CellWidth]
GO
ALTER TABLE [dbo].[TableChartSet]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetProperties_Cols] CHECK  (([Cols]>=(0) AND [Cols]<=(100)))
GO
ALTER TABLE [dbo].[TableChartSet] CHECK CONSTRAINT [CK_TableChartSetProperties_Cols]
GO
ALTER TABLE [dbo].[TableChartSet]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetProperties_Margin] CHECK  (([Margin]>=(0) AND [Margin]<=(50)))
GO
ALTER TABLE [dbo].[TableChartSet] CHECK CONSTRAINT [CK_TableChartSetProperties_Margin]
GO
ALTER TABLE [dbo].[TableChartSet]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetProperties_Rows] CHECK  (([Rows]>=(0) AND [Rows]<=(100)))
GO
ALTER TABLE [dbo].[TableChartSet] CHECK CONSTRAINT [CK_TableChartSetProperties_Rows]
GO
ALTER TABLE [dbo].[TableChartSetsCharts]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetsCharts_ColIndex] CHECK  (([ColIndex]>=(0) AND [ColIndex]<(1000)))
GO
ALTER TABLE [dbo].[TableChartSetsCharts] CHECK CONSTRAINT [CK_TableChartSetsCharts_ColIndex]
GO
ALTER TABLE [dbo].[TableChartSetsCharts]  WITH CHECK ADD  CONSTRAINT [CK_TableChartSetsCharts_RowIndex] CHECK  (([RowIndex]>=(0) AND [RowIndex]<(1000)))
GO
ALTER TABLE [dbo].[TableChartSetsCharts] CHECK CONSTRAINT [CK_TableChartSetsCharts_RowIndex]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of URL requests.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stat_RequestCount', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableAppAttribute', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key. The current config is that with max. value of id.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableAppConfig', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The application works in test mode (some functions are turned off).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableAppConfig', @level2type=N'COLUMN',@level2name=N'TestMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Must be of fixed size for maximum insertion performance.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableAppLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String identifier describing operation type.

https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableCurrentStateOperation', @level2type=N'COLUMN',@level2name=N'OperationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of rows inserted into the TableDatePoint during the unit test.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUnitTestResult', @level2type=N'COLUMN',@level2name=N'DeletedPointsCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of rows inserted into the TableCurrentState during the unit test.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUnitTestResult', @level2type=N'COLUMN',@level2name=N'InsertedCurrentStateCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of rows deleted from the TableCurrentState during the unit test.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUnitTestResult', @level2type=N'COLUMN',@level2name=N'DeletedCurrentStateCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[22] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vein"
            Begin Extent = 
               Top = 26
               Left = 41
               Bottom = 263
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "tcdt"
            Begin Extent = 
               Top = 28
               Left = 336
               Bottom = 161
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vd"
            Begin Extent = 
               Top = 197
               Left = 334
               Bottom = 361
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 19
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewChartsDevices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewChartsDevices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Добавляет IP-адрес и порт камеры к данным представления.

https://www.evernote.com/shard/s132/nl/14501366/515ae7cc-5203-4cb2-be8f-94f5e858d71f' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewChartSetsChartsExt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 250
               Right = 546
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 255
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewChartSetsChartsExt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewChartSetsChartsExt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 241
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 135
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t3"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 165
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2655
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCurrentState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCurrentState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of operations which are in processing for given data source.

https://www.evernote.com/shard/s132/nl/14501366/f009fc13-485e-4c05-b810-338893bab459' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCurrentStateOperation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TableCurrentStateOperation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCurrentStateOperation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCurrentStateOperation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TableDataPoint"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 233
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDataPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDataPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "td"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 117
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "tdt"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 117
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tg"
            Begin Extent = 
               Top = 144
               Left = 247
               Bottom = 255
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4260
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vein"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tcdt"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 135
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vd"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 135
               Right = 669
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDevicesWithCharts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDevicesWithCharts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[24] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewElementInstanceName"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 117
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ViewChartsDataTypes"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 117
               Right = 388
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewElementFiltered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewElementFiltered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[62] 4[2] 2[35] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -97
      End
      Begin Tables = 
         Begin Table = "TableDataType"
            Begin Extent = 
               Top = 6
               Left = 871
               Bottom = 117
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TableDevice"
            Begin Extent = 
               Top = 386
               Left = 868
               Bottom = 662
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TableDeviceType"
            Begin Extent = 
               Top = 152
               Left = 48
               Bottom = 266
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TableGroup"
            Begin Extent = 
               Top = 509
               Left = 468
               Bottom = 722
               Right = 669
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "TableCOSEMLogicalDevice"
            Begin Extent = 
               Top = 136
               Left = 873
               Bottom = 247
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TableCOSEMObject"
            Begin Extent = 
               Top = 297
               Left = 50
               Bottom = 408
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TableCOSEMClass"
            Begin Extent = 
               Top = 260
               Left = 870
               Bottom = 371
               ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewElementInstanceName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TableCOSEMAttribute"
            Begin Extent = 
               Top = 438
               Left = 51
               Bottom = 549
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ViewCurrentState"
            Begin Extent = 
               Top = 7
               Left = 90
               Bottom = 137
               Right = 287
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3870
         Alias = 4320
         Table = 2490
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewElementInstanceName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewElementInstanceName'
GO
USE [master]
GO
ALTER DATABASE [Glovis.Www.Dev] SET  READ_WRITE 
GO
