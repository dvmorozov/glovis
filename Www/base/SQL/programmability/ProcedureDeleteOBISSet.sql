
DROP PROCEDURE DeleteOBISSet
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
CREATE PROCEDURE DeleteOBISSet 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableOBISSet
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
