ALTER VIEW ViewXMLTemplate
AS
SELECT     1 AS Tag, NULL AS Parent, RTRIM(DeviceType) AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 3 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     2 AS Tag, 1 AS Parent, NULL AS [device_type!1!name!Element], RTRIM(LogicalDevice) AS [logical_device!2!name!Element], NULL 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     3 AS Tag, 2 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], RTRIM(LogicalObject) 
                      AS [logical_object!3!name!Element], NULL AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL 
                      AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, - 1 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     4 AS Tag, 3 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], RTRIM(Attribute) 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 
                      0 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     6 AS Tag, 4 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], RTRIM(ValueIdentifier) AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 
                      1 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     7 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], 
                      '@@UNITS_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL 
                      AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, 
                      DataOwnerID, 4 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     9 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], '@@VALUE_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [value!9!int_value!Element], NULL AS [string_value!10], NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     10 AS Tag, 9 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], 
                      '@@STRING_VALUE_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [string_value!10], 
                      NULL AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 2 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     11 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], 
                      '@@STATUS_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 3 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     13 AS Tag, 6 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], '@@YEAR_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [capture_time!13!year!Element], NULL 
                      AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     14 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], '@@MONTH_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [month!14], NULL AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     15 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], 
                      '@@DAY_OF_MONTH_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [day_of_month!15], NULL AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL
                       AS [second!19], NULL AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     16 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], 
                      '@@DAY_OF_WEEK_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     17 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], '@@HOUR_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [hour!17], NULL AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     18 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], '@@MINUTE_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [minute!18], NULL AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     19 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], '@@SECOND_' + REPLACE(RTRIM(Identifier), ' ', '_') + '@@' AS [second!19], NULL 
                      AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
UNION
SELECT     20 AS Tag, 13 AS Parent, NULL AS [device_type!1!name!Element], NULL AS [logical_device!2!name!Element], NULL AS [logical_object!3!name!Element], NULL 
                      AS [attribute!4!name!Element], NULL AS [extended_register!6!value_identifier!Element], NULL AS [value!9!int_value!Element], NULL AS [string_value!10], NULL 
                      AS [status!11!int_status!Element], NULL AS [units!7], NULL AS [capture_time!13!year!Element], NULL AS [month!14], NULL AS [day_of_month!15], NULL 
                      AS [day_of_week!16], NULL AS [hour!17], NULL AS [minute!18], NULL AS [second!19], '@@HUNDREDTHS_OF_SECOND_' + REPLACE(RTRIM(Identifier), ' ', '_') 
                      + '@@' AS [hundredths_of_second!20], ID, DeviceID, DataOwnerID, 5 AS SpID
FROM         ViewElementLogicalName
GO
