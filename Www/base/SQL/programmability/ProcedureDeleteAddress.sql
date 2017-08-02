
DROP PROCEDURE DeleteAddress
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 25/09/11
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteAddress 
	@AddressID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	UPDATE TableDevice
	SET LocationAddressID = NULL
	WHERE LocationAddressID = @AddressID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableDevice
	SET BillAddressID = NULL
	WHERE BillAddressID = @AddressID AND DataOwnerID = @DataOwnerID
	
	UPDATE TableDeviceOwner
	SET AddressID = NULL
	WHERE AddressID = @AddressID AND  DataOwnerID = @DataOwnerID
	
	DELETE FROM TableAddress
	WHERE ID = @AddressID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
