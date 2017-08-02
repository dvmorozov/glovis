ALTER VIEW ViewCurrentState
AS
SELECT        t1.ID, t1.MeasurementTime, t1.AcquisitionTime, t1.Value, RTRIM(t1.Units) AS Units, t1.DataTypeID, t1.DeviceID, t1.QualityBad, t1.DataOwnerID, RTRIM(t1.ValueIdentifier) AS ValueIdentifier, 
                         t3.OperationBegin AS LastOperationBegin, t1.AcquisitionDisabled, t1.Identifier, CASE WHEN t2.OperationInProgress IS NOT NULL THEN t2.OperationInProgress ELSE CAST(0 AS BIT) END AS OperationInProgress, 
                         CASE WHEN t2.FinishedSuccessfully IS NOT NULL THEN t2.FinishedSuccessfully ELSE CAST(1 AS BIT) END AS FinishedSuccessfully, t3.OperationID AS LastOperationID, t3.OperationType
FROM            dbo.TableCurrentState AS t1 LEFT OUTER JOIN
                             (SELECT        tcs.ID AS ID1, MAX(tcso.ID) AS ID2, CASE WHEN MAX(CAST(tcso.OperationInProgress AS INT)) = 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS OperationInProgress, 
                                                         CASE WHEN MIN(CAST(tcso.FinishedSuccessfully AS INT)) = 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS FinishedSuccessfully
                               FROM            dbo.TableCurrentState AS tcs INNER JOIN
                                                         dbo.TableCurrentStateOperation AS tcso ON tcso.CurrentStateID = tcs.ID
                               GROUP BY tcs.ID) AS t2 ON t2.ID1 = t1.ID LEFT OUTER JOIN
                         dbo.TableCurrentStateOperation AS t3 ON t3.ID = t2.ID2