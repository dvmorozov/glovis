
DROP PROCEDURE AddCOSEMClass
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddCOSEMClass 
	@ClassName NCHAR(100),
	@CardinalityMin INT,
	@CardinalityMax INT,
	@COSEMClassID INT,
	@Version NCHAR(10),
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID) FROM TableCOSEMClass
	WHERE ClassName = @ClassName AND CardinalityMin = @CardinalityMin AND 
		CardinalityMax = @CardinalityMax AND COSEMClassID = @COSEMClassID AND 
		Version = @Version AND DataOwnerID = @DataOwnerID AND Standard = @Standard
		
	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableCOSEMClass
		WHERE DataOwnerID = @DataOwnerID
		
		DECLARE @SameNameCount BIGINT
		SELECT @SameNameCount = COUNT(*) 
		FROM TableCOSEMClass
		WHERE ClassName LIKE RTRIM(@ClassName) + '%' AND (DataOwnerID = @DataOwnerID OR Standard = 1)
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @UniqClassName NVARCHAR(100)
			SET @UniqClassName = @ClassName
			
			IF @SameNameCount > 0
			BEGIN
				SET @UniqClassName = RTRIM(@UniqClassName) + ' ' + CONVERT(NVARCHAR(100), @SameNameCount + 1)
			END
		
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMClass 
				(ClassName, CardinalityMin, CardinalityMax, COSEMClassID, Version, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@UniqClassName, @CardinalityMin, @CardinalityMax, @COSEMClassID, @Version, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		-- there is exactly such class already
		SELECT @MAXID
	END
END
GO
