
DROP PROCEDURE AddCOSEMMethod
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddCOSEMMethod 
	@COSEMClassID BIGINT,
	@Name NCHAR(100),
	@Mandatory BIT,
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
	FROM TableCOSEMMethod
	WHERE COSEMClassID = @COSEMClassID AND Name = @Name AND Mandatory = @Mandatory AND 
		DataOwnerID = DataOwnerID AND Standard = @Standard
	
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableCOSEMMethod
		WHERE DataOwnerID = @DataOwnerID

		IF @Count >= 1000
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableCOSEMMethod 
				(COSEMClassID, Name, Mandatory, DataOwnerID, Standard)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES 
				(@COSEMClassID, @Name, @Mandatory, @DataOwnerID, @Standard)
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
