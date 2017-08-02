
DROP PROCEDURE CheckOBISGroupDevices
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 29/05/11
-- Description:	Определяет, связаны ли типы устройств с данной OBIS-группой.
-- =============================================
CREATE PROCEDURE CheckOBISGroupDevices 
	-- Add the parameters for the stored procedure here
	@OBISGroupID bigint = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Description, ID,
	CONVERT(BIT, (SELECT COUNT(*) FROM TableDeviceOBISGroup WHERE DeviceTypeID=ID AND OBISGroupID=@OBISGroupID)) AS Checked
	FROM TableDeviceType
END
GO
