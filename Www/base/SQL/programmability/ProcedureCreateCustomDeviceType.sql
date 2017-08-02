
DROP PROCEDURE CreateCustomDeviceType
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/01/2012
-- Description:	
-- =============================================
CREATE PROCEDURE CreateCustomDeviceType 
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	
	-- create unique device type name
	DECLARE @UniqName NVARCHAR(MAX)
	SELECT @UniqName = Description
	FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	SET @UniqName = 'Custom ' + @UniqName

	DECLARE @SameNameCount BIGINT
	SELECT @SameNameCount = COUNT(*) 
	FROM TableDeviceType
	WHERE Description LIKE RTRIM(@UniqName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)

	IF @SameNameCount > 0
	BEGIN
		SET @UniqName = RTRIM(@UniqName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
	END

	DECLARE @DeviceTypeIDs TABLE (ID BIGINT)
	
	INSERT INTO TableDeviceType (Description, DataOwnerID, Standard)
	OUTPUT INSERTED.ID INTO @DeviceTypeIDs
	SELECT @UniqName, @DataOwnerID, Standard
	FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	
	DECLARE @NewDeviceTypeID BIGINT
	SET @NewDeviceTypeID = (SELECT MAX(ID) FROM @DeviceTypeIDs)
	
	DECLARE @Cursor CURSOR, @OldLogicalDeviceID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldLogicalDeviceID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMLogicalDevice @OldLogicalDeviceID, @NewDeviceTypeID, @DataOwnerID
	END		
		
	COMMIT
END
GO
