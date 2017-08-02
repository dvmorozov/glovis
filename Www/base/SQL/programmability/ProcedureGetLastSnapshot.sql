
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE GetLastSnapshot
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 01/07/2012
-- Description:	
-- =============================================
CREATE PROCEDURE GetLastSnapshot 
	@SerieID UNIQUEIDENTIFIER,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @T TABLE (AcquisitionTime DATETIME2(7), Value DECIMAL(19, 6), ElementID BIGINT, StringValue VARCHAR(MAX))
	
	--	optimized variant
	INSERT INTO @T

	SELECT TOP(1) AcquisitionTime, Value, ElementID, StringValue
	FROM TableDataPoint
	WHERE DataOwnerID = @DataOwnerID AND Units = @SerieID
	ORDER BY CAST(Value AS BIGINT) DESC
	
	SELECT CONVERT(FLOAT, CONVERT(DATETIME, AcquisitionTime)) AS Time, Value, StringValue, ElementID, AcquisitionTime AS OriginalAcqTime FROM @T
END
GO
