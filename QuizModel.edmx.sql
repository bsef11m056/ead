
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/19/2014 14:20:42
-- Generated from EDMX file: H:\6th Semester\EAD\Project\EAD_Project2\EAD_Project\QuizModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [QuizModel.Db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Quizs'
CREATE TABLE [dbo].[Quizs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Opt1] int  NOT NULL,
    [Opt2] int  NOT NULL,
    [Opt3] int  NOT NULL,
    [Opt4] int  NOT NULL,
    [CorrectOpt] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Result_Id] int  NOT NULL,
    [QuizFile_Id] int  NOT NULL
);
GO

-- Creating table 'Results'
CREATE TABLE [dbo].[Results] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Mark1] int  NOT NULL,
    [Mark2] int  NOT NULL,
    [Mark3] int  NOT NULL,
    [Mark4] int  NOT NULL,
    [Mark5] int  NOT NULL,
    [MarkKG] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'QuizFiles'
CREATE TABLE [dbo].[QuizFiles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Path] nvarchar(max)  NOT NULL,
    [Class] nvarchar(max)  NOT NULL,
    [AdminId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Quizs'
ALTER TABLE [dbo].[Quizs]
ADD CONSTRAINT [PK_Quizs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Results'
ALTER TABLE [dbo].[Results]
ADD CONSTRAINT [PK_Results]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QuizFiles'
ALTER TABLE [dbo].[QuizFiles]
ADD CONSTRAINT [PK_QuizFiles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdminId] in table 'QuizFiles'
ALTER TABLE [dbo].[QuizFiles]
ADD CONSTRAINT [FK_AdminQuizFile]
    FOREIGN KEY ([AdminId])
    REFERENCES [dbo].[Admins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminQuizFile'
CREATE INDEX [IX_FK_AdminQuizFile]
ON [dbo].[QuizFiles]
    ([AdminId]);
GO

-- Creating foreign key on [UserId] in table 'Results'
ALTER TABLE [dbo].[Results]
ADD CONSTRAINT [FK_UserResult]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserResult'
CREATE INDEX [IX_FK_UserResult]
ON [dbo].[Results]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'QuizFiles'
ALTER TABLE [dbo].[QuizFiles]
ADD CONSTRAINT [FK_UserQuizFile]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserQuizFile'
CREATE INDEX [IX_FK_UserQuizFile]
ON [dbo].[QuizFiles]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Quizs'
ALTER TABLE [dbo].[Quizs]
ADD CONSTRAINT [FK_UserQuiz]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserQuiz'
CREATE INDEX [IX_FK_UserQuiz]
ON [dbo].[Quizs]
    ([UserId]);
GO

-- Creating foreign key on [Result_Id] in table 'Quizs'
ALTER TABLE [dbo].[Quizs]
ADD CONSTRAINT [FK_QuizResult]
    FOREIGN KEY ([Result_Id])
    REFERENCES [dbo].[Results]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuizResult'
CREATE INDEX [IX_FK_QuizResult]
ON [dbo].[Quizs]
    ([Result_Id]);
GO

-- Creating foreign key on [QuizFile_Id] in table 'Quizs'
ALTER TABLE [dbo].[Quizs]
ADD CONSTRAINT [FK_QuizQuizFile]
    FOREIGN KEY ([QuizFile_Id])
    REFERENCES [dbo].[QuizFiles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuizQuizFile'
CREATE INDEX [IX_FK_QuizQuizFile]
ON [dbo].[Quizs]
    ([QuizFile_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------