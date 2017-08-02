
DROP PROCEDURE CopyCOSEMClass
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
CREATE PROCEDURE CopyCOSEMClass 
	@OldClassID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@NewClassID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	
	DECLARE @ClassName NVARCHAR(MAX)
	SELECT @ClassName = ClassName
	FROM TableCOSEMClass
	WHERE ID = @OldClassID

	DECLARE @SameNameCount BIGINT
	SELECT @SameNameCount = COUNT(*) 
	FROM TableCOSEMClass
	WHERE ClassName LIKE RTRIM(@ClassName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)
	
	DECLARE @UniqClassName NVARCHAR(100)
	SET @UniqClassName = @ClassName
	
	IF @SameNameCount > 0
	BEGIN
		SELECT @UniqClassName = RTRIM(@UniqClassName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
	END
		
	DECLARE @IDs TABLE (ID BIGINT)
	INSERT INTO TableCOSEMClass 
		(ClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, DataOwnerID, Standard)
	OUTPUT INSERTED.ID INTO @IDs
	SELECT @UniqClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, @DataOwnerID, 0
	FROM TableCOSEMClass
	WHERE ID = @OldClassID
	
	DECLARE @NewCOSEMClassID BIGINT
	SELECT @NewCOSEMClassID = MAX(ID) FROM @IDs
	SELECT @NewClassID = @NewCOSEMClassID
	
	DECLARE @AttributeIDs TABLE (ID BIGINT)
	INSERT INTO @AttributeIDs 
	SELECT ID FROM TableCOSEMAttribute
	WHERE COSEMClassID = @OldClassID
	
	DECLARE @Cursor CURSOR, @OldAttributeID BIGINT
	SET @Cursor = CURSOR FOR 
		SELECT ID 
		FROM @AttributeIDs
	OPEN @Cursor	
	
	WHILE 1=1
	BEGIN
		FETCH FROM @Cursor INTO @OldAttributeID
		IF @@fetch_status <> 0 BREAK
		
		EXEC CopyCOSEMAttribute @OldAttributeID, @NewCOSEMClassID, @DataOwnerID
	END	
	
	COMMIT
END
GO
