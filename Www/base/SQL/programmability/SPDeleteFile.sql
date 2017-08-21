
DROP PROCEDURE SPDELETEFILE
GO

CREATE PROCEDURE SPDELETEFILE
(
	-- Full filename, including the path.
	@FILENAME VARCHAR(1000)
)
AS
BEGIN
	DECLARE @OBJFILESYSTEM INT,
			@OBJERROROBJECT INT,
			@STRERRORMESSAGE VARCHAR(1000),
			@COMMAND VARCHAR(1000),
			@HR INT

	SET NOCOUNT ON
	
	DECLARE @TestMode BIT
	SET @TestMode = (SELECT TestMode FROM GetCurrentAppConfig())

	IF @TestMode IS NULL OR @TestMode = 1
	BEGIN
		-- The test mode.
		-- Adds row to the log.
		EXEC AddMessageToAppLog 'SPDELETEFILE (test mode).'
	END
	ELSE
	BEGIN
		--	The operating mode.
		SELECT @STRERRORMESSAGE = 'OPENING THE FILE SYSTEM OBJECT'
		EXECUTE @HR = SP_OACREATE 'SCRIPTING.FILESYSTEMOBJECT', @OBJFILESYSTEM OUT
		
		IF @HR = 0 SELECT @OBJERROROBJECT = @OBJFILESYSTEM, @STRERRORMESSAGE = 'DELETING FILE "' + @FILENAME + '"'
		--	The last parameter disables deleting readonly files.
		IF @HR = 0 EXECUTE @HR = SP_OAMETHOD @OBJFILESYSTEM, 'DeleteFile', NULL, @FILENAME

		IF @HR <> 0
		BEGIN
			DECLARE 
				@SOURCE VARCHAR(255),
				@DESCRIPTION VARCHAR(255),
				@HELPFILE VARCHAR(255),
				@HELPID INT
			
			EXECUTE SP_OAGETERRORINFO @OBJERROROBJECT, 
				@SOURCE OUTPUT, @DESCRIPTION OUTPUT, @HELPFILE OUTPUT, @HELPID OUTPUT
			SELECT @STRERRORMESSAGE = 'ERROR WHILST '
					+ COALESCE(@STRERRORMESSAGE, 'DOING SOMETHING')
					+ ', '+ COALESCE(@DESCRIPTION, '')
			--RAISERROR (@STRERRORMESSAGE, 16, 1)
			EXEC AddMessageToAppLog @STRERRORMESSAGE
		END
		ELSE
		BEGIN
			DECLARE @MESSAGE VARCHAR(1000)
			SET @MESSAGE = 'SPDELETEFILE (' + @FILENAME	+ ')'
			EXEC AddMessageToAppLog @MESSAGE
		END
		
		EXEC SP_OADESTROY @OBJFILESYSTEM
	END
END