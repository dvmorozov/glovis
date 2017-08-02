
DROP PROCEDURE DeleteCOSEMComplexTypeField
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 14/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE DeleteCOSEMComplexTypeField 
	@ID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCOSEMComplexTypeField
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
