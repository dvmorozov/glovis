
DROP PROCEDURE AddCOSEMObject
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
CREATE PROCEDURE AddCOSEMObject 
	@COSEMLogicalDeviceID BIGINT,
	@COSEMClassID BIGINT,
	@DeviceTypeID BIGINT,
	@COSEMLogicalName NCHAR(20),
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	DECLARE @LogicalDeviceDataOwnerID UNIQUEIDENTIFIER
	SELECT @LogicalDeviceDataOwnerID = DataOwnerID
	FROM TableCOSEMLogicalDevice
	WHERE ID = @COSEMLogicalDeviceID
	
	IF @DataOwnerID = @LogicalDeviceDataOwnerID
	BEGIN
		SELECT @Count = COUNT(*), @MAXID = MAX(ID)
		FROM TableCOSEMObject
		WHERE COSEMLogicalDeviceID = @COSEMLogicalDeviceID AND COSEMClassID = @COSEMClassID AND 
			DeviceTypeID = @DeviceTypeID AND COSEMLogicalName = @COSEMLogicalName AND 
			DataOwnerID = @DataOwnerID

		IF @Count = 0
		BEGIN
			SELECT @Count = COUNT(*) FROM TableCOSEMObject
			WHERE DataOwnerID = @DataOwnerID

			IF @Count >= 1000
			BEGIN
				SELECT -2
			END
			ELSE
			BEGIN
				DECLARE @IDs TABLE (ID BIGINT)
				INSERT INTO TableCOSEMObject (COSEMLogicalDeviceID, COSEMClassID, DeviceTypeID, COSEMLogicalName, DataOwnerID)
				OUTPUT INSERTED.ID INTO @IDs
				VALUES (@COSEMLogicalDeviceID, @COSEMClassID, @DeviceTypeID, @COSEMLogicalName, @DataOwnerID)
				SELECT MAX(ID) FROM @IDs
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
