
DROP PROCEDURE SetAcquisitionDisabled
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 15/10/13
-- Description:	
-- =============================================
CREATE PROCEDURE SetAcquisitionDisabled
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER, 
	@AcquisitionDisabled BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCurrentState
	SET AcquisitionDisabled = @AcquisitionDisabled
	WHERE ID = @ElementID AND DataOwnerID = @DataOwnerID
END
GO
