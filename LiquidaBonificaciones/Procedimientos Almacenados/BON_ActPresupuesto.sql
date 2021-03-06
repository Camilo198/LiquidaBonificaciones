USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActPresupuesto]    Script Date: 19/03/2020 5:24:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_ActPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@periodo int,
@ano int,
@usuarioactualiza varchar(50),
@codZona int,
@codDirector int,
@codGerente int,
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

    -- Update statements for procedure here
update BON_Presupuesto
set  Presupuesto=@Presupuesto,CodZona=@codZona,CodigoDirector=@codDirector,CodigoGerente=@codGerente,
FechaActualiza=GETDATE(),UsuarioActualiza=@usuarioactualiza,
RetoSonadoresDia=@retoSonadores, RetoExtraSonadoresDia=@retoExtraSonadores,
BonoAsesorSonadoresDia=@bonoAsesorSonadores,BonoAsesorExtraSonadoresDia=@bonoAsesorExtraSonadores,
BonoDirectorSonadoresDia=@bonoDirectoSonadores,BonoDirectorExtraSonadorDia=@bonoDirectorExtraSonadores


where CodigoOficina=@CodOficina and Periodo=@periodo and Ano=@ano
RETURN @@RowCount
END
