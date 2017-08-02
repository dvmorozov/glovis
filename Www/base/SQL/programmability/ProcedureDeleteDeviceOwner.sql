
DROP PROCEDURE DeleteDeviceOwner
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
CREATE PROCEDURE DeleteDeviceOwner 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableDevice
	SET OwnerID = NULL
	WHERE OwnerID = @ID AND DataOwnerID = @DataOwnerID
	
	DELETE FROM TableDeviceOwner WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
