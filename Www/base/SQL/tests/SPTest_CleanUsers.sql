
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPTest_CleanUsers
GO

-- =============================================
-- Author:		D.Morozov
-- Create date: 25/11/2011
-- Description:	
-- =============================================
CREATE PROCEDURE SPTest_CleanUsers 
	@User UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	DELETE FROM aspnet_Membership
	WHERE UserId = @User
	
	DELETE FROM aspnet_UsersInRoles
	WHERE UserId = @User
	
	DELETE FROM aspnet_Profile
	WHERE UserId = @User
	
	DELETE FROM aspnet_PersonalizationPerUser
	WHERE UserId = @User
	
	DELETE FROM aspnet_Users
	WHERE UserId = @User
	COMMIT
END
GO
