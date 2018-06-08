USE [NPS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Jason E.>
-- Create date: <03/18/2016>
-- Description:	<Delete old accoutning data>
-- =============================================
CREATE PROCEDURE [dbo].[record_cleanup_3yr]

AS

SET NOCOUNT ON

DECLARE @retention_yr datetime

SET @retention_yr = DATEADD(YEAR, -3, GETDATE())

DELETE
FROM NPS.dbo.accounting_data
WHERE NPS.dbo.accounting_data.timestamp <= @retention_yr

SET NOCOUNT OFF


GO
