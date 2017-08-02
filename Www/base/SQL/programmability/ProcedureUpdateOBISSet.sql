
DROP PROCEDURE UpdateOBISSet
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 16/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateOBISSet 
	@ID BIGINT,
	@AID BIGINT,
	@BID BIGINT,
	@CID BIGINT,
	@DID BIGINT,
	@EID BIGINT,
	@FID BIGINT,
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Standard BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableOBISSet
	SET AID = @AID, BID = @BID, CID = @CID, DID = @DID, EID = @EID, FID = @FID, 
		DeviceTypeID = @DeviceTypeID, Standard = @Standard
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
