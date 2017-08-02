
DROP PROCEDURE AddChartsDataTypes
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 13/12/2011
-- Description:	
-- =============================================
CREATE PROCEDURE AddChartsDataTypes 
	@ChartID BIGINT,
	@ElementID BIGINT,
	@DataOwnerID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Count BIGINT
	DECLARE @MAXID BIGINT
	
	SELECT @Count = COUNT(*), @MAXID = MAX(ID)
	FROM TableChartsDataTypes
	WHERE (ChartID = @ChartID) AND (ElementID = @ElementID)
		AND (DataOwnerID = @DataOwnerID)
		
	IF @Count = 0
	BEGIN
		SELECT @Count = COUNT(*) FROM TableChartsDataTypes
		WHERE (ChartID = @ChartID) AND (DataOwnerID = @DataOwnerID)
		
		IF @Count >= 10
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			DECLARE @IDs TABLE (ID BIGINT)
			INSERT INTO TableChartsDataTypes (ChartID, ElementID, DataOwnerID)
			OUTPUT INSERTED.ID INTO @IDs
			VALUES (@ChartID, @ElementID, @DataOwnerID)
			
			SELECT MAX(ID) FROM @IDs
		END
	END
	ELSE
	BEGIN
		SELECT @MAXID
	END
END
GO
