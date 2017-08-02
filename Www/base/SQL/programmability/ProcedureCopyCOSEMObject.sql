
DROP PROCEDURE CopyCOSEMObject
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 24/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE CopyCOSEMObject 
	@OldObjectID BIGINT,
	@NewCOSEMLogicalDeviceID BIGINT,
	@NewDeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	
	DECLARE @OldClassID BIGINT
	DECLARE @NewClassID BIGINT
	
	SELECT @OldClassID = COSEMClassID FROM TableCOSEMObject
	WHERE ID = @OldObjectID -- check of DataOwnerID is forbidden
	-- the procedure creates new class instantion and its attributes
	EXEC CopyCOSEMClass @OldClassID, @DataOwnerID, @NewClassID OUTPUT
	
	-- creating new object instance
	DECLARE @IDs TABLE (ID BIGINT)
	INSERT INTO TableCOSEMObject 
		(COSEMLogicalDeviceID, COSEMClassID, DeviceTypeID, COSEMLogicalName, DataOwnerID)
	OUTPUT INSERTED.ID INTO @IDs
	SELECT @NewCOSEMLogicalDeviceID, @NewClassID, @NewDeviceTypeID, COSEMLogicalName, @DataOwnerID
	FROM TableCOSEMObject
	WHERE ID = @OldObjectID
	
	DECLARE @NewObjectID BIGINT
	SET @NewObjectID = (SELECT MAX(ID) FROM @IDs)
	
	-- copying attribute-object identifiers
	DECLARE @Cursor CURSOR, @NewAttributeID BIGINT, @AttrName NVARCHAR(MAX)
	SET @Cursor = CURSOR FOR 
		SELECT ID, Name
		FROM TableCOSEMAttribute
		WHERE COSEMClassID = @NewClassID AND DataOwnerID = @DataOwnerID
	OPEN @Cursor

	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @NewAttributeID, @AttrName
		IF @@fetch_status <> 0 BREAK
		
		INSERT INTO TableDataType (Identifier, COSEMAttributeID, COSEMObjectID, DataOwnerID)
		SELECT @AttrName, @NewAttributeID, @NewObjectID, @DataOwnerID
	END		
	
	COMMIT
END
GO
