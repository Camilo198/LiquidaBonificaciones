USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_RptAsesoresPre]    Script Date: 07/04/2020 2:06:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_RptAsesoresPre] 
	-- Add the parameters for the stored procedure here
	-- @Periodo  int,
--	@Año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @usuario varchar(50)
	declare @periodo int
	declare @ano int

	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
    -- Insert statements for procedure here
	select distinct
liv.CodVendedor as 'CODIGO'
,res.Cedula AS 'CEDULA'
,liv.NomVendedor AS 'NOMBRE'
,liv.NomOficina AS 'CONCESIONARIO'
,lib.[PermanenciaDiferida%] as 'PERMANENCIA DIFERIDA'
,lib.[PermanenciaTotal%] AS 'PERMANENCIA TOTAL'
,liv.Permanencia AS 'CUMPLE PERMANENCIA'
,res.TotalCumplimientoPresupuestoXoficina AS 'CUMPLIMIENTO EQUIPO'
,lib.DiasAsistidos as 'DIAS LABORADOS'
,res.AsistenciaDesEquiDir AS 'CUENTA DES. EQUI DIRECTOR'
,res.AsistenciaDesEquiGer AS 'CUENTA DES. EQUI GERENTE'
,res.TotalVentasValidasXasesor AS 'VENTAS TOTALES VALIDAS'
,res.TotalValorPlan AS 'SUMA VALOR DEL PLAN'
,Case
when liv.TipoOficina=1
then 
tob.Bonificacion1
else
tob.Bonificacion9
end
as ' ESPECIAL # VENTAS'
,tob.Bonificacion2 as 'ESPECIAL VALOR DEL PLAN'
,Case
when liv.TipoOficina=1
then
tob.Bonificacion3
else
tob.Bonificacion10
end as 'GRUPAL'
,tob.Bonificacion14 as 'BASE DE CLIENTES'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,case
when liv.TipoOficina=1
then
tob.Bonificacion1+tob.Bonificacion2 +tob.Bonificacion3+tob.Bonificacion14+0+0 
else
tob.Bonificacion9+0 +tob.Bonificacion10+tob.Bonificacion14+0+0 
End as 'TOTAL BONIFICACION'
 from BON_Liquidacion_Ventas as liv
inner join BON_Resultados as res  on (res.codVend=liv.CodVendedor)
inner join BON_LiquidacionBonificaciones as lib on (lib.CodigoVendedor=liv.CodVendedor)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=liv.CodVendedor)
where lib.Periodo=liv.MesLiquidacion
and lib.Año=liv.AñoLiquidacion
and liv.CodCargoAsesor=3
END
