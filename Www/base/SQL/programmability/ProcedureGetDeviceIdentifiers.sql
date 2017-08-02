
DROP PROCEDURE GetDeviceIdentifiers
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2011
-- Description:	The procedure returns data identifiers of given device.
-- =============================================
CREATE PROCEDURE GetDeviceIdentifiers 
	@DeviceID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT RTRIM(Identifier) FROM TableCurrentState
	WHERE DeviceID = @DeviceID
END
GO
