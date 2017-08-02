
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/02/2014 12:46:45
-- Generated from EDMX file: C:\_Projects\Oonze\LibStarterModel\Models\AppStarterBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AppStarterBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TableTaskTableMonitoringLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TableMonitoringLog] DROP CONSTRAINT [FK_TableTaskTableMonitoringLog];
GO
IF OBJECT_ID(N'[dbo].[FK_TableTaskTableTaskOperation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TableTaskOperationSet] DROP CONSTRAINT [FK_TableTaskTableTaskOperation];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TableTask]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TableTask];
GO
IF OBJECT_ID(N'[dbo].[TableExe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TableExe];
GO
IF OBJECT_ID(N'[dbo].[TableMonitoringLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TableMonitoringLog];
GO
IF OBJECT_ID(N'[dbo].[TableTaskOperationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TableTaskOperationSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TableTask'
CREATE TABLE [dbo].[TableTask] (
    [TaskID] uniqueidentifier  NOT NULL,
    [Config] nvarchar(max)  NOT NULL,
    [Template] nvarchar(max)  NOT NULL,
    [Process] nvarchar(max)  NOT NULL,
    [Running] bit  NOT NULL,
    [ID] bigint  NOT NULL
);
GO

-- Creating table 'TableExe'
CREATE TABLE [dbo].[TableExe] (
    [ExeName] nchar(50)  NOT NULL,
    [FullExeName] nchar(300)  NOT NULL
);
GO

-- Creating table 'TableMonitoringLog'
CREATE TABLE [dbo].[TableMonitoringLog] (
    [TimeStamp] datetimeoffset  NOT NULL,
    [Reason] nvarchar(100)  NOT NULL,
    [ID] bigint  NOT NULL,
    [TableTaskTaskID] uniqueidentifier  NOT NULL,
    [TableTaskID] bigint  NOT NULL
);
GO

-- Creating table 'TableTaskOperationSet'
CREATE TABLE [dbo].[TableTaskOperationSet] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [OperationInProgress] bit  NOT NULL,
    [FinishedSuccessfully] bit  NOT NULL,
    [OperationID] uniqueidentifier  NOT NULL,
    [TableTaskTaskID] uniqueidentifier  NOT NULL,
    [TableTaskID] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [TaskID], [ID] in table 'TableTask'
ALTER TABLE [dbo].[TableTask]
ADD CONSTRAINT [PK_TableTask]
    PRIMARY KEY CLUSTERED ([TaskID], [ID] ASC);
GO

-- Creating primary key on [ExeName] in table 'TableExe'
ALTER TABLE [dbo].[TableExe]
ADD CONSTRAINT [PK_TableExe]
    PRIMARY KEY CLUSTERED ([ExeName] ASC);
GO

-- Creating primary key on [ID] in table 'TableMonitoringLog'
ALTER TABLE [dbo].[TableMonitoringLog]
ADD CONSTRAINT [PK_TableMonitoringLog]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'TableTaskOperationSet'
ALTER TABLE [dbo].[TableTaskOperationSet]
ADD CONSTRAINT [PK_TableTaskOperationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TableTaskTaskID], [TableTaskID] in table 'TableMonitoringLog'
ALTER TABLE [dbo].[TableMonitoringLog]
ADD CONSTRAINT [FK_TableTaskTableMonitoringLog]
    FOREIGN KEY ([TableTaskTaskID], [TableTaskID])
    REFERENCES [dbo].[TableTask]
        ([TaskID], [ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TableTaskTableMonitoringLog'
CREATE INDEX [IX_FK_TableTaskTableMonitoringLog]
ON [dbo].[TableMonitoringLog]
    ([TableTaskTaskID], [TableTaskID]);
GO

-- Creating foreign key on [TableTaskTaskID], [TableTaskID] in table 'TableTaskOperationSet'
ALTER TABLE [dbo].[TableTaskOperationSet]
ADD CONSTRAINT [FK_TableTaskTableTaskOperation]
    FOREIGN KEY ([TableTaskTaskID], [TableTaskID])
    REFERENCES [dbo].[TableTask]
        ([TaskID], [ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TableTaskTableTaskOperation'
CREATE INDEX [IX_FK_TableTaskTableTaskOperation]
ON [dbo].[TableTaskOperationSet]
    ([TableTaskTaskID], [TableTaskID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------