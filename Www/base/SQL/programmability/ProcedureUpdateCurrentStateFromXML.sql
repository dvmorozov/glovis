
DROP PROCEDURE UpdateCurrentStateFromXML
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 03/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE UpdateCurrentStateFromXML 
	@DeviceID BIGINT,
	@ValueIdentifier UNIQUEIDENTIFIER,
	@MeasurementTime DATETIME2(7),
	@AcquisitionTime DATETIME2(7),
	@Value FLOAT,
	@Units NCHAR(16),
	@QualityBad BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TableCurrentState
	SET MeasurementTime = @MeasurementTime, AcquisitionTime = @AcquisitionTime,
		Value = @Value, Units = @Units, QualityBad = @QualityBad
	WHERE DeviceID = @DeviceID AND ValueIdentifier = @ValueIdentifier
END
GO
