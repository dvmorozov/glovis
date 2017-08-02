
DROP PROCEDURE AddOBISSet
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
CREATE PROCEDURE AddOBISSet 
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
	
	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableOBISSet
	WHERE DataOwnerID = @DataOwnerID

	IF @Count < 1000
	BEGIN
		INSERT INTO TableOBISSet 
			(AID, BID, CID, DID, EID, FID, DeviceTypeID, DataOwnerID, Standard)
		VALUES 
			(@AID, @BID, @CID, @DID, @EID, @FID, @DeviceTypeID, @DataOwnerID, @Standard)
		
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
