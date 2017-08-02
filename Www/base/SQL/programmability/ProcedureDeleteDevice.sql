
DROP PROCEDURE DeleteDevice
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
CREATE PROCEDURE DeleteDevice 
	-- Add the parameters for the stored procedure here
	@ID BIGINT, 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    -- All linked data are deleted by cascade operation.
    DELETE FROM TableDevice WHERE ID = @ID AND DataOwnerID = @DataOwnerID
	COMMIT
END
GO
