
DROP PROCEDURE AddOBISGroup
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	The procedure adds new record to TableOBISGroup and its relations.
-- =============================================
CREATE PROCEDURE AddOBISGroup 
	@Type CHAR(1), 
	@Value TINYINT,
	@Description NCHAR(50),
	@Standard BIT,
	@Reserved BIT,
	@Unusable BIT,
	@Context BIT,
	@DeviceTypeID BIGINT = NULL,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) FROM TableOBISGroup
	WHERE DataOwnerID = @DataOwnerID
	
	IF @Count < 1000
	BEGIN
		BEGIN TRANSACTION
		DECLARE @InsertedID TABLE (ID BIGINT)
		
		INSERT INTO TableOBISGroup (Type, Value, Description, Standard, Reserved, Unusable, Context, DataOwnerID) 
		OUTPUT INSERTED.ID INTO @InsertedID
		VALUES (@Type, @Value, @Description, @Standard, @Reserved, @Unusable, @Context, @DataOwnerID)
		
		DECLARE @OBISGroupID BIGINT
		-- Извлекается идентификатор последней записи
		SELECT @OBISGroupID = MAX(ID) FROM @InsertedID
		
		IF (@Standard > 0) 
		BEGIN
			-- Добавляется ассоциация со всеми известными на данный момент устройствами
			INSERT INTO TableDeviceOBISGroup (DeviceTypeID, OBISGroupID, DataOwnerID)
				SELECT ID, @OBISGroupID, @DataOwnerID
				FROM TableDeviceType
		END
		ELSE
		BEGIN
			-- Добавляется ассоциация с заданным устройством
			INSERT INTO TableDeviceOBISGroup (DeviceTypeID, OBISGroupID, DataOwnerID)
			VALUES (@DeviceTypeID, @OBISGroupID, @DataOwnerID)
		END
		COMMIT
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
