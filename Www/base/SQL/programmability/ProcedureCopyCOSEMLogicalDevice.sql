
DROP PROCEDURE CopyCOSEMLogicalDevice
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
CREATE PROCEDURE CopyCOSEMLogicalDevice 
	@OldLogicalDeviceID BIGINT,
	@NewDeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION

	DECLARE @LogicalDeviceIDs TABLE (ID BIGINT)

	INSERT INTO TableCOSEMLogicalDevice (DeviceTypeID, DataOwnerID, Name, SeqNum)
	OUTPUT INSERTED.ID INTO @LogicalDeviceIDs	
	SELECT @NewDeviceTypeID, @DataOwnerID, Name, SeqNum
	FROM TableCOSEMLogicalDevice
	WHERE ID = @OldLogicalDeviceID
	
	DECLARE @NewLogicalDeviceID BIGINT
	SELECT @NewLogicalDeviceID = MAX(ID) FROM @LogicalDeviceIDs
	
	DECLARE @Cursor CURSOR, @OldCOSEMObjectID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM TableCOSEMObject
		WHERE COSEMLogicalDeviceID = @OldLogicalDeviceID
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldCOSEMObjectID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMObject @OldCOSEMObjectID,	@NewLogicalDeviceID, @NewDeviceTypeID, @DataOwnerID
	END	
	
	COMMIT
END
GO
