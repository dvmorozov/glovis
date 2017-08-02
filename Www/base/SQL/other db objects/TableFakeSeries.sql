
/****** Object:  Table [dbo].[fake_Series]    Script Date: 06/30/2012 16:07:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[fake_Series]
GO

CREATE TABLE [dbo].[fake_Series](
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[Count] [bigint] NOT NULL,
	[Units] [nchar](36) NOT NULL,
	[Name] [nchar](36) NOT NULL)

GO

