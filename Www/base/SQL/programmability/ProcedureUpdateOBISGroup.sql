
DROP PROCEDURE UpdateOBISGroup
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
CREATE PROCEDURE UpdateOBISGroup 
	@ID BIGINT,
	@Type CHAR(1), 
	@Value TINYINT,
	@Description NCHAR(50),
	@Standard BIT,
	@Reserved BIT,
	@Unusable BIT,
	@Context BIT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableOBISGroup
	SET Type = @Type, Value = @Value, Description = @Description, Standard = @Standard, 
		Reserved = @Reserved, Unusable = @Unusable, Context = @Context
	WHERE ID = @ID AND DataOwnerID = @DataOwnerID
END
GO
