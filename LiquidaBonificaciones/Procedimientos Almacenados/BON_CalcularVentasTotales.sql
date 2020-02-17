USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 17/02/2020 9:03:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_CalcularVentasTotales]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from BON_VentasTotales
	-- Calcula por cantidad de planes por asesor
	if(@idPlanBonificacion=1 or @idPlanBonificacion=2)
	begin
	insert Into BON_VentasTotales
	select * from(
	select 
	 CodVendedor ,
	case 
	when @idPlanBonificacion =1 then SUM(VentaValida) 
	when @idPlanBonificacion=2 then SUM (ValorPlan)
	end as VentasTotales
	 from BON_Liquidacion_Ventas where ventaValida=1 
	group by CodVendedor ) as T1
	 where 
	 T1.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 and T1.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 end
	 --Calcula en base al presupuesto
	else if(@idPlanBonificacion=3 or @idPlanBonificacion=4)
	begin
	insert Into BON_VentasTotales
	select * from(	
	select 
	 liv.CodOficina ,
	 cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
	 from BON_Liquidacion_Ventas as liv
	 inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
	  where ventaValida=1
	group by liv.CodOficina
	,pre.Presupuesto
	 ) as T1
	 where 
	 T1.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 and T1.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	 end



 --Calcula en base al presupuesto parametrizado para desarrollo de equipos
	else if(@idPlanBonificacion=5)
	begin
	insert Into BON_VentasTotales
	select * from(	
	select 
	 liv.CodOficina ,
	 cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales
	 from BON_Liquidacion_Ventas as liv
	 inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
	  where ventaValida=1
	group by liv.CodOficina
	,pre.Presupuesto
	 ) as T1
	 where 
	 T1.VentasTotales>=(Select Valor from BON_Parametros where Id=25)-- Cumplimiento de Cuota en procentaje pàra desarrollo de equipos


	 delete from BON_VentasXdesarrolloEquipos
	 insert into  BON_VentasXdesarrolloEquipos
	 Select VendCodigo,RegiCodigo,OficCodigo,DiasLaborados
	 ,SUM(lve.VentaValida) as Ventas
	 --,* 
	 from (
	 select Cedula,DiasLaborados
	 ,ROW_NUMBER() over (PARTITION by ase.vendIdeNro  order by ase.vendCodigo desc) as 'rn'	
	 ,VendCodigo
	 ,ase.OficCodigo
	 ,ase.RegiCodigo
	  from BON_AsistenciaTotal as ast --Solo participan personas que asistieron en este periodo
	 inner join BON_Asesores  as ase on (ast.Cedula=ase.VendIdeNro)
	  where OficCodigo in 
	 (select vto.Codigo from BON_VentasTotales as vto)
	 ) as T1 
	  inner join BON_Liquidacion_Ventas as lve on (lve.CodVendedor=T1.VendCodigo)
	 where rn=1
	 group by
	 VendCodigo,RegiCodigo,OficCodigo,DiasLaborados

	 delete from BON_AsesoresXoficina
	 insert into BON_AsesoresXoficina
	 select CodOficina, MAX(rn) as CantidadAsesores from(
	 select CodOficina,CantidadVentasValidas
	 ,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos
	 group by CodOficina,CantidadVentasValidas
	) as T1
	group by CodOficina

	delete BON_VentasTotales
	insert BON_VentasTotales
	select * from (
	select T1.CodOficina, cast(MAX(rn) as numeric)/Cast(axo.CantidadAsesores as numeric)*100 as Cuota from(
	 select CodOficina,CantidadVentasValidas
	 ,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos as vde
	 where vde.CantidadVentasValidas>=(Select Valor from BON_Parametros where Id=26)
	 group by Vde.CodOficina,Vde.CantidadVentasValidas
	) as T1
	inner join BON_AsesoresXoficina as axo on (axo.CodOficina=T1.CodOficina) 
	group by T1.CodOficina,axo.CantidadAsesores) as T2

	where 
		T2.Cuota>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 and T2.Cuota<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)


	 end
	
END
