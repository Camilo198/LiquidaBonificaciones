USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_RptGerentesPre]    Script Date: 19/05/2020 6:58:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_RptGerentesPre]
	-- Add the parameters for the stored procedure here
	
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
	 	 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Presupuesto<900
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc
--------


select distinct
lib.CodigoVendedor as 'CODIGO'
,lib.Cedula AS 'CEDULA'
,ase.VendNombre AS 'NOMBRE'
,lib.CodigoZona as 'COD_ZONA'
,ase.RegiNombre AS 'NOM_ZONA'
,lib.PermanenciaDiferida as 'PERMANENCIA DIFERIDA'
,lib.PermanenciaTotal AS 'PERMANENCIA TOTAL'
,res.PermanenciaGerente AS 'CUMPLE PERMANENCIA'
,isnull(pre.Presupuesto,0) as 'PPTO'
,res.TotalVentasAprobadasXzona as 'EJEC'
,res.TotalCumplimientoPresupuestoXzona AS 'CUMPLIMIENTO'
,res.PorcentajeAsesoresConNventasValidasZona as 'desarrollo de equipos'
,CASE
WHEN
res.VentasRegistradasSinCeremoniaXzona>res.VentasMaximasSinCeremoniaXzona
THEN
'SI'
ELSE
'NO'
END
AS 'PENALIZAR BONO'
,tob.Reto1 as 'Reto1'
,tob.Reto2 as 'Reto2'
,tob.Reto3 as 'Reto3'
,tob.Reto4 as 'Reto4'
,tob.Reto5 as 'Reto5'
,tob.Reto6 as 'Reto6'
,tob.Reto7 as 'Reto7'
,tob.Reto8 as 'Reto8'
,tob.Reto9  as 'Reto9'
,tob.Bonificacion8  as '9Retos'
,tob.Bonificacion7 AS 'Bono Desarrollo Equipos'
,tob.Bonificacion18 as 'Bono Permanencia de Clientes'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,tob.Bonificacion7+tob.Bonificacion8 +tob.Bonificacion18+0+0-0  as 'TOTAL BONIFICACION'
from BON_LiquidacionBonificacionesGrupales as lib
inner join BON_Resultados as res  on (lib.CodigoZona=res.codZona)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=lib.CodigoVendedor)
inner join BON_Asesores as ase on (lib.CodigoVendedor=ase.VendCodigo)
left join BON_PresupuestoXzona as pre on (pre.CodZona=lib.CodigoZona)
where ase.VendTipoVen=4 --Gerente

END
