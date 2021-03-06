
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanTableEvent
GO

CREATE PROCEDURE SPTest_CleanTableEvent
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