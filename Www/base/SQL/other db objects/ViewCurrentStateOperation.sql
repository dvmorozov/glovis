
ALTER VIEW ViewCurrentStateOperation
AS
SELECT        ID, OperationBegin, OperationID, FinishedSuccessfully, OperationInProgress, CurrentStateID, OperationType
FROM            dbo.TableCurrentStateOperation