USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_RptComisionDirectoresPre]    Script Date: 19/05/2020 12:10:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_RptComisionDirectoresPre]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @usuario varchar(50)
	declare @periodo int
	declare @ano int
	declare @contrato varchar (50)
	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
    -- Insert statements for procedure here
	select 
	pam.Contrato as 'Contrato',
	pam.Afiliado as 'Nombre del Cliente',
	pam.FechaVenta as 'Fecha de Ingreso de La Ventas',
	pam.ValorPlan as 'Valor Del Plan' ,
	case
	when
	ase.VendTipoVen=1
	then
	'DIRECTOR'
	else
	'ASESOR' end as 'Cargo',
	pam.CodigoDirector as 'CODIGO Director',
	pam.IdeDirector as 'Identificacion Director',
	pam.NombreDirector as 'Nombre del Director',
	pam.CodOficina as 'Codigo Oficina',
	pam.Oficina as 'Nombre del Equipo',
	pam.EstadoCupo as 'Estado del Cliente',
	pam.VentaInscripcion as 'No Habil. Tipo 2',
	pam.LlamadaBV as 'Estado Llamada',
	pam.NoExclucion as 'No Marca Excl',
	pam.Asamblea as 'Asamblea',
	pam.EstadoSICO as 'Estado Sico',
	pam.ComisionValida as 'Comision Valida',
	case
	when
	ase.VendTipoVen!=1
	then
	0.00 
	else
	isnull(bes.ValorBono,0.00) end as '%Comision Director',
	case
	when
	ase.VendTipoVen!=1
	then
	0.00 
	else	
	isnull(lib.ValorBono,0.00) end as 'Valor Comision Director'


 from BON_PamVentasOutsorsing as pam
left join BON_LiquidacionBonificaciones as lib on (pam.Contrato=lib.Contrato
and lib.IdPlan in (16) 
and lib.Periodo=pam.MesLiquidacion
and lib.Año=pam.AñoLiquidacion)
left join BON_BonificacionEspecial as bes on (bes.ID=lib.IdBonificacion)
left join BON_Asesores as ase on (ase.VendCodigo=pam.CodigoDirector)

order by Contrato

END
