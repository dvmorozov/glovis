
DROP PROCEDURE AddState
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
CREATE PROCEDURE AddState
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
