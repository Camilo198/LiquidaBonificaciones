USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultarFechaCierreCRM]    Script Date: 11/05/2020 11:53:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_ConsultarFechaCierreCRM]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 FechaActualizacion from BON_CierreCRM order by FechaActualizacion desc
END
