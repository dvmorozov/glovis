
DROP PROCEDURE DeleteGroup
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		D. Morozov
-- Create date: 16/05/11
-- Description:	The procedure deletes group and 
-- all associated devices
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGroup] 
	@GroupID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
	DELETE FROM TableGroup WHERE ID = @GroupID AND DataOwnerID = @DataOwnerID
	COMMIT
END

GO


