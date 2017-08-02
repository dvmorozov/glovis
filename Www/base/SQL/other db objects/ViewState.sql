ALTER VIEW ViewState
AS
SELECT     ID, RTRIM(State) AS State, CountryID, DataOwnerID
FROM         dbo.TableState
GO
