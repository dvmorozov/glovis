
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2013 21:22:25
-- Generated from EDMX file: D:\Projects\Oonze\LibProcessLog\ProcessLogBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProcessLogBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProcessMessage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MessageSet] DROP CONSTRAINT [FK_ProcessMessage];
GO
IF OBJECT_ID(N'[dbo].[FK_ExecutableProcess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcessSet] DROP CONSTRAINT [FK_ExecutableProcess];
GO
IF OBJECT_ID(N'[dbo].[FK_ExecutableMessage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MessageSet] DROP CONSTRAINT [FK_ExecutableMessage];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ProcessSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcessSet];
GO
IF OBJECT_ID(N'[dbo].[MessageSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MessageSet];
GO
IF OBJECT_ID(N'[dbo].[ExecutableSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExecutableSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProcessSet'
CREATE TABLE [dbo].[ProcessSet] (
    [Pid] smallint  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL,
    [CmdLine] nvarchar(max)  NOT NULL,
    [ExecutableId] int  NOT NULL
);
GO

-- Creating table 'MessageSet'
CREATE TABLE [dbo].[MessageSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Timestamp] datetime  NOT NULL,
    [ProcessId] int  NOT NULL,
    [ExecutableId] int  NOT NULL
);
GO

-- Creating table 'ExecutableSet'
CREATE TABLE [dbo].[ExecutableSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ProcessSet'
ALTER TABLE [dbo].[ProcessSet]
ADD CONSTRAINT [PK_ProcessSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [PK_MessageSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ExecutableSet'
ALTER TABLE [dbo].[ExecutableSet]
ADD CONSTRAINT [PK_ExecutableSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProcessId] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [FK_ProcessMessage]
    FOREIGN KEY ([ProcessId])
    REFERENCES [dbo].[ProcessSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcessMessage'
CREATE INDEX [IX_FK_ProcessMessage]
ON [dbo].[MessageSet]
    ([ProcessId]);
GO

-- Creating foreign key on [ExecutableId] in table 'ProcessSet'
ALTER TABLE [dbo].[ProcessSet]
ADD CONSTRAINT [FK_ExecutableProcess]
    FOREIGN KEY ([ExecutableId])
    REFERENCES [dbo].[ExecutableSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExecutableProcess'
CREATE INDEX [IX_FK_ExecutableProcess]
ON [dbo].[ProcessSet]
    ([ExecutableId]);
GO

-- Creating foreign key on [ExecutableId] in table 'MessageSet'
ALTER TABLE [dbo].[MessageSet]
ADD CONSTRAINT [FK_ExecutableMessage]
    FOREIGN KEY ([ExecutableId])
    REFERENCES [dbo].[ExecutableSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExecutableMessage'
CREATE INDEX [IX_FK_ExecutableMessage]
ON [dbo].[MessageSet]
    ([ExecutableId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------