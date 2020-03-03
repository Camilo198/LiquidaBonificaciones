USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 02/03/2020 10:24:21 a. m. ******/
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

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2)
	begin

		
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
		/*	and CodOficina not in 
			(select OficCodigo from BON_Asesores 
				where 
				OficNombre like '%canal Especializado%'
				or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
				group by OficCodigo)-- Excluye asesores de Canal Especializado*/
			group by CodVendedor
	if (@idPlanBonificacion=1)
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

	


---------Calcula en base al presupuesto, Bono Grupas Asesor - Director
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5)
	 begin
	
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where ventaValida=1
			/*and CodOficina not in 
			(select OficCodigo from BON_Asesores 
				where 
				OficNombre like '%canal Especializado%'
				or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
				group by OficCodigo)-- Excluye asesores de Canal Especializado*/
			group by liv.CodOficina	,pre.Presupuesto 
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=bvt.VentasTotales
	from BON_Resultados as res 
	inner join BON_Liquidacion_Ventas as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	inner join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5)
		begin
			
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
		/*	and CodOficina not in 
			(select OficCodigo from BON_Asesores 
				where 
				OficNombre like '%canal Especializado%'
				or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
				group by OficCodigo)-- Excluye asesores de Canal Especializado*/
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from BON_Resultados as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales
		 select OficCodigo, MAX(rn) as CantidadAsesores from(
			select ase.OficCodigo,ase.VendCodigo, ast.DiasLaborados, ast.Cedula
				,ROW_NUMBER() over (PARTITION by ase.OficCodigo  order by ase.OficCodigo desc) as 'rn'	 from  BON_Resultados as res
				inner join BON_Asesores as ase on (ase.VendCodigo=res.codVend)
				left join BON_AsistenciaTotal as ast on( ase.VendIdeNro=ast.Cedula)
				group by VendCodigo,OficCodigo,DiasLaborados,ast.Cedula
				
				) as T1
			group by OficCodigo

			

	update res
	set res.AsesoresXoficina=bvt.VentasTotales
	 from BON_Resultados as res 
	 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	 delete BON_VentasTotales
		insert BON_VentasTotales
					select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as res
				) as T1 
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as vde
				where vde.TotalVentasValidasXasesor=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and TotalCumplimientoPresupuestoXoficina>=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
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
	 end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)	
		where VentaValida=1 
		and CodTipoVenta=4 
		and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=18)
	/*	and CodOficina not in 
			(select OficCodigo from BON_Asesores 
				where 
				OficNombre like '%canal Especializado%'
				or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
				group by OficCodigo)-- Excluye asesores de Canal Especializado*/
		group by CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
		inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
		where VentaValida=1 and CodTipoVenta!=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=18)
		group by CodOficina
		
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

	--Valida el porcentaje de Participacion en Ceremonia
	delete from BON_PorcentajeSinCeremonia
	insert BON_PorcentajeSinCeremonia
	select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia from BON_Liquidacion_Ventas where CodOficina in (select Codigo from BON_VentasTotales)
	 group by CodOficina

	end 
	
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
		/*	and CodOficina not in 
			(select OficCodigo from BON_Asesores 
				where 
				OficNombre like '%canal Especializado%'
				or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
				group by OficCodigo)-- Excluye asesores de Canal Especializado*/
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from BON_Resultados as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  RegiCodigo,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
			inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)	
			where VentaValida=1 
			and CodTipoVenta=4 
			and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)
			/*	and CodOficina not in 
				(select OficCodigo from BON_Asesores 
					where 
					OficNombre like '%canal Especializado%'
					or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
					group by OficCodigo)-- Excluye asesores de Canal Especializado*/
			group by RegiCodigo
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
			inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)
			where VentaValida=1 and CodTipoVenta!=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)
			group by CodZona
		
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

		update res set res.TotalCumplimientoPresupuestoXzona=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona
			
				delete from BON_VentasTotales
				insert into BON_VentasTotales
				 select RegiCodigo, MAX(rn) as CantidadAsesores from(
					select ase.RegiCodigo,ase.VendCodigo, ast.DiasLaborados, ast.Cedula
						,ROW_NUMBER() over (PARTITION by ase.RegiCodigo  order by ase.RegiCodigo desc) as 'rn'	 from  BON_Resultados as res
						inner join BON_Asesores as ase on (ase.VendCodigo=res.codVend)
						left join BON_AsistenciaTotal as ast on( ase.VendIdeNro=ast.Cedula)
						group by VendCodigo,ase.RegiCodigo,DiasLaborados,ast.Cedula
						
						) as T1
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
						) as T1 
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_Resultados as vde
						where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and TotalCumplimientoPresupuestoXzona>=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

				---Retorna las oficinas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codOficina,PorcentajeAsesoresConNventasValidasZona from BON_Resultados
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
  ----Valida el porcentaje de Participacion en Ceremonia
				  delete from BON_PorcentajeSinCeremonia
				  insert BON_PorcentajeSinCeremonia
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  where CodZona in (select Codigo from BON_VentasTotales)
				  group by CodZona	

				  end
				  
			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  RegiCodigo,Sum(ventaValida) as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
					inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)	
					where VentaValida=1 
					and CodTipoVenta=4 
					and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)-- Sin Descontar Ausentismos, Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=(select FechaInicialReto from BON_Retos as ret where  ret.IdBonificacion=@idBonificacion)
					and liv.FechaPago<=(select FechaFinalReto  from BON_Retos as ret where  ret.IdBonificacion=@idBonificacion)-- Valida el corte de fecha del # reto
					and liv.CodZona=(Select CodZona from BON_Retos as ret where ret.IdBonificacion=@idBonificacion)
					/*	and CodOficina not in 
						(select OficCodigo from BON_Asesores 
							where 
							OficNombre like '%canal Especializado%'
							or  OficNombre like '%Premium%' or OficNombre like '%Empresario Movil%'
							group by OficCodigo)-- Excluye asesores de Canal Especializado*/
					group by RegiCodigo
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					Select RegiCodigo,Sum(ventaValida) as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Asesores as ase on (liv.CodVendedor=ase.VendCodigo)
					inner join BON_AsistenciaTotal as ast on (ast.Cedula=ase.VendIdeNro)-- Sin Descontar Ausentismos, Garantiza que la el asesor lleve mas de 1 mes
					where VentaValida=1 and CodTipoVenta!=4 and ast.DiasLaborados>=(Select Valor from BON_Parametros where id=29)
					and liv.FechaPago>=(select FechaInicialReto from BON_Retos as ret where  ret.IdBonificacion=@idBonificacion)
					and liv.FechaPago<=(select FechaFinalReto  from BON_Retos as ret where  ret.IdBonificacion=@idBonificacion)-- Valida el corte de fecha del # reto
					and liv.CodZona=(Select CodZona from BON_Retos as ret where ret.IdBonificacion=@idBonificacion)
					group by RegiCodigo
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as res
					where res.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  res.CodigoZona
						 ,case
						 when   res.VentasValidasUsadosAlcanzadas>
						 res.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100  then 	 
						 CEILING(res.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else res.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as res
						 where res.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
/*
	declare
	@idBonificacion int=20,
	@idPlanBonificacion int=8			
	*/
				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join BON_Resultados as res on (res.codZona=ret.CodigoZona)
					where IdBonificacion=@idBonificacion
					and TotalVentasAprobadasAlcanzadas>=(Select RetoEnVentas from BON_Retos where IdBonificacion=@idBonificacion) -- Reto a Cumplir
					and res.TotalCumplimientoPresupuestoXzona>=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
					


				  ----Valida el porcentaje de Participacion en Ceremonia
				  delete from BON_PorcentajeSinCeremonia
				  insert BON_PorcentajeSinCeremonia
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  where CodZona in (select CodigoZona from BON_Retos where IdBonificacion=@idBonificacion)
				  group by CodZona		
				
			  end	 
			
	end 

	
return @@rowcount

END
