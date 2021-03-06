USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearReto]    Script Date: 16/03/2020 10:12:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_CrearReto] 
	-- Add the parameters for the stored procedure here
@CodZona int,
@RetoEnVentas int,
@periodo int,
@ano int,
@codGerente int,
@fechaInicioReto datetime,
@fechaFinReto datetime,
@valorBono numeric (18,0),
@usuarioactualiza varchar(50),
@numeroReto int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_Retos(CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,IdPlanBonificacion,NumeroReto)
values (@CodZona, @RetoEnVentas,@Periodo,@Ano,@codGerente,
@fechaInicioReto,@fechaFinReto,
@valorBono,
GETDATE(),@usuarioactualiza,8,@numeroReto)
RETURN @@RowCount
END
