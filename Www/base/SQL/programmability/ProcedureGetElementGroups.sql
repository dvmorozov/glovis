
DROP PROCEDURE GetElementGroups
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 17/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetElementGroups 
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM ViewElementGroup
	WHERE DataOwnerID = @DataOwnerID
END
GO
