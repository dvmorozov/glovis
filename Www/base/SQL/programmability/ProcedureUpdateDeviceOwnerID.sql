
DROP PROCEDURE UpdateDeviceOwnerID
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 03/11/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateDeviceOwnerID 
	@DeviceID BIGINT,
	@OwnerID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice
	SET OwnerID = @OwnerID
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END
GO
