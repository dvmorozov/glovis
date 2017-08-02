
DROP PROCEDURE UpdateDeviceType
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
CREATE PROCEDURE UpdateDeviceType 
	@ID BIGINT,
	@Description NCHAR(100), 
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableDeviceType
	SET Description = @Description, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
