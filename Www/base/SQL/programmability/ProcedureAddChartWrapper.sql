
DROP PROCEDURE AddChartWrapper
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 26/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE AddChartWrapper 
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
