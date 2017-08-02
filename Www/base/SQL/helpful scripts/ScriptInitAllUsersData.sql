
USE Oonze
GO

DECLARE @Users TABLE(ID UNIQUEIDENTIFIER NOT NULL)
INSERT INTO @Users 
SELECT UserId FROM aspnet_Users

DECLARE @DeviceTypeID BIGINT
SET @DeviceTypeID = (SELECT TOP(1) ID FROM TableDeviceType
WHERE Description = 'Video Recorder')

PRINT @DeviceTypeID

IF @DeviceTypeID IS NOT NULL
BEGIN
	DECLARE @UserID UNIQUEIDENTIFIER

	DECLARE UserCursor CURSOR FOR 
	SELECT ID FROM @Users

	OPEN UserCursor

	FETCH NEXT FROM UserCursor 
	INTO @UserID

	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @UserID
		
		EXEC InitUserData @UserID, @DeviceTypeID
		
		FETCH NEXT FROM UserCursor 
		INTO @UserID
	END

	CLOSE UserCursor
	DEALLOCATE UserCursor
END