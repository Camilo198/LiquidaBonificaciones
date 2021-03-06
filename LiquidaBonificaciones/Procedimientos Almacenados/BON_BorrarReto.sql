USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarPresupuesto]    Script Date: 02/03/2020 1:01:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarReto] 
	-- Add the parameters for the stored procedure here
@CodGerente int,
@Periodo int,
@Ano int,
@fechaInicioReto datetime,
@fechaFinReto datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_Retos
where CodigoGerente=@CodGerente AND Periodo=@Periodo AND Ano=@Ano
and FechaInicialReto=@fechaInicioReto and FechaFinalReto=@fechaFinReto
RETURN @@RowCount
END
