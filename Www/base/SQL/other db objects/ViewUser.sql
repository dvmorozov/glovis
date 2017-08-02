ALTER VIEW ViewUser
AS
SELECT     ID, RTRIM(FirstName) AS FirstName, RTRIM(LastName) AS LastName, RTRIM(UserName) AS UserName, RTRIM(Password) AS Password, RTRIM(Company) 
                      AS Company, DataOwnerID
FROM         dbo.TableUser
GO
