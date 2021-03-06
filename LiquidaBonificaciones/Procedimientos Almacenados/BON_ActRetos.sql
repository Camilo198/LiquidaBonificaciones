USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActPresupuesto]    Script Date: 02/03/2020 12:45:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ActReto] 
	-- Add the parameters for the stored procedure here
@CodZona int,
@RetoEnVentas int,
@periodo int,
@ano int,
@codGerente int,
@fechaInicioReto datetime,
@fechaFinReto datetime,
@valorBono numeric (18,0),
@usuarioactualiza varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_Retos
set  RetoEnVentas=@RetoEnVentas,
FechaActualiza=GETDATE(),
UsuarioActualiza=@usuarioactualiza
,CodigoZona=@CodZona,
ValorBonificacion=@valorBono
where CodigoGerente=@codGerente and Periodo=@periodo 
and Ano=@ano and FechaInicialReto=@fechaInicioReto 
and FechaFinalReto=@fechaFinReto
RETURN @@RowCount
END
