
DROP PROCEDURE AddChart
GO

DROP PROCEDURE AddChartInternal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 21/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE AddChartInternal
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

-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddChart 
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
