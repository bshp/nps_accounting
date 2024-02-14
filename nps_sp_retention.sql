USE [NPS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Jason E.>
-- Create date: <03/18/2016>
-- Description:	<Delete old accounting data>
-- =============================================
CREATE PROCEDURE [dbo].[record_cleanup]
(
    @retention_yr datetime2(3) NULL = DATEADD(YEAR,-3,SYSDATETIME())
)
AS

SET NOCOUNT ON

DELETE
FROM NPS.dbo.accounting_data
WHERE NPS.dbo.accounting_data.[timestamp] <= @retention_yr

SET NOCOUNT OFF


GO
