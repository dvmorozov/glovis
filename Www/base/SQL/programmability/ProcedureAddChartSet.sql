
DROP PROCEDURE AddChartSet
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 12/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddChartSet 
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
