
DROP PROCEDURE DeleteAllAttrFromCollectList
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/07/11
-- Description:	The procedure deletes all attributes of
--				given object from collect list.
-- =============================================
CREATE PROCEDURE DeleteAllAttrFromCollectList 
	@DeviceID BIGINT, -- Physical device id
	@ObjectID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM TableCurrentState
	WHERE (DataOwnerID = @DataOwnerID) AND (DeviceID = @DeviceID) AND
			(DataTypeID IN (
				SELECT ID
				FROM ViewDataType
				WHERE (COSEMObjectID = @ObjectID) AND ((DataOwnerID = @DataOwnerID) OR (Standard = 1))
				))
END
GO
