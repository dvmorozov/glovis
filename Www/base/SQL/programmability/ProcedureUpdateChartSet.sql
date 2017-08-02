
DROP PROCEDURE UpdateChartSet
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
CREATE PROCEDURE UpdateChartSet 
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
