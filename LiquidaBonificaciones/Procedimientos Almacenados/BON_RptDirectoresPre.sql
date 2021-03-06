USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_RptDirectoresPre]    Script Date: 19/05/2020 5:16:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_RptDirectoresPre]
	-- Add the parameters for the stored procedure here
--	@Periodo int,
--    @Año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		declare @usuario varchar(50)
	declare @periodo int
	declare @ano int

	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano

select distinct
lib.CodigoVendedor as 'CODIGO'
,lib.CodigoOficiona as 'OFICINA'
,lib.Cedula AS 'CEDULA'
,ase.VendNombre AS 'NOMBRE'
,lib.CodigoZona as 'ZONA'
,ase.OficNombre AS 'CONCESIONARIO'
,lib.PermanenciaDiferida as 'PERMANENCIA DIFERIDA'
,lib.PermanenciaTotal AS 'PERMANENCIA TOTAL'
,res.PermanenciaDirector AS 'CUMPLE PERMANENCIA'
,isnull(pre.Presupuesto,0) as 'CUOTA'
,res.TotalVentasRegistradasXoficina as 'Ventas Radicadas'
,res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina-isnull(pre.Presupuesto,0) as 'Ventas Adicionales'
,lib.DiasAsistidos as 'DIAS LABORADOS'
,res.TotalVentasValidasUsadosXoficina as 'CANT. USADOS'
,CEILING((res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina)*(SELECT VALOR FROM BON_Parametros WHERE id=13)/100) as 'lIMITE VENTA USADOS'
,CASE
WHEN 
res.TotalVentasValidasUsadosXoficina>CEILING((res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina)*(SELECT VALOR FROM BON_Parametros WHERE id=13)/100)
THEN
'VERDADERO'
ELSE
'FALSO'
END AS 'PENALIDAD'
,res.TotalCumplimientoPresupuestoXoficina AS 'Result Grupo'
,case
when
liv.TipoOficina=1
then
res.PorcentajeAsesoresConNventasValidasOfic
else
res.PorcentajeAsesoresConNventasValidasOficCE
end  as 'Desarrollo De Equipos'
,res.TotalVentasAprobadasXoficina AS 'VENTAS TOTALES VALIDAS'
,CASE
WHEN
res.VentasRegistradasSinCeremoniaXoficina>res.VentasMaximasSinCeremoniaXoficina
THEN
'SI'
ELSE
'NO'
END
AS 'PENALIZAR BONO'
,Case
 when liv.TipoOficina=1
 then 
	tob.Bonificacion4
 else	
 tob.Bonificacion12
END AS 'Bono Cumpl ppto'
,Case
 when liv.TipoOficina=1
 then 
	tob.Bonificacion5
else 
	tob.Bonificacion11
END as 'Desarrollo de Equipos'
,Case
 when liv.TipoOficina=1
 then
	tob.Bonificacion6
else 
		tob.Bonificacion17
end as 'Nuevo Especial' -- Solo este tiene penalidad
,tob.Bonificacion15 as 'BASE DE CLIENTES'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,Case 
when liv.TipoOficina=1
then
	
	tob.Bonificacion4+tob.Bonificacion5 +tob.Bonificacion6+tob.Bonificacion15+0+0-0 
else
	tob.Bonificacion12+tob.Bonificacion11 +tob.Bonificacion17+tob.Bonificacion15+0+0-0 

end as 'TOTAL BONIFICACION'
 from BON_LiquidacionBonificacionesGrupales as lib
inner join BON_Resultados as res  on (lib.CodigoOficiona=res.codOficina)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=lib.CodigoVendedor)
inner join BON_Asesores as ase on (lib.CodigoVendedor=ase.VendCodigo)
inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=lib.CodigoOficiona)
left join BON_Presupuesto as pre on (pre.CodigoOficina=lib.CodigoOficiona)
where lib.Periodo=liv.MesLiquidacion
and lib.Año=liv.AñoLiquidacion
and pre.Periodo=liv.MesLiquidacion
and pre.Ano=liv.AñoLiquidacion
and ase.VendTipoVen=1 --Director
END
