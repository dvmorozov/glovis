
DROP PROCEDURE AddDeviceType
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
CREATE PROCEDURE AddDeviceType 
	@Description NCHAR(100), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableDeviceType

	IF @Count < 10
	BEGIN
		INSERT INTO TableDeviceType (Description, DataOwnerID, Standard)
		VALUES (@Description, @DataOwnerID, @Standard)
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
