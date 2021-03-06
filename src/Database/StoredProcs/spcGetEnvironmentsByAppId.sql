USE [DevOps]
GO

IF EXISTS (
        SELECT 'DROP PROCEDURE ' + name
        FROM sys.procedures WITH(NOLOCK)
        WHERE 0=0
      and NAME = 'spcGetEnvironmentsByAppId'
          AND type = 'P'
      )
  DROP PROCEDURE [dbo].[spcGetEnvironmentsByAppId]
--DROP PROCEDURE [dbo].[spcInsertServerType]
GO


CREATE PROCEDURE [dbo].[spcGetEnvironmentsByAppId]
  @ApplicationID int
AS
SELECT tblEnvironments.EnvironmentID, tblEnvironments.EnvName
FROM tblEnvironments 
	inner join tblAppEnvs on tblAppEnvs.EnvironmentID=tblEnvironments.EnvironmentID
WHERE tblAppEnvs.ApplicationID = @ApplicationID

/*DROP PROC dbo.spcGetEnvironmentsByAppId*/