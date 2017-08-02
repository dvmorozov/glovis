
USE SGMasterBase
GO

DROP PROCEDURE GetPointsVsAcqTime_Last_Internal 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 19/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetPointsVsAcqTime_Last_Internal 
	@LastPointCount BIGINT,
	@DataTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	WITH XMLNAMESPACES ('http://www.rationalcity.com/data.xsd' AS mstns, DEFAULT 'http://www.rationalcity.com/data.xsd')
	SELECT * FROM (
		SELECT TOP(@LastPointCount) AcquisitionTime, Value FROM TableDataPoint
		WHERE DataTypeID = @DataTypeID AND DataOwnerID = @DataOwnerID
		-- order to get "last" values
		ORDER BY AcquisitionTime DESC) AS t
	ORDER BY t.AcquisitionTime ASC
	FOR XML RAW('DataPoint'), ELEMENTS, ROOT('DataSet')
END
GO
