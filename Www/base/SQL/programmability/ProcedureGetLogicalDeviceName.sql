
DROP PROCEDURE GetLogicalDeviceName
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE GetLogicalDeviceName 
	@DeviceTypeID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	SELECT @Count = COUNT(*) 
	FROM TableCOSEMLogicalDevice
	WHERE DeviceTypeID = @DeviceTypeID
	
	IF @Count = 0
	BEGIN
		SELECT 'LD 1'
	END
	ELSE
	BEGIN
		DECLARE @Max BIGINT
		SELECT @Max = MAX(SeqNum)
		FROM TableCOSEMLogicalDevice
		WHERE DeviceTypeID = @DeviceTypeID
		
		SELECT 'LD ' + RTRIM(CONVERT(CHAR(20), @Max + 1))
	END
END
GO
