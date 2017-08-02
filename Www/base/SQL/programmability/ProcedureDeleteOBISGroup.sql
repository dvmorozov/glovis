
DROP PROCEDURE DeleteOBISGroup
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	The procedure deletes OBIS group and its relations.
-- =============================================
CREATE PROCEDURE DeleteOBISGroup 
	-- Add the parameters for the stored procedure here
	@OBISGroupID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRANSACTION
    DELETE FROM TableOBISSet WHERE ((AID = @OBISGroupID) OR (BID = @OBISGroupID) OR (CID = @OBISGroupID)
		OR (DID = @OBISGroupID) OR (EID = @OBISGroupID) OR (FID = @OBISGroupID))
		AND (DataOwnerID = @DataOwnerID)
    DELETE FROM TableOBISGroupLink WHERE ((OBISGroupID = @OBISGroupID) OR (TopLevelOBISGroupID = @OBISGroupID)) 
		AND (DataOwnerID = @DataOwnerID)
	DELETE FROM TableOBISGroup WHERE (ID = @OBISGroupID) AND (DataOwnerID = @DataOwnerID)
	COMMIT
END
GO
