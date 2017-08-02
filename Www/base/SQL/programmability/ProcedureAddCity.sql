
DROP PROCEDURE AddCity
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
CREATE PROCEDURE AddCity
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
