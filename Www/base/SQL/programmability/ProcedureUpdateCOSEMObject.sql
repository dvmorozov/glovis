
DROP PROCEDURE UpdateCOSEMObject
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
CREATE PROCEDURE UpdateCOSEMObject 
	@ID BIGINT,
	@COSEMLogicalDeviceID BIGINT,
	@COSEMClassID BIGINT,
	@DeviceTypeID BIGINT,
	@COSEMLogicalName NCHAR(20),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMObject
	SET COSEMLogicalDeviceID = @COSEMLogicalDeviceID, COSEMClassID = @COSEMClassID, 
		DeviceTypeID = @DeviceTypeID, COSEMLogicalName = @COSEMLogicalName
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
