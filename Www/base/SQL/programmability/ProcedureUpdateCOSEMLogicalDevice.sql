
DROP PROCEDURE UpdateCOSEMLogicalDevice
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
CREATE PROCEDURE UpdateCOSEMLogicalDevice 
	@ID BIGINT,
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCOSEMLogicalDevice
	SET DeviceTypeID = @DeviceTypeID, Name = @Name
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
