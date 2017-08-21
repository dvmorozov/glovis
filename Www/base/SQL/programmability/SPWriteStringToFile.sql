
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE SPWRITESTRINGTOFILE
GO

CREATE PROCEDURE SPWRITESTRINGTOFILE
(
	@STRING VARCHAR(MAX), --8000 IN SQL SERVER 2000
	@PATH VARCHAR(255),
	@FILENAME VARCHAR(100)
)
AS
BEGIN
	DECLARE @OBJFILESYSTEM INT,
			@OBJTEXTSTREAM INT,
			@OBJERROROBJECT INT,
			@STRERRORMESSAGE VARCHAR(1000),
			@COMMAND VARCHAR(1000),
			@HR INT,
			@FILEANDPATH VARCHAR(1000)

	SET NOCOUNT ON

	SELECT @STRERRORMESSAGE = 'OPENING THE FILE SYSTEM OBJECT'
	EXECUTE @HR = SP_OACREATE 'SCRIPTING.FILESYSTEMOBJECT', @OBJFILESYSTEM OUT

	SELECT @FILEANDPATH = @PATH + '\' + @FILENAME
	--PRINT @FILEANDPATH
	
	IF @HR=0 SELECT @OBJERROROBJECT = @OBJFILESYSTEM, @STRERRORMESSAGE = 'CREATING FILE "' + @FILEANDPATH + '"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD @OBJFILESYSTEM, 'CREATETEXTFILE', @OBJTEXTSTREAM OUT, @FILEANDPATH, 2, TRUE

	IF @HR=0 SELECT @OBJERROROBJECT = @OBJTEXTSTREAM, 
		@STRERRORMESSAGE = 'WRITING TO THE FILE "' + @FILEANDPATH + '"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD  @OBJTEXTSTREAM, 'WRITE', NULL, @STRING

	IF @HR=0 SELECT @OBJERROROBJECT=@OBJTEXTSTREAM, @STRERRORMESSAGE='CLOSING THE FILE "'+@FILEANDPATH+'"'
	IF @HR=0 EXECUTE @HR = SP_OAMETHOD  @OBJTEXTSTREAM, 'CLOSE'

	IF @HR<>0
	BEGIN
		DECLARE 
			@SOURCE VARCHAR(255),
			@DESCRIPTION VARCHAR(255),
			@HELPFILE VARCHAR(255),
			@HELPID INT
		
		EXECUTE SP_OAGETERRORINFO @OBJERROROBJECT, 
			@SOURCE OUTPUT,@DESCRIPTION OUTPUT,@HELPFILE OUTPUT,@HELPID OUTPUT
		SELECT @STRERRORMESSAGE='ERROR WHILST '
				+COALESCE(@STRERRORMESSAGE,'DOING SOMETHING')
				+', '+COALESCE(@DESCRIPTION,'')
		RAISERROR (@STRERRORMESSAGE,16,1)
	END
	EXECUTE SP_OADESTROY @OBJTEXTSTREAM
	EXECUTE SP_OADESTROY @OBJTEXTSTREAM
END