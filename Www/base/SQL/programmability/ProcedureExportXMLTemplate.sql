
DROP PROCEDURE ExportXMLTemplate
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 10/09/2012
-- Description:	
-- =============================================
CREATE PROCEDURE ExportXMLTemplate 
	@DeviceID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @X XML

	SET @X = (
		SELECT Tag, Parent, 
			[device_type!1!name!Element], 
			[logical_device!2!name!Element],
			[logical_object!3!name!Element], 
			[attribute!4!name!Element], 
			[extended_register!6!value_identifier!Element], 
			[value!9!int_value!Element],
			[string_value!10],
			[status!11!int_status!Element],
			[units!7],	
			[capture_time!13!year!Element],
			[month!14],
			[day_of_month!15],
			[day_of_week!16],
			[hour!17],
			[minute!18],
			[second!19],
			[hundredths_of_second!20]
		FROM ViewXMLTemplate
		WHERE (DeviceID = @DeviceID OR DeviceID IS NULL) AND (DataOwnerID = @DataOwnerID)
		ORDER BY ID, SpID, DeviceID, DataOwnerID
		FOR XML EXPLICIT
		)

	DECLARE @Str VARCHAR(MAX)
	SET @Str = '<xml_template>' + CONVERT(VARCHAR(MAX), @X) + '</xml_template>'
	SELECT @Str
END