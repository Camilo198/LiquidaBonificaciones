USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 19/05/2020 7:16:14 p. m. ******/
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

	---Especial x Cantidad de Planes y por Monto

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2 or @idPlanBonificacion=9)
	begin

		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=9 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
		from BON_Liquidacion_Ventas
			where ventaValida=1 
			group by CodVendedor


			if (@idPlanBonificacion=1 or @idPlanBonificacion=9)
			begin
				update res
				set res.TotalVentasValidasXasesor=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalVentasValidasXasesor from BON_Resultados
				where TotalVentasValidasXasesor>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalVentasValidasXasesor<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
				end

				else if (@idPlanBonificacion=2)
				begin
				update res
				set res.TotalValorPlan=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
				
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalValorPlan from BON_Resultados
				where TotalValorPlan>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalValorPlan<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
				 end

		end



---------Calcula en base al presupuesto, Bono Grupal Asesor - Director , Bono por desarollo de equipos Asesor - Director 
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5 or @idPlanBonificacion=10 or @idPlanBonificacion=11 or @idPlanBonificacion=12)
	 begin
	 --- Calcula el cumplimiento de presupuesto x oficina
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where pre.Periodo=liv.MesLiquidacion
			and pre.Ano=liv.AñoLiquidacion
			and pre.Presupuesto>0
			group by liv.CodOficina	,pre.Presupuesto 
	
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=isnull(bvt.VentasTotales,100)
	from BON_Resultados as res 
	inner join BON_Liquidacion_Ventas as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	left join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3 or @idPlanBonificacion=10)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4 or @idPlanBonificacion=12)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5 or @idPlanBonificacion=11)
		begin

		---Calcula el total de ventas validas por vendedor
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from BON_Resultados as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales

		select OficCodigo, COUNT(OficCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=18)
					 
						union
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=18)
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and VendFecRet>=(select  Valor  from BON_Parametros where Id=6)

						) as t1

						group by OficCodigo




			update res
			set res.AsesoresXoficina=bvt.VentasTotales
			 from BON_Resultados as res 
			 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

			 ---Control de porcentaje Asesores por oficina
			 delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as res
				where AsistenciaDesEquiDir=1
				) as T1 
				where T1.AsesoresXoficina>0
				group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		if  (@idPlanBonificacion=5)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and AsistenciaDesEquiDir=1
			
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOfic=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOfic from BON_Resultados
		where 
	  	PorcentajeAsesoresConNventasValidasOfic>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOfic<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		

		end

		else if  (@idPlanBonificacion=11)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric) as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=30) -- Cantidad de Ventas Necesarias para aplicar Canal Especializado
				and AsistenciaDesEquiDir=1
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOficCE=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOficCE from BON_Resultados
		where 
	  	PorcentajeAsesoresConNventasValidasOficCE>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOficCE<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		

		end
			
	 end
  end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6 or @idPlanBonificacion=17)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)	
		where VentaValida=1 
		and CodPlan=4 
	--	and AsistenciaDesEquiDir=1
		group by liv.CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
		where VentaValida=1 and CodPlan!=4 
		--and res.AsistenciaDesEquiDir=1
		group by liv.CodOficina
		
		update res set res.TotalVentasValidasNuevosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)


	delete BON_VentasTotales
	insert BON_VentasTotales
		select distinct codOficina,TotalVentasValidasNuevosXoficina+TotalVentasValidasUsadosXoficina as TotalVentaOficina
		from BON_Resultados

		update res set res.TotalVentasXOficina=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

	----Calculas las Ventas ValidasAprobadas
	delete from BON_VentasTotales
	insert into BON_VentasTotales
				select distinct res.codOficina
				 ,case
				 when   res.TotalVentasValidasUsadosXoficina>
				 res.TotalVentasXOficina *(Select valor from BON_Parametros where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXOficina*(Select valor from BON_Parametros where Id=13)/100)
				  +TotalVentasValidasNuevosXoficina
				 else res.TotalVentasXOficina end  as VentasTotales
				 from BON_Resultados as res

		update res set res.TotalVentasAprobadasXoficina=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalVentasAprobadasXoficina from BON_Resultados
		 where 
		TotalVentasAprobadasXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalVentasAprobadasXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	end 

			----- Comisiones Asesor
	else if(@idPlanBonificacion=13)
	begin
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ComisionValida) 
		as VentasTotales
		from BON_PamVentasOutsorsing
			where ComisionValida=1 
			group by CodVendedor

			update res
				set res.TotalComisionesValidasXVendedor=bvt.VentasTotales
				from BON_ResultadosComisiones as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)

			delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ValorPlan) 
		as ValorPlan
		from BON_PamVentasOutsorsing
			where ComisionValida=1 
			group by CodVendedor

			update res
				set res.TotalValorPlan=bvt.VentasTotales
				from BON_ResultadosComisiones as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalComisionesValidasXvendedor from BON_ResultadosComisiones
				where TotalComisionesValidasXvendedor>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalComisionesValidasXvendedor<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)


		end
		----

	-------------------
	-----------Comisiones Director
	else if (@idPlanBonificacion=16)
	begin



	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de montos de directores
	select CodigoDirector,CantidadVentasValidas from(
		Select  liv.CodigoDirector
		,Sum(liv.ValorPlan) as 'TotalPlanes'
		,Sum(ComisionValida) as 'CantidadVentasValidas' 
		from BON_PamVentasOutsorsing as liv
		where ComisionValida=1
		group by liv.CodigoDirector
		) as t1
		where
		t1.CantidadVentasValidas >=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and t1.CantidadVentasValidas<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
		
	end 
	-----------------------
	
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from BON_Resultados as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
			--and AsistenciaDesEquiGer=1
			where VentaValida=1 
			and CodPlan=4 
			group by liv.CodZona
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
			where VentaValida=1 and CodPlan!=4 
		--	and AsistenciaDesEquiGer=1
			group by liv.CodZona
		
		update res set res.TotalVentasValidasNuevosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


		---Calcula las ventas totales
		delete BON_VentasTotales
		insert BON_VentasTotales
			select distinct codZona,TotalVentasValidasNuevosXzona+TotalVentasValidasUsadosXzona as TotalVentaZona
			from BON_Resultados

		update res set res.TotalVentasXzona=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		----Calculas las Ventas ValidasAprobadas
		delete from BON_VentasTotales
		insert into BON_VentasTotales
				select distinct res.codZona
				 ,case
				 when   res.TotalVentasValidasUsadosXzona>
				 res.TotalVentasXzona *(Select valor from BON_Parametros where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXzona*(Select valor from BON_Parametros where Id=13)/100)
				  +TotalVentasValidasNuevosXzona
				 else res.TotalVentasXzona end  as VentasTotales
				 from BON_Resultados as res

		update res set res.TotalVentasAprobadasXzona=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		---Calculo la Cuota del presupuesto
		delete from BON_VentasTotales
		insert into BON_VentasTotales
			select distinct res.codZona,TotalVentasAprobadasXzona/pxz.Presupuesto*100 as cuotaPresupuesto 
			from BON_Resultados as res
			inner join BON_PresupuestoXzona as pxz on(pxz.CodZona=res.codZona)
			and pxz.Presupuesto>0

		update res set res.TotalCumplimientoPresupuestoXzona=isnull(bvt.VentasTotales,100) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

	



	
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona

				delete BON_VentasTotales
				insert BON_VentasTotales			
				select RegiCodigo, COUNT(RegiCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=29)
					 
						union
						select distinct VendIdeNro, RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=29)
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and VendFecRet>=(select  Valor  from BON_Parametros where Id=6)

						) as t1

						group by RegiCodigo

				

				update res
				set res.AsesoresXzona=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)




				--Control de porcentaje de asesores detectados
				delete BON_VentasTotales
				insert BON_VentasTotales
							select T1.codZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_Resultados as res
						where res.AsistenciaDesEquiGer=1
						) as T1 
						where T1.AsesoresXzona>0
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)



				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select vde.codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by vde.codZona  order by vde.codZona desc) as 'rn'	 from  BON_Resultados as vde

						where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and vde.AsistenciaDesEquiGer=1	
						
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
			
				
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

			

				---Retorna las Zonas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codZona,PorcentajeAsesoresConNventasValidasZona from BON_Resultados
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)


				  end
				  
			 
			


			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then 0
					else
					Sum(ventaValida) end 
					as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)
					where VentaValida=1 
				--	and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and CodPlan=4 -- Usados
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<dateadd(d,1,ret.FechaFinalReto)-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales

					Select liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then ret.RetoEnVentas
					else
					Sum(ventaValida) 
					end as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)			
					where VentaValida=1
					 and CodPlan!=4 -- Nuevos
					--and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<dateadd(d,1,ret.FechaFinalReto)-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona,ret.RetoEnVentas
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as ret 
					where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  ret.CodigoZona
						 ,case
						 when   ret.VentasValidasUsadosAlcanzadas>
						 ret.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100  then 	 
						 CEILING(ret.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else ret.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as ret
						 where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion


				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join BON_Liquidacion_Ventas as lib on (lib.codZona=ret.CodigoZona)
					
					where IdBonificacion=@idBonificacion
					and ret.Periodo=lib.MesLiquidacion
					and ret.Ano=lib.AñoLiquidacion
					and TotalVentasAprobadasAlcanzadas>=ret.RetoEnVentas -- Reto a Cumplir		
				
			  end	 
			
	end 

	else if (@idPlanBonificacion=14)
	begin



	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct res.codVend,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoAsesorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoAsesorExtraSonadoresDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	else if (@idPlanBonificacion=15)
	begin


	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct pre.CodigoOficina,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoDirectorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoDirectorExtraSonadorDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	--- Bono Gerente  Permanencia de Clientes
	
	else if (@idPlanBonificacion=18)
	begin
	
	delete BON_VentasTotales
	insert BON_VentasTotales

	select distinct codZona,PermanenciaTotalZona from BON_Resultados
	where PermanenciaTotalZona>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	and PermanenciaTotalZona<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
			
					
	end

 
 /*declare @idplanBonificacion int=8,
			@idbonificacion int=309*/
	
return @@rowcount

END
