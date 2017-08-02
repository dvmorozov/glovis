
DROP PROCEDURE DeleteCOSEMLogicalDevice
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteCOSEMLogicalDevice 
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	DELETE FROM TableCOSEMObject WHERE COSEMLogicalDeviceID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableCOSEMLogicalDevice WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
