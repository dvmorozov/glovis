
DROP PROCEDURE AddApartament
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
CREATE PROCEDURE AddApartament
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
