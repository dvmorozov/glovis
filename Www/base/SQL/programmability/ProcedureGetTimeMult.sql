
DROP PROCEDURE GetTimeMult
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		D.Morozov
-- Create date: 26/12/2011
-- Description:	The procedure calculates time multiplier
-- =============================================
CREATE PROCEDURE GetTimeMult 
	@TMax DATETIME2(7),
	@TMin DATETIME2(7),
	@Step INT OUTPUT,
	@Units NVARCHAR(20) OUTPUT,
	@Mult FLOAT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT @Step = DATEDIFF(YY, @TMin, @TMax) / 10, @Units = N'x 10 year'
	IF @Step > 1
	BEGIN
		SET @Mult = CONVERT(FLOAT, DATEADD(YY, 10, 0))
	END
	ELSE
	BEGIN
		SELECT @Step = DATEDIFF(YY, @TMin, @TMax), @Units = N'year' 
		IF @Step > 1
		BEGIN
			SET @Mult = CONVERT(FLOAT, DATEADD(YY, 1, 0))
		END
		ELSE
		BEGIN
			SELECT @Step = DATEDIFF(DD, @TMin, @TMax) / 100, @Units = N'x 100 day'
			IF @Step > 1
			BEGIN
				SET @Mult = CONVERT(FLOAT, DATEADD(DD, 100, 0))
			END
			ELSE
			BEGIN
				SELECT @Step = DATEDIFF(DD, @TMin, @TMax) / 10, @Units = N'x 10 day'
				IF @Step > 1
				BEGIN
					SET @Mult = CONVERT(FLOAT, DATEADD(DD, 10, 0))
				END
				ELSE
				BEGIN
					SELECT @Step = DATEDIFF(DD, @TMin, @TMax), @Units = N'day'
					IF @Step > 1
					BEGIN
						SET @Mult = CONVERT(FLOAT, DATEADD(DD, 1, 0))
					END
					ELSE
					BEGIN
						SELECT @Step = DATEDIFF(HH, @TMin, @TMax) / 10, @Units = N'x 10 hour'
						IF @Step > 1
						BEGIN
							SET @Mult = CONVERT(FLOAT, DATEADD(HH, 10, 0))
						END
						ELSE
						BEGIN
							SELECT @Step = DATEDIFF(HH, @TMin, @TMax), @Units = N'hour'
							IF @Step > 1
							BEGIN
								SET @Mult = CONVERT(FLOAT, DATEADD(HH, 1, 0))
							END
							ELSE
							BEGIN
								SELECT @Step = DATEDIFF(MI, @TMin, @TMax) / 10, @Units = 'x 10 min'
								IF @Step > 1
								BEGIN
									SET @Mult = CONVERT(FLOAT, DATEADD(MI, 10, 0))
								END
								ELSE
								BEGIN
									SELECT @Step = DATEDIFF(MI, @TMin, @TMax), @Units = 'x 1 min'
									IF @Step > 1
									BEGIN
										SET @Mult = CONVERT(FLOAT, DATEADD(MI, 1, 0))
									END
									ELSE
									BEGIN
										SELECT @Step = DATEDIFF(SS, @TMin, @TMax) / 10, @Units = 'x 10 sec'
										IF @Step > 1
										BEGIN
											SET @Mult = CONVERT(FLOAT, DATEADD(SS, 10, 0))
										END
										ELSE
										BEGIN
											SELECT @Step = DATEDIFF(SS, @TMin, @TMax), @Units = 'x 1 sec'
											IF @Step > 1
											BEGIN
												SET @Mult = CONVERT(FLOAT, DATEADD(SS, 1, 0))
											END
											ELSE
											BEGIN
												SELECT @Step = DATEDIFF(MS, @TMin, @TMax) / 100, @Units = 'x 100 ms'
												IF @Step > 1
												BEGIN
													SET @Mult = CONVERT(FLOAT, DATEADD(MS, 100, 0))
												END
												ELSE
												BEGIN
													SELECT @Step = DATEDIFF(MS, @TMin, @TMax) / 10, @Units = 'x 10 ms'
													IF @Step > 1
													BEGIN
														SET @Mult = CONVERT(FLOAT, DATEADD(MS, 10, 0))
													END
													ELSE
													BEGIN
														SELECT @Step = DATEDIFF(MS, @TMin, @TMax), @Units = 'x 1 ms'
														SET @Mult = CONVERT(FLOAT, DATEADD(MS, 1, 0)) -- this gives zero
													END
												END
											END
										END
									END
								END
							END
						END
					END
				END
			END
		END
	END
END
GO
