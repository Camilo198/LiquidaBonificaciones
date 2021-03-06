USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearPresupuesto]    Script Date: 20/03/2020 3:38:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_CrearPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@Periodo int,
@Ano int,
@usuarioactualiza varchar(50),
@CodZona int,
@CodGerente int,
@CodDirector int,
@retoSonadores int,
@retoExtraSonadores int,
@bonoAsesorSonadores numeric(18,0),
@bonoAsesorExtraSonadores numeric(18,0),
@bonoDirectoSonadores numeric(18,0),
@bonoDirectorExtraSonadores numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @idPlanBonificacion int=14
    -- Update statements for procedure here
insert into BON_Presupuesto(CodigoOficina,Presupuesto,Periodo,Ano,FechaActualiza,UsuarioActualiza
,CodZona,CodigoGerente,CodigoDirector,RetoSonadoresDia,RetoExtraSonadoresDia,BonoAsesorSonadoresDia,BonoAsesorExtraSonadoresDia
,BonoDirectorSonadoresDia,BonoDirectorExtraSonadorDia,idPlanBonificacion)
values (@CodOficina, @Presupuesto,@Periodo,@Ano,
GETDATE(),@usuarioactualiza,@CodZona,@CodGerente,@CodDirector,@retoSonadores,@retoExtraSonadores,
@bonoAsesorSonadores,@bonoAsesorExtraSonadores,@bonoDirectoSonadores,@bonoDirectorExtraSonadores,@idPlanBonificacion)
RETURN @@RowCount
END
