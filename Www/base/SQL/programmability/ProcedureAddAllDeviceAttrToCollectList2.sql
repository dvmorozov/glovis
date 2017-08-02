
DROP PROCEDURE AddAllDeviceAttrToCollectList2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 21/10/13
-- Description:	The procedure adds all of physical
--				device attributes to collect list.
--				Sets the initial values of AcquisitionDisables to 1 (true).
--				evernote:///view/14501366/s132/d635a0a2-f96d-4f4d-aed7-e391c75a2163/d635a0a2-f96d-4f4d-aed7-e391c75a2163/
-- =============================================
CREATE PROCEDURE AddAllDeviceAttrToCollectList2 
	@DeviceID BIGINT, -- physical device identifier
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC AddAllDeviceAttrToCollectListInternal @DeviceID, @DataOwnerID, 1	
END
GO
