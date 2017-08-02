
USE AppStarterBase
GO

DROP PROCEDURE AddMonitoringLog
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.V.Morozov
-- Create date: 08/09/2013
-- Description:	Adds record to the monitoring log.
-- =============================================
CREATE PROCEDURE AddMonitoringLog 
	@Task UNIQUEIDENTIFIER,
	@TimeStamp DATETIMEOFFSET(7),
	@Reason NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @TaskForeignId BIGINT
	SET @TaskForeignId = (SELECT TOP(1) ID FROM TableTask WHERE TaskID = @Task)

	IF @TaskForeignId IS NOT NULL
	BEGIN
		INSERT INTO TableMonitoringLog ([TimeStamp], TableTaskTaskID, TableTaskID, Reason)
		VALUES (@TimeStamp, @Task, @TaskForeignId, @Reason)
	END
		
	-- Deletes old values.
	DECLARE @Count BIGINT
	SET @Count = (SELECT COUNT(*) FROM TableMonitoringLog
		WHERE TableTaskTaskID = @Task)
		
	IF @Count >= 1000 
	BEGIN
		-- Deletes oldest records.
		DELETE
		FROM TableMonitoringLog
		WHERE [TimeStamp] =
			(SELECT TOP(1) [TimeStamp]
			FROM TableMonitoringLog
			WHERE TableTaskTaskID = @Task
			ORDER BY [TimeStamp] ASC)
	END
END
GO
