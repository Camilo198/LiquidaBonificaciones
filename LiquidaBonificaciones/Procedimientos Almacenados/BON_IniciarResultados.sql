USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados]    Script Date: 19/05/2020 6:31:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_IniciarResultados] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Exec BON_IniciarResultadosComisiones
-- Directores Retirados en el mes
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
--0
from BON_Liquidacion_Ventas as liv
inner join BON_Asesores as ase on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=ase.VendFecRet
and ase.VendFecRet>=(select valor from BON_Parametros where id=6)
and ase.VendFecRet<=(select valor from BON_Parametros where id=7)
and ase.VendFecIng<=(select valor from BON_Parametros where id=6)

-- Directores que entraron y se retiraron en el mismo mes
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecIng>=(select valor from BON_Parametros where id=6)
and ase.VendFecIng<=(select valor from BON_Parametros where id=7)
and ase.VendFecRet>=(select valor from BON_Parametros where id=6)
and ase.VendFecRet<=(select valor from BON_Parametros where id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=ase.VendFecRet

-- Directores  Activos que se retiraron despues del periodo de la liquidacion
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecRet=dateadd(M,1,(select valor from BON_Parametros where Id=7))
and ase.VendFecIng<= (select valor from BON_Parametros where Id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=(select valor from BON_Parametros where Id=7)

-- Directores que Activos para comisiones
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecRet='1929-01-01 00:00:00.000'
and ase.VendFecIng<= (select valor from BON_Parametros where Id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=dateadd(d,1,(select valor from BON_Parametros where Id=7))

	--- limpia los calculos de una liquidacion previa.
	delete from BON_LiquidacionBonificaciones
	delete from BON_LiquidacionBonificacionesGrupales
	--- Limpia Tabla de Resultados
	delete from BON_Resultados
	insert into BON_Resultados
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
    ,0 as TotalVentasVAlidas 
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as TotalPorcentajeCumplimiento
	,0 as AsistenciaTotal
	,0 as AsistenciaDesDirector
	,0 as AsistenciaDesGerente
	,0 as Ausentismos
	,0 as AsesoresXoficina
	,0 as PorcentajeAsesoresCalculo
	,0 as PorcentajeAsesoresConNVentasValidasXOficina
	,0 as PorcentajeAsesoresConNVentasValidasXoficinaCE
	,0 as TotalVentasRegistradasXoficina
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
	,0 as VentasMaximasSinCeremoniaXoficina
	,0 as VentasRegistradasSinCeremoniaXoficina
	,0 as PermanenciaTotalOficina
	,0 as PermanenciaDiferidaOficina
	,0 as PermanenciaDirector
	,0 as TotalVentasUsadosXzona
	,0 as TotalVentasNuevosXzona
	,0 as TotalVentasXzona
	,0 as TotalVentasAprobadasXzona
	,0 as TotalCumplimientoPresupuestoXzona
	,0 as AsesoresXzona
	,0 as PorcentajeBaseAsesoresCalculoXzona
	,0 as PorcentajeAsesoresConNventasValidasZona
	,0 as TotalVentasRegistradasXoficina
	,0 as PorcentajeSinCeremoniaXZona
	,0 as VentasMaximasSinCeremoniaXzona
	,0 as VentasRegistradasSinCeremoniaXzona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from BON_Liquidacion_Ventas 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_Liquidacion_Ventas group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacion datetime;
			declare @fechaFinalLiquidacion datetime;
			select @fechaInicialLiquidacion=valor from BON_Parametros where Id=6
			select @fechaFinalLiquidacion=valor from BON_Parametros where Id=7
			set @fechaInicialLiquidacion=dateadd(M,1,@fechaInicialLiquidacion)
			set @fechaFinalLiquidacion=dateadd(M,1,@fechaFinalLiquidacion)

			--Caso especial si no lo encuentra pero esta activo
						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)
									and CodVendedor not in
									(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),dateadd(M,-1,@fechaInicialLiquidacion))as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),dateadd(M,-1,@fechaFinalLiquidacion)) as datetime)
									)
									and CodVendedor not in (
									select ase.VendCodigo from BON_Asesores as ase
									where VendFecRet>=(select valor from BON_Parametros where Id=6)
									and VendFecRet<=GETDATE()
									)

						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and insdCumPerTotal>=(select valor from BON_Parametros where Id=23)
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)
--Para diferida en 0 se asume que es del 100 % por default
									UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and InsdTotCliPerTotal=0
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)


	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_Resultados as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_Resultados as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

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

--Calcula las ventas Registrada por oficina

  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodOficina, count (*) as ventasRegistradas
			from BON_Liquidacion_Ventas 
			group by CodOficina

  	update res set res.TotalVentasRegistradasXoficina=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)


			--Calcula las ventas Registrada por Zona

  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, count (*) as ventasRegistradas
			from BON_Liquidacion_Ventas 
			group by CodZona

  	update res set res.TotalVentasRegistradasXZona=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	--- Ingresa la cantidad de ventas sin ceremonia Maxima x oficina
	delete from BON_VentasTotales
	insert BON_VentasTotales
	select distinct codOficina,round(TotalVentasRegistradasXoficina*(select valor from BON_Parametros where Id=27)/100,0)
	from BON_Resultados
	update res set res.VentasMaximasSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

		--- Ingresa la cantidad de ventas sin ceremonia Maxima x Zona
	delete from BON_VentasTotales
	insert BON_VentasTotales
	select distinct codZona,round(TotalVentasRegistradasXZona*(select valor from BON_Parametros where Id=27)/100,0)
	from BON_Resultados
	update res set res.VentasMaximasSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
	--Calcula el total de ventas sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric)) as totalSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodZona	
	update res set res.VentasRegistradasSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el total de ventas sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric)) as totalSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodOficina
	update res set res.VentasRegistradasSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


	--Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


	------------------------Base Clientes al Dia-- Se Calcula de la permanencia Total Al dia.
	delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric)) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.TotalParticipantesCeremoniaXoficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

------


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	round(SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100,0) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	round(SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100,0) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, round(SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100,0) as resultado
    from [SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			round(SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100,0) as resultado
     		FROM [SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)





	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from BON_Parametros where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from BON_Parametros where Id=23)
				or PermanenciaTotalOficina>=(select valor from BON_Parametros where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from BON_Parametros where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from BON_Parametros where Id=23)
				or PermanenciaTotalZona>=(select valor from BON_Parametros where Id=24)	
				

			 UPDATE [BON_Resultados] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from BON_Parametros where Id=29)
	

			 UPDATE [BON_Resultados] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from BON_Parametros where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from BON_Liquidacion_Ventas as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from BON_Liquidacion_Ventas)
	and ret.Ano=(select top 1 AñoLiquidacion from BON_Liquidacion_Ventas)
	/*--- Asigna las Ventas pagadas antes del mes del primer rero por defecto al reto 1
	  update liv set liv.NumeroReto=1 from BON_Liquidacion_Ventas as liv
	where FechaPago< (select top 1 FechaInicialReto from BON_Retos where NumeroReto=1)
	*/
END
