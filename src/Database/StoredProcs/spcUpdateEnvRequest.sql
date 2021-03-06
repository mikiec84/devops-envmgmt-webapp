USE [DevOps]
GO

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