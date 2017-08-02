
DROP PROCEDURE UpdateDeviceAddress
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 30/10/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateDeviceAddress 
	@DeviceID BIGINT,
	@AddressID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDevice
	SET LocationAddressID = @AddressID
	WHERE ID = @DeviceID AND DataOwnerID = @DataOwnerID
END
GO
