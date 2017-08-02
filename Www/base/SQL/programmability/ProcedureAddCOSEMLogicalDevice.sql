
DROP PROCEDURE AddCOSEMLogicalDevice
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 15/08/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddCOSEMLogicalDevice 
	@DeviceTypeID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER,
	@Name NCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @DeviceTypeDataOwnerID UNIQUEIDENTIFIER
	SELECT @DeviceTypeDataOwnerID = DataOwnerID FROM TableDeviceType
	WHERE ID = @DeviceTypeID
	
	IF @DeviceTypeDataOwnerID = @DataOwnerID
	BEGIN
		DECLARE @Max BIGINT
		SELECT @Max = MAX(SeqNum)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
		
		IF @Max IS NULL
		BEGIN
			SET @Max = 0
		END
		
		DECLARE @Count BIGINT
		DECLARE @MAXID BIGINT
		SELECT @Count = COUNT(*), @MAXID = MAX(ID)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID AND DataOwnerID = @DataOwnerID
			AND Name = @Name

		IF @Count = 0
		BEGIN	
			SELECT @Count = COUNT(*) FROM TableCOSEMLogicalDevice
			WHERE DataOwnerID = @DataOwnerID
			
			IF @Count >= 1000
			BEGIN
				SELECT -1
			END
			ELSE
			BEGIN
				DECLARE @IDs TABLE (ID BIGINT)
				INSERT INTO TableCOSEMLogicalDevice (DeviceTypeID, DataOwnerID, Name, SeqNum)
				OUTPUT INSERTED.ID INTO @IDs
				VALUES (@DeviceTypeID, @DataOwnerID, @Name, @Max + 1)
				SELECT MAX(ID) FROM TableCOSEMLogicalDevice			
			END
		END
		ELSE
		BEGIN
			SELECT @MAXID
		END
	END
	ELSE
	BEGIN
		SELECT -1
	END
END
GO
