
DROP PROCEDURE GetUniqName
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 27/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE GetUniqName 
	@UniqName NVARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Uniq NVARCHAR(100)
	SET @Uniq = CONVERT(NVARCHAR(100), NEWID())
	SET @UniqName = SUBSTRING(@Uniq, 1, 8) + SUBSTRING(@Uniq, 10, 4) + SUBSTRING(@Uniq, 15, 4) + SUBSTRING(@Uniq, 20, 4) + SUBSTRING(@Uniq, 25, 12)
END
GO
