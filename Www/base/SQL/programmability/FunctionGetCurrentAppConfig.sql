
DROP FUNCTION GetCurrentAppConfig
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 16/11/2013
-- Description:	Selects current application configuration.
-- =============================================
CREATE FUNCTION GetCurrentAppConfig ()
RETURNS TABLE 
AS
RETURN 
(
	--	It is better to enumerate columns.
	SELECT TestMode, MaxAppLog FROM TableAppConfig
	WHERE ID = (SELECT MAX(ID) FROM TableAppConfig)
)
GO
