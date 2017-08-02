
DROP PROCEDURE AddElementToChart
GO

DROP PROCEDURE AddElementToChartInternal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 27/05/2013
-- Description:	
-- =============================================
CREATE PROCEDURE AddElementToChartInternal 
	@ElementID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	INSERT INTO TableChartsDataTypes (ChartID, ElementID, DataOwnerID)
	VALUES (@ChartID, @ElementID, @DataOwnerID)
END
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 23/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddElementToChart 
	@ElementID BIGINT,
	@ChartID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableChartsDataTypes
	WHERE @ChartID = ChartID AND @DataOwnerID = DataOwnerID
	
	IF @Count < 10
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartsDataTypes
		WHERE @ChartID = ChartID AND @ElementID = ElementID AND 
			@DataOwnerID = DataOwnerID
			
		IF @Count = 0
		BEGIN
			EXEC AddElementToChartInternal @ElementID, @ChartID, @DataOwnerID
			
			SELECT 1
		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
