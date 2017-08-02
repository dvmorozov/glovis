
USE SGMasterBase
GO

DECLARE @ChartID BIGINT = 8
DECLARE @DataOwnerID UNIQUEIDENTIFIER
DECLARE @Path VARCHAR(255) = 'C:\TEMP'
DECLARE @LastPointCount BIGINT = 10

SELECT @DataOwnerID = DataOwnerID FROM TableChart WHERE ID = @ChartID

EXEC GetPointsVsAcqTimeDataset_Last @ChartID, @DataOwnerID,	@LastPointCount
