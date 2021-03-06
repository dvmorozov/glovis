USE [AppStarterBase]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TableTaskTableMonitoringLog]') AND parent_object_id = OBJECT_ID(N'[dbo].[TableMonitoringLog]'))
ALTER TABLE [dbo].[TableMonitoringLog] DROP CONSTRAINT [FK_TableTaskTableMonitoringLog]
GO
/****** Object:  Table [dbo].[TableTask]    Script Date: 18.03.2014 9:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableTask]') AND type in (N'U'))
DROP TABLE [dbo].[TableTask]
GO
/****** Object:  Table [dbo].[TableMonitoringLog]    Script Date: 18.03.2014 9:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableMonitoringLog]') AND type in (N'U'))
DROP TABLE [dbo].[TableMonitoringLog]
GO
/****** Object:  Table [dbo].[TableExe]    Script Date: 18.03.2014 9:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableExe]') AND type in (N'U'))
DROP TABLE [dbo].[TableExe]
GO
/****** Object:  Table [dbo].[TableExe]    Script Date: 18.03.2014 9:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableExe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TableExe](
	[ExeName] [nchar](50) NOT NULL,
	[FullExeName] [nchar](300) NOT NULL,
 CONSTRAINT [PK_TableExe] PRIMARY KEY CLUSTERED 
(
	[ExeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TableMonitoringLog]    Script Date: 18.03.2014 9:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableMonitoringLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TableMonitoringLog](
	[TimeStamp] [datetimeoffset](7) NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TableTaskTaskID] [uniqueidentifier] NOT NULL,
	[TableTaskID] [bigint] NOT NULL,
 CONSTRAINT [PK_TableMonitoringLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TableTask]    Script Date: 18.03.2014 9:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableTask]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TableTask](
	[TaskID] [uniqueidentifier] NOT NULL,
	[Config] [nvarchar](max) NOT NULL,
	[Template] [nvarchar](max) NOT NULL,
	[Process] [nvarchar](max) NOT NULL,
	[Running] [bit] NOT NULL,
	[OperationInProgress] [bit] NOT NULL,
	[FinishedSuccessfully] [bit] NOT NULL,
	[LastOperationID] [uniqueidentifier] NOT NULL,
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_TableTask] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TableTaskTableMonitoringLog]') AND parent_object_id = OBJECT_ID(N'[dbo].[TableMonitoringLog]'))
ALTER TABLE [dbo].[TableMonitoringLog]  WITH CHECK ADD  CONSTRAINT [FK_TableTaskTableMonitoringLog] FOREIGN KEY([TableTaskTaskID], [TableTaskID])
REFERENCES [dbo].[TableTask] ([TaskID], [ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TableTaskTableMonitoringLog]') AND parent_object_id = OBJECT_ID(N'[dbo].[TableMonitoringLog]'))
ALTER TABLE [dbo].[TableMonitoringLog] CHECK CONSTRAINT [FK_TableTaskTableMonitoringLog]
GO
