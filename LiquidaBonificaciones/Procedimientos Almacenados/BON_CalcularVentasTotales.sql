USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 17/02/2020 3:30:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_CalcularVentasTotales]
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
---------------------- Calcula por cantidad de planes por asesor
	if(@idPlanBonificacion=1 or @idPlanBonificacion=2)
	begin
	 insert Into BON_VentasTotales
		select * from(
			select CodVendedor ,
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
			group by liv.CodOficina	,pre.Presupuesto) as T1
		where 
		T1.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and T1.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	 end



 --------------Calcula en base al presupuesto parametrizado para desarrollo de equipos
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
		 group by liv.CodOficina,pre.Presupuesto) as T1
	  where 
	  T1.VentasTotales>=(Select Valor from BON_Parametros where Id=25)-- Cumplimiento de Cuota en procentaje pàra desarrollo de equipos
	  
	  
	 delete from BON_VentasXdesarrolloEquipos
	 insert into  BON_VentasXdesarrolloEquipos	  	 
	 select 
	 VendCodigo,RegiCodigo,OficCodigo,DiasLaborados,SUM(liv.VentaValida) as Ventas
	 from BON_Liquidacion_Ventas as liv
	 inner join BON_Asesores as ase on (ase.VendCodigo=liv.CodVendedor) 
	 inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
	 inner join BON_VentasTotales as vto on (vto.Codigo=ase.RegiCodigo)
	 group by VendCodigo,RegiCodigo,OficCodigo,DiasLaborados
	 order by RegiCodigo
	
	  delete from BON_AsesoresXgrupo
	  insert into BON_AsesoresXgrupo
	   select CodOficina, MAX(rn) as CantidadAsesores from(
			select CodOficina,CantidadVentasValidas,CodVendedor
			,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos
			group by CodOficina,CantidadVentasValidas,CodVendedor) as T1
		group by CodOficina


	  delete BON_VentasTotales
	  insert BON_VentasTotales
		select * from (
			select T1.CodOficina, 
			cast(MAX(rn) as numeric)/Cast(axo.CantidadAsesores as numeric)*100 as Cuota from(
			 select CodOficina,CantidadVentasValidas
			 ,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos as vde
			 where vde.CantidadVentasValidas>=(Select Valor from BON_Parametros where Id=26)
			 group by Vde.CodOficina,Vde.CantidadVentasValidas) as T1
		inner join BON_AsesoresXgrupo as axo on (axo.CodigoGrupo=T1.CodOficina) 
		group by T1.CodOficina,axo.CantidadAsesores) as T2
		where 
	  	T2.Cuota>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and T2.Cuota<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	 end

-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6)
	begin
	delete from BON_VentasValidasXtipoVenta	
	insert into BON_VentasValidasXtipoVenta
	--Clasificacion de ventas Usados
		Select  CodOficina,Sum(ventaValida) as 'CantidadVentasValidas','2' as IdTipoVenta 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)	
		where VentaValida=1 and CodTipoVenta=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=18)
		group by CodOficina

		union--Clasificacion de Ventas Nuevos
		Select CodOficina,Sum(ventaValida) as 'CantidadVentasValidas','1' as IdTipoVenta 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
		where VentaValida=1 and CodTipoVenta!=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=18)
		group by CodOficina

	delete BON_VentasTotalesXgrupo
	insert BON_VentasTotalesXgrupo
		select Codigo,SUM(CantidadVentas) as TotalVentaOficina
		from BON_VentasValidasXtipoVenta group by Codigo

	delete from BON_VentasTotales
	insert into BON_VentasTotales
		Select * from(
			Select Codigo, SUM(VentasTotales) as VentasTotales from(
				select vvt.Codigo
				 ,case
				 when  vvt.TipoVenta='2' and SUM(vvt.CantidadVentas)>
				 vto.Ventas	 *(Select valor from BON_Parametros where Id=13)/100  then 	 
				 CEILING(vto.Ventas*(Select valor from BON_Parametros where Id=13)/100) 
				 when vvt.TipoVenta='2' and SUM(vvt.CantidadVentas)<=
				 vto.Ventas *(Select valor from BON_Parametros where Id=13)/100 then
				 SUM(vvt.CantidadVentas) else SUM(vvt.CantidadVentas)  end  as VentasTotales
				 from BON_VentasValidasXtipoVenta as vvt	
				 inner join BON_VentasTotalesXgrupo as vto on (vto.Codigo=vvt.Codigo)
				 group by CantidadVentas,vvt.Codigo,TipoVenta,Ventas) as T1 
			group by Codigo) as T2
		 where 
		T2.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and T2.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	--Valida el porcentaje de Participacion en Ceremonia
	delete from BON_PorcentajeSinCeremonia
	insert BON_PorcentajeSinCeremonia

	select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia from BON_Liquidacion_Ventas where CodOficina in (select Codigo from BON_VentasTotales)
	 group by CodOficina

	end 

-----------------Especial por Desarrollo de equipos Gerente
	else if (@idPlanBonificacion=7)
	begin
		 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas)
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

	delete from BON_VentasValidasXtipoVenta	
	insert into BON_VentasValidasXtipoVenta
	--Clasificacion de ventas Usados
		Select  CodZona,Sum(ventaValida) as 'CantidadVentasValidas','2' as IdTipoVenta 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)	
		where VentaValida=1 and CodTipoVenta=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)
		group by CodZona
		union--Clasificacion de Ventas Nuevos
		Select CodZona,Sum(ventaValida) as 'CantidadVentasValidas','1' as IdTipoVenta 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
		where VentaValida=1 and CodTipoVenta!=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)
		group by CodZona

	delete BON_VentasTotalesXgrupo
	insert BON_VentasTotalesXgrupo		
		select Codigo,SUM(CantidadVentas)TotalVentasZona
		from BON_VentasValidasXtipoVenta group by Codigo

	
	insert Into  BON_VentasTotales
	  select * from(	
		select 
		 vtg.Codigo ,
		 cast(vtg.Ventas as numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales
		 from BON_VentasTotalesXgrupo as vtg
		 inner join BON_PresupuestoXzona as pre on (pre.CodZona=vtg.Codigo)-- solo Zonas que estan en el presupuesto
		 ) as T1
	  where 
	  T1.VentasTotales>=(Select Valor from BON_Parametros where Id=25)-- Cumplimiento de Cuota en procentaje pàra desarrollo de equipos


	 delete from BON_VentasXdesarrolloEquipos
	 insert into  BON_VentasXdesarrolloEquipos
	 --Calcula las ventas de todos los asesores que tienen ventas validas
		select 
			VendCodigo,RegiCodigo,OficCodigo,DiasLaborados,SUM(liv.VentaValida) as Ventas
			from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (ase.VendCodigo=liv.CodVendedor) 
			inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
			inner join BON_VentasTotales as vto on (vto.Codigo=ase.RegiCodigo)
			group by VendCodigo,RegiCodigo,OficCodigo,DiasLaborados
			order by RegiCodigo
	


	  delete from BON_AsesoresXgrupo
	  insert into BON_AsesoresXgrupo
		select CodZona, MAX(rn) as CantidadAsesores from(
			select vde.CodZona,vde.CantidadVentasValidas,vde.CodVendedor
			,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos as vde
			group by CodZona,CantidadVentasValidas,vde.CodVendedor
			) as T1
		group by CodZona

	 
	  delete BON_VentasTotales
	  insert BON_VentasTotales
		select * from (
			select T1.CodZona, 
			cast(MAX(rn) as numeric)/Cast(axo.CantidadAsesores as numeric)*100 as Cuota from(
			 select CodZona,CantidadVentasValidas
			 ,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_VentasXdesarrolloEquipos as vde
			 where vde.CantidadVentasValidas>=(Select Valor from BON_Parametros where Id=26)
			 group by Vde.CodZona,Vde.CantidadVentasValidas
			 ) as T1
		inner join BON_AsesoresXgrupo as axo on (axo.CodigoGrupo=T1.CodZona) 
		group by T1.CodZona,axo.CantidadAsesores) as T2
		where 
	  	T2.Cuota>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and T2.Cuota<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
	
	  ----Valida el porcentaje de Participacion en Ceremonia
	  delete from BON_PorcentajeSinCeremonia
	  insert BON_PorcentajeSinCeremonia
	  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
	  from BON_Liquidacion_Ventas 
	  where CodZona in (select Codigo from BON_VentasTotales)
	  group by CodZona		 
	end 
return @@rowcount

END
