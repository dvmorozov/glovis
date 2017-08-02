
DROP PROCEDURE DeleteDeviceType
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
CREATE PROCEDURE DeleteDeviceType 
	-- Add the parameters for the stored procedure here
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	-- explicitly deletes objects because they can't be deleted by cascade operation;
	-- only owner can delete something
	DELETE FROM TableCOSEMObject WHERE DeviceTypeID = @ID AND DataOwnerID = @DataOwnerID
	DELETE FROM TableDeviceType WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
