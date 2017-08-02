
DROP PROCEDURE UpdateChart
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateChart
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
