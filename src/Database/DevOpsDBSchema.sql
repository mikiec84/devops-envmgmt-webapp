USE [master]
GO
/****** Object:  Database [DevOps]    Script Date: 3/16/2018 5:40:25 PM ******/
CREATE DATABASE [DevOps]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DevOps', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DevOps.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'DevOps_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DevOps_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DevOps] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DevOps].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DevOps] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DevOps] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DevOps] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DevOps] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DevOps] SET ARITHABORT OFF 
GO
ALTER DATABASE [DevOps] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DevOps] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DevOps] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DevOps] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DevOps] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DevOps] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DevOps] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DevOps] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DevOps] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DevOps] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DevOps] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DevOps] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DevOps] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DevOps] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DevOps] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DevOps] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DevOps] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DevOps] SET RECOVERY FULL 
GO
ALTER DATABASE [DevOps] SET  MULTI_USER 
GO
ALTER DATABASE [DevOps] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DevOps] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DevOps] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DevOps] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DevOps] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DevOps', N'ON'
GO
ALTER DATABASE [DevOps] SET QUERY_STORE = OFF
GO
USE [DevOps]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DevOps]
GO
/****** Object:  User [richard]    Script Date: 3/16/2018 5:40:25 PM ******/
CREATE USER [richard] FOR LOGIN [richard] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [richard]
GO
/****** Object:  Table [dbo].[tblAppEnvs]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppEnvs](
	[AppEnvID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[EnvironmentID] [int] NOT NULL,
 CONSTRAINT [PK_tblAppEnvs] PRIMARY KEY CLUSTERED 
(
	[AppEnvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApplications]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTeamID] [int] NOT NULL,
	[ApplicationName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblApplications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnvironments]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnvironments](
	[EnvironmentID] [int] IDENTITY(1,1) NOT NULL,
	[EnvName] [varchar](100) NULL,
 CONSTRAINT [PK_tblEnvironments] PRIMARY KEY CLUSTERED 
(
	[EnvironmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnvReqStatusTypes]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnvReqStatusTypes](
	[EnvReqStatusTypesID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[OrderBy] [int] NULL,
 CONSTRAINT [PK_tblEnvReqStatusTypes] PRIMARY KEY CLUSTERED 
(
	[EnvReqStatusTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnvRequests]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnvRequests](
	[EnvRequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestorID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[ReleaseID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DateFrom] [date] NULL,
	[TimeFrom] [time](0) NULL,
	[DateTo] [date] NULL,
	[TimeTo] [time](0) NULL,
	[EnvReqStatusTypesID] [int] NULL,
	[Notes] [nvarchar](4000) NULL,
 CONSTRAINT [PK_tblEnvRequests] PRIMARY KEY CLUSTERED 
(
	[EnvRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnvServers]    Script Date: 3/16/2018 5:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnvServers](
	[EnvServerID] [int] IDENTITY(1,1) NOT NULL,
	[EnvironmentID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
 CONSTRAINT [PK_tblEnvServers] PRIMARY KEY CLUSTERED 
(
	[EnvServerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnvStatus]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnvStatus](
	[EnvStatusID] [int] NOT NULL,
	[AppEnvID] [int] NOT NULL,
	[AppVersion] [varchar](20) NULL,
	[DatabaseVersion] [varchar](20) NULL,
	[DateTimeDeployed] [datetime] NULL,
 CONSTRAINT [PK_tblEnvStatus] PRIMARY KEY CLUSTERED 
(
	[EnvStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectTeam]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectTeam](
	[ProjectTeamID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LeaderName] [int] NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_tblProjectTeam] PRIMARY KEY CLUSTERED 
(
	[ProjectTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReleases]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReleases](
	[ReleaseID] [int] IDENTITY(1,1) NOT NULL,
	[ReleaseName] [varchar](100) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
 CONSTRAINT [PK_tblReleases] PRIMARY KEY CLUSTERED 
(
	[ReleaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[OrderBy] [int] NULL,
	[IsAdmin] [int] NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServers]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServers](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](50) NOT NULL,
	[ServerIPAddress] [varchar](30) NULL,
	[ServerType] [int] NULL,
	[URL] [varchar](500) NULL,
	[DirectoryPath] [varchar](500) NULL,
	[Owner] [int] NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_tblServers] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServerType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServerType](
	[ServerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServerTypeDescr] [varchar](400) NOT NULL,
 CONSTRAINT [PK_tblServerType] PRIMARY KEY CLUSTERED 
(
	[ServerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_tblUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProjectTeam] ADD  CONSTRAINT [DF_tblProjectTeam_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblRoles] ADD  CONSTRAINT [DF_tblRoles_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[tblServers] ADD  CONSTRAINT [DF_tblServers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRoles_tblRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUserRoles] CHECK CONSTRAINT [FK_tblUserRoles_tblRoles]
GO
ALTER TABLE [dbo].[tblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRoles_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUserRoles] CHECK CONSTRAINT [FK_tblUserRoles_tblUsers]
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteAppEnv]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteAppEnv]

(
	@AppEnvID int
)

AS
DELETE FROM [tblAppEnvs]

WHERE
AppEnvID = @AppEnvID


/*DROP PROC dbo.spc_DeleteAppEnv*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteApplication]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteApplication]

(
	@ApplicationID int
)

AS
DELETE FROM [tblApplications]

WHERE
ApplicationID = @ApplicationID


/*DROP PROC dbo.spc_DeleteApplication*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteEnvironment]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteEnvironment]

(
	@EnvironmentID int
)

AS
DELETE FROM [tblEnvironments]

WHERE
EnvironmentID = @EnvironmentID


/*DROP PROC dbo.spc_DeleteEnvironment*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteEnvReqStatusType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteEnvReqStatusType]

(
	@EnvReqStatusTypesID int
)

AS
DELETE FROM [tblEnvReqStatusTypes]

WHERE
EnvReqStatusTypesID = @EnvReqStatusTypesID


/*DROP PROC dbo.spc_DeleteEnvReqStatusType*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteEnvRequest]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteEnvRequest]

(
	@EnvRequestID int
)

AS
DELETE FROM [tblEnvRequests]

WHERE
EnvRequestID = @EnvRequestID


/*DROP PROC dbo.spc_DeleteEnvRequest*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteEnvServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteEnvServer]

(
	@EnvServerID int
)

AS
DELETE FROM [tblEnvServers]

WHERE
EnvServerID = @EnvServerID


/*DROP PROC dbo.spc_DeleteEnvServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteEnvStatus]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteEnvStatus]

(
	@EnvStatusID int
)

AS
DELETE FROM [tblEnvStatus]

WHERE
EnvStatusID = @EnvStatusID


/*DROP PROC dbo.spc_DeleteEnvStatus*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteProjectTeam]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteProjectTeam]

(
	@ProjectTeamID int
)

AS
DELETE FROM [tblProjectTeam]

WHERE
ProjectTeamID = @ProjectTeamID


/*DROP PROC dbo.spc_DeleteProjectTeam*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteRelease]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteRelease]

(
	@ReleaseID int
)

AS
DELETE FROM [tblReleases]

WHERE
ReleaseID = @ReleaseID


/*DROP PROC dbo.spc_DeleteRelease*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteRole]

(
	@RoleID int
)

AS
DELETE FROM [tblRoles]

WHERE
RoleID = @RoleID


/*DROP PROC dbo.spc_DeleteRole*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteServer]

(
	@ServerID int
)

AS
DELETE FROM [tblServers]

WHERE
ServerID = @ServerID


/*DROP PROC dbo.spc_DeleteServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteServerType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteServerType]

(
	@ServerTypeID int
)

AS
DELETE FROM [tblServerType]

WHERE
ServerTypeID = @ServerTypeID


/*DROP PROC dbo.spc_DeleteServerType*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteUser]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteUser]

(
	@UserID int
)

AS
DELETE FROM [tblUsers]

WHERE
UserID = @UserID


/*DROP PROC dbo.spc_DeleteUser*/
GO
/****** Object:  StoredProcedure [dbo].[spcDeleteUserRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcDeleteUserRole]

(
	@UserRoleID int
)

AS
DELETE FROM [tblUserRoles]

WHERE
UserRoleID = @UserRoleID


/*DROP PROC dbo.spc_DeleteUserRole*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetAppEnvDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetAppEnvDetails]

(
	@AppEnvID int
)

AS
SELECT * FROM [tblAppEnvs]

WHERE
AppEnvID = @AppEnvID


/*DROP PROC dbo.spc_GetAppEnvDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetAppEnvs]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetAppEnvs]
AS
SELECT * FROM [tblAppEnvs]

/*DROP PROC dbo.spc_GetAppEnvs*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetApplicationDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetApplicationDetails]

(
	@ApplicationID int
)

AS
SELECT * FROM [tblApplications]

WHERE
ApplicationID = @ApplicationID


/*DROP PROC dbo.spc_GetApplicationDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetApplications]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetApplications]
AS
SELECT * FROM [tblApplications]

/*DROP PROC dbo.spc_GetApplications*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvironmentDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvironmentDetails]

(
	@EnvironmentID int
)

AS
SELECT * FROM [tblEnvironments]

WHERE
EnvironmentID = @EnvironmentID


/*DROP PROC dbo.spc_GetEnvironmentDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvironments]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvironments]
AS
SELECT * FROM [tblEnvironments]

/*DROP PROC dbo.spc_GetEnvironments*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvReqStatusTypeDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvReqStatusTypeDetails]

(
	@EnvReqStatusTypesID int
)

AS
SELECT * FROM [tblEnvReqStatusTypes]

WHERE
EnvReqStatusTypesID = @EnvReqStatusTypesID


/*DROP PROC dbo.spc_GetEnvReqStatusTypeDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvReqStatusTypes]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvReqStatusTypes]
AS
SELECT * FROM [tblEnvReqStatusTypes]

/*DROP PROC dbo.spc_GetEnvReqStatusTypes*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvRequestDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvRequestDetails]

(
	@EnvRequestID int
)

AS
SELECT * FROM [tblEnvRequests]

WHERE
EnvRequestID = @EnvRequestID


/*DROP PROC dbo.spc_GetEnvRequestDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvRequests]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvRequests]
AS
SELECT * FROM [tblEnvRequests]

/*DROP PROC dbo.spc_GetEnvRequests*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvServerDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvServerDetails]

(
	@EnvServerID int
)

AS
SELECT * FROM [tblEnvServers]

WHERE
EnvServerID = @EnvServerID


/*DROP PROC dbo.spc_GetEnvServerDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvServers]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvServers]
AS
SELECT * FROM [tblEnvServers]

/*DROP PROC dbo.spc_GetEnvServers*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvStatusDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvStatusDetails]

(
	@EnvStatusID int
)

AS
SELECT * FROM [tblEnvStatus]

WHERE
EnvStatusID = @EnvStatusID


/*DROP PROC dbo.spc_GetEnvStatusDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetEnvStatuses]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetEnvStatuses]
AS
SELECT * FROM [tblEnvStatus]

/*DROP PROC dbo.spc_GetEnvStatuses*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetProjectTeamDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetProjectTeamDetails]

(
	@ProjectTeamID int
)

AS
SELECT * FROM [tblProjectTeam]

WHERE
ProjectTeamID = @ProjectTeamID


/*DROP PROC dbo.spc_GetProjectTeamDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetProjectTeams]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetProjectTeams]
AS
SELECT * FROM [tblProjectTeam]

/*DROP PROC dbo.spc_GetProjectTeams*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetReleaseDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetReleaseDetails]

(
	@ReleaseID int
)

AS
SELECT * FROM [tblReleases]

WHERE
ReleaseID = @ReleaseID


/*DROP PROC dbo.spc_GetReleaseDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetReleases]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetReleases]
AS
SELECT * FROM [tblReleases]

/*DROP PROC dbo.spc_GetReleases*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetRoleDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetRoleDetails]

(
	@RoleID int
)

AS
SELECT * FROM [tblRoles]

WHERE
RoleID = @RoleID


/*DROP PROC dbo.spc_GetRoleDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetRoles]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetRoles]
AS
SELECT * FROM [tblRoles]

/*DROP PROC dbo.spc_GetRoles*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetServerDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetServerDetails]

(
	@ServerID int
)

AS
SELECT * FROM [tblServers]

WHERE
ServerID = @ServerID


/*DROP PROC dbo.spc_GetServerDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetServers]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetServers]
AS
SELECT * FROM [tblServers]

/*DROP PROC dbo.spc_GetServers*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetServerTypeDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetServerTypeDetails]

(
	@ServerTypeID int
)

AS
SELECT * FROM [tblServerType]

WHERE
ServerTypeID = @ServerTypeID


/*DROP PROC dbo.spc_GetServerTypeDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetServerTypes]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetServerTypes]
AS
SELECT * FROM [tblServerType]

/*DROP PROC dbo.spc_GetServerTypes*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetUserDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetUserDetails]

(
	@UserID int
)

AS
SELECT * FROM [tblUsers]

WHERE
UserID = @UserID


/*DROP PROC dbo.spc_GetUserDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetUserRoleDetails]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetUserRoleDetails]

(
	@UserRoleID int
)

AS
SELECT * FROM [tblUserRoles]

WHERE
UserRoleID = @UserRoleID


/*DROP PROC dbo.spc_GetUserRoleDetails*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetUserRoles]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcGetUserRoles]
AS
SELECT * FROM [tblUserRoles]

/*DROP PROC dbo.spc_GetUserRoles*/
GO
/****** Object:  StoredProcedure [dbo].[spcGetUsers]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spcGetUsers]

AS

  SELECT [UserID], [FirstName], [LastName], [IsActive]
  FROM [dbo].[tblUsers]
  WHERE IsActive = 1
GO
/****** Object:  StoredProcedure [dbo].[spcInsertAppEnv]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertAppEnv]
(
	@ApplicationID int,
	@EnvironmentID int,
	@AppEnvID  int OUTPUT
)

AS
INSERT INTO [tblAppEnvs]
( 
	ApplicationID,
	EnvironmentID

)
VALUES 
(
	@ApplicationID,
	@EnvironmentID
)


SET @AppEnvID= @@IDENTITY
 Return @AppEnvID
/*DROP PROC dbo.spc_InsertAppEnv*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertApplication]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertApplication]
(
	@ProjectTeamID int,
	@ApplicationName varchar(100),
	@ApplicationID  int OUTPUT
)

AS
INSERT INTO [tblApplications]
( 
	ProjectTeamID,
	ApplicationName

)
VALUES 
(
	@ProjectTeamID,
	@ApplicationName
)


SET @ApplicationID= @@IDENTITY
 Return @ApplicationID
/*DROP PROC dbo.spc_InsertApplication*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertEnvironment]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertEnvironment]
(
	@EnvName varchar(100),
	@EnvironmentID  int OUTPUT
)

AS
INSERT INTO [tblEnvironments]
( 
	EnvName

)
VALUES 
(
	@EnvName
)


SET @EnvironmentID= @@IDENTITY
 Return @EnvironmentID
/*DROP PROC dbo.spc_InsertEnvironment*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertEnvReqStatusType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertEnvReqStatusType]
(
	@Description varchar(50),
	@OrderBy int,
	@EnvReqStatusTypesID  int OUTPUT
)

AS
INSERT INTO [tblEnvReqStatusTypes]
( 
	Description,
	OrderBy

)
VALUES 
(
	@Description,
	@OrderBy
)


SET @EnvReqStatusTypesID= @@IDENTITY
 Return @EnvReqStatusTypesID
/*DROP PROC dbo.spc_InsertEnvReqStatusType*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertEnvRequest]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertEnvRequest]
(
    @RequestorID int,
    @OwnerID int,
    @ReleaseID int,
	@ApplicationID int,
	@DateFrom date,
	@TimeFrom time(0),
	@DateTo date,
	@TimeTo time(0),
	@EnvReqStatusTypesID int,
	@Notes nvarchar(4000),

	@EnvRequestID  int OUTPUT
)

AS
INSERT INTO [tblEnvRequests]
( 
	RequestorID,
	OwnerID,
	ReleaseID,
	ApplicationID,
	DateFrom,
	TimeFrom,
	DateTo,
	TimeTo,
	EnvReqStatusTypesID,
	Notes
)
VALUES 
(
	@RequestorID,
	@OwnerID,
	@ReleaseID,
	@ApplicationID,
	@DateFrom,
	@TimeFrom,
	@DateTo,
	@TimeTo,
	@EnvReqStatusTypesID,
	@Notes
)

SET @EnvRequestID= @@IDENTITY
 Return @EnvRequestID

GO
/****** Object:  StoredProcedure [dbo].[spcInsertEnvServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertEnvServer]
(
	@EnvironmentID int,
	@ServerID int,
	@EnvServerID  int OUTPUT
)

AS
INSERT INTO [tblEnvServers]
( 
	EnvironmentID,
	ServerID

)
VALUES 
(
	@EnvironmentID,
	@ServerID
)


SET @EnvServerID= @@IDENTITY
 Return @EnvServerID
/*DROP PROC dbo.spc_InsertEnvServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertEnvStatus]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertEnvStatus]
(
	@EnvStatusID int,
	@AppEnvID int,
	@AppVersion varchar(20),
	@DatabaseVersion varchar(20),
	@DateTimeDeployed datetime
)

AS
INSERT INTO [tblEnvStatus]
( 
	EnvStatusID,
	AppEnvID,
	AppVersion,
	DatabaseVersion,
	DateTimeDeployed

)
VALUES 
(
	@EnvStatusID,
	@AppEnvID,
	@AppVersion,
	@DatabaseVersion,
	@DateTimeDeployed
)
/*DROP PROC dbo.spc_InsertEnvStatus*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertProjectTeam]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertProjectTeam]
(
	@Name varchar(100),
	@LeaderName int,
	@IsActive int,
	@ProjectTeamID  int OUTPUT
)

AS
INSERT INTO [tblProjectTeam]
( 
	Name,
	LeaderName,
	IsActive

)
VALUES 
(
	@Name,
	@LeaderName,
	@IsActive
)


SET @ProjectTeamID= @@IDENTITY
 Return @ProjectTeamID
/*DROP PROC dbo.spc_InsertProjectTeam*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertRelease]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertRelease]
(
	@ReleaseName varchar(100),
	@ReleaseDate datetime,
	@ReleaseID  int OUTPUT
)

AS
INSERT INTO [tblReleases]
( 
	ReleaseName,
	ReleaseDate

)
VALUES 
(
	@ReleaseName,
	@ReleaseDate
)


SET @ReleaseID= @@IDENTITY
 Return @ReleaseID
/*DROP PROC dbo.spc_InsertRelease*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertRole]
(
	@RoleName varchar(50),
	@OrderBy int,
	@IsAdmin int,
	@RoleID  int OUTPUT
)

AS
INSERT INTO [tblRoles]
( 
	RoleName,
	OrderBy,
	IsAdmin

)
VALUES 
(
	@RoleName,
	@OrderBy,
	@IsAdmin
)


SET @RoleID= @@IDENTITY
 Return @RoleID
/*DROP PROC dbo.spc_InsertRole*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertServer]
(
	@ServerName varchar(50),
	@ServerIPAddress varchar(30),
	@ServerType int,
	@URL varchar(500),
	@DirectoryPath varchar(500),
	@Owner int,
	@IsActive int,
	@ServerID  int OUTPUT
)

AS
INSERT INTO [tblServers]
( 
	ServerName,
	ServerIPAddress,
	ServerType,
	URL,
	DirectoryPath,
	Owner,
	IsActive

)
VALUES 
(
	@ServerName,
	@ServerIPAddress,
	@ServerType,
	@URL,
	@DirectoryPath,
	@Owner,
	@IsActive
)


SET @ServerID= @@IDENTITY
 Return @ServerID
/*DROP PROC dbo.spc_InsertServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertServerType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertServerType]
(
	@ServerTypeDescr varchar(400),
	@ServerTypeID  int OUTPUT
)

AS
INSERT INTO [tblServerType]
( 
	ServerTypeDescr

)
VALUES 
(
	@ServerTypeDescr
)


SET @ServerTypeID= @@IDENTITY
 Return @ServerTypeID
/*DROP PROC dbo.spc_InsertServerType*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertUser]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertUser]
(
	@FirstName varchar(50),
	@LastName varchar(50),
	@IsActive int,
	@UserID  int OUTPUT
)

AS
INSERT INTO [tblUsers]
( 
	FirstName,
	LastName,
	IsActive

)
VALUES 
(
	@FirstName,
	@LastName,
	@IsActive
)


SET @UserID= @@IDENTITY
 Return @UserID
/*DROP PROC dbo.spc_InsertUser*/
GO
/****** Object:  StoredProcedure [dbo].[spcInsertUserRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcInsertUserRole]
(
	@UserID int,
	@RoleID int,
	@UserRoleID  int OUTPUT
)

AS
INSERT INTO [tblUserRoles]
( 
	UserID,
	RoleID

)
VALUES 
(
	@UserID,
	@RoleID
)


SET @UserRoleID= @@IDENTITY
 Return @UserRoleID
/*DROP PROC dbo.spc_InsertUserRole*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateAppEnv]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateAppEnv]
(
	@AppEnvID int,
	@ApplicationID int,
	@EnvironmentID int
)

AS
UPDATE [tblAppEnvs] 
SET 
ApplicationID = @ApplicationID,
EnvironmentID = @EnvironmentID

WHERE
AppEnvID = @AppEnvID


/*DROP PROC dbo.spc_UpdateAppEnv*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateApplication]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateApplication]
(
	@ApplicationID int,
	@ProjectTeamID int,
	@ApplicationName varchar(100)
)

AS
UPDATE [tblApplications] 
SET 
ProjectTeamID = @ProjectTeamID,
ApplicationName = @ApplicationName

WHERE
ApplicationID = @ApplicationID


/*DROP PROC dbo.spc_UpdateApplication*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateEnvironment]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateEnvironment]
(
	@EnvironmentID int,
	@EnvName varchar(100)
)

AS
UPDATE [tblEnvironments] 
SET 
EnvName = @EnvName

WHERE
EnvironmentID = @EnvironmentID


/*DROP PROC dbo.spc_UpdateEnvironment*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateEnvReqStatusType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateEnvReqStatusType]
(
	@EnvReqStatusTypesID int,
	@Description varchar(50),
	@OrderBy int
)

AS
UPDATE [tblEnvReqStatusTypes] 
SET 
Description = @Description,
OrderBy = @OrderBy

WHERE
EnvReqStatusTypesID = @EnvReqStatusTypesID


/*DROP PROC dbo.spc_UpdateEnvReqStatusType*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateEnvRequest]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateEnvRequest]
(
	@EnvRequestID int,
	@RequestorID int,
    @OwnerID int,
    @ReleaseID int,
	@ApplicationID int,
	@DateFrom date,
	@TimeFrom time(0),
	@DateTo date,
	@TimeTo time(0),
	@EnvReqStatusTypesID int,
	@Notes nvarchar(4000)
)

AS
UPDATE [tblEnvRequests] 
SET 
	RequestorID = @RequestorID,
	OwnerID = @OwnerID,
	ReleaseID = @ReleaseID,
	ApplicationID = @ApplicationID,
	DateFrom = @DateFrom,
	TimeFrom = @TimeFrom,
	DateTo = @DateTo,
	TimeTo = @TimeTo,
	EnvReqStatusTypesID = @EnvReqStatusTypesID,
	Notes = @Notes

WHERE
EnvRequestID = @EnvRequestID

GO
/****** Object:  StoredProcedure [dbo].[spcUpdateEnvServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateEnvServer]
(
	@EnvServerID int,
	@EnvironmentID int,
	@ServerID int
)

AS
UPDATE [tblEnvServers] 
SET 
EnvironmentID = @EnvironmentID,
ServerID = @ServerID

WHERE
EnvServerID = @EnvServerID


/*DROP PROC dbo.spc_UpdateEnvServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateEnvStatus]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateEnvStatus]
(
	@EnvStatusID int,
	@AppEnvID int,
	@AppVersion varchar(20),
	@DatabaseVersion varchar(20),
	@DateTimeDeployed datetime
)

AS
UPDATE [tblEnvStatus] 
SET 
EnvStatusID = @EnvStatusID,
AppEnvID = @AppEnvID,
AppVersion = @AppVersion,
DatabaseVersion = @DatabaseVersion,
DateTimeDeployed = @DateTimeDeployed

WHERE
EnvStatusID = @EnvStatusID


/*DROP PROC dbo.spc_UpdateEnvStatus*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateProjectTeam]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateProjectTeam]
(
	@ProjectTeamID int,
	@Name varchar(100),
	@LeaderName int,
	@IsActive int
)

AS
UPDATE [tblProjectTeam] 
SET 
Name = @Name,
LeaderName = @LeaderName,
IsActive = @IsActive

WHERE
ProjectTeamID = @ProjectTeamID


/*DROP PROC dbo.spc_UpdateProjectTeam*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateRelease]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateRelease]
(
	@ReleaseID int,
	@ReleaseName varchar(100),
	@ReleaseDate datetime
)

AS
UPDATE [tblReleases] 
SET 
ReleaseName = @ReleaseName,
ReleaseDate = @ReleaseDate

WHERE
ReleaseID = @ReleaseID


/*DROP PROC dbo.spc_UpdateRelease*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateRole]
(
	@RoleID int,
	@RoleName varchar(50),
	@OrderBy int,
	@IsAdmin int
)

AS
UPDATE [tblRoles] 
SET 
RoleName = @RoleName,
OrderBy = @OrderBy,
IsAdmin = @IsAdmin

WHERE
RoleID = @RoleID


/*DROP PROC dbo.spc_UpdateRole*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateServer]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateServer]
(
	@ServerID int,
	@ServerName varchar(50),
	@ServerIPAddress varchar(30),
	@ServerType int,
	@URL varchar(500),
	@DirectoryPath varchar(500),
	@Owner int,
	@IsActive int
)

AS
UPDATE [tblServers] 
SET 
ServerName = @ServerName,
ServerIPAddress = @ServerIPAddress,
ServerType = @ServerType,
URL = @URL,
DirectoryPath = @DirectoryPath,
Owner = @Owner,
IsActive = @IsActive

WHERE
ServerID = @ServerID


/*DROP PROC dbo.spc_UpdateServer*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateServerType]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateServerType]
(
	@ServerTypeID int,
	@ServerTypeDescr varchar(400)
)

AS
UPDATE [tblServerType] 
SET 
ServerTypeDescr = @ServerTypeDescr

WHERE
ServerTypeID = @ServerTypeID


/*DROP PROC dbo.spc_UpdateServerType*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateUser]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateUser]
(
	@UserID int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@IsActive int
)

AS
UPDATE [tblUsers] 
SET 
FirstName = @FirstName,
LastName = @LastName,
IsActive = @IsActive

WHERE
UserID = @UserID


/*DROP PROC dbo.spc_UpdateUser*/
GO
/****** Object:  StoredProcedure [dbo].[spcUpdateUserRole]    Script Date: 3/16/2018 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcUpdateUserRole]
(
	@UserRoleID int,
	@UserID int,
	@RoleID int
)

AS
UPDATE [tblUserRoles] 
SET 
UserID = @UserID,
RoleID = @RoleID

WHERE
UserRoleID = @UserRoleID


/*DROP PROC dbo.spc_UpdateUserRole*/
GO
USE [master]
GO
ALTER DATABASE [DevOps] SET  READ_WRITE 
GO
