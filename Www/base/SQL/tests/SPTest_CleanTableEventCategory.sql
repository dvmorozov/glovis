
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableEventCategory
GO

CREATE PROCEDURE SPTest_CleanTableEventCategory
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