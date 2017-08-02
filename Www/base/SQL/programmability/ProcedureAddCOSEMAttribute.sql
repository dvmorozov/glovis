
DROP PROCEDURE AddCOSEMAttribute
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
CREATE PROCEDURE AddCOSEMAttribute 
	@COSEMClassID BIGINT, 
	@Dynamic BIT,
	@Name NCHAR(100),
	@COSEMDataTypeID BIGINT,
	@MinValue FLOAT,
	@MaxValue FLOAT,
	@DefValue FLOAT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Standard BIT = 0
	SELECT @Standard = Standard 
	FROM TableCOSEMClass
	WHERE ID = @COSEMClassID
	
	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableCOSEMAttribute
	WHERE COSEMClassID = @COSEMClassID AND Dynamic = @Dynamic AND Name = @Name AND 
		COSEMDataTypeID = @COSEMDataTypeID AND MinValue = @MinValue AND MaxValue = @MaxValue AND 
		DefValue = @DefValue AND DataOwnerID = @DataOwnerID AND Standard = @Standard

	IF @Count = 0
	BEGIN		
		SELECT @Count = COUNT(*) FROM TableCOSEMAttribute
		WHERE DataOwnerID = @DataOwnerID
		
		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMAttribute 
				(COSEMClassID, Dynamic, Name, COSEMDataTypeID, MinValue, MaxValue, DefValue, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@COSEMClassID, @Dynamic, @Name, @COSEMDataTypeID, @MinValue, @MaxValue, @DefValue, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
