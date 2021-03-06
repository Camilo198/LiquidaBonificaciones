USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados_RecuPerma]    Script Date: 31/03/2020 5:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_IniciarResultados_RecuPerma] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


		declare @periodoAnterior varchar (2)
	declare @periodoActual varchar (2)
	declare @Ano varchar (4)
	select @periodoActual=valor from [BON_Parametros] where Id=9


	if (@periodoActual=01)
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	Set @Ano=@Ano-1	
	set @periodoAnterior=12
	print @periodoAnterior
	print @Ano
	end
	else
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	select @periodoAnterior=@periodoActual-1
	print @periodoAnterior
	print @Ano
	end

	--- Indica los parametros a tener en cuenta para esta liquidacion
	delete from [BON_Parametros-1]
	insert into [BON_Parametros-1]
	select * from BON_Parametros_Historico where Periodo=@periodoAnterior and Ano=@Ano

	---- Trar la liquidacion previa asocida al historico
	delete from BON_Liquidacion_Ventas_Recu
	insert into BON_Liquidacion_Ventas_Recu
	select * from BON_Liquidacion_Ventas_Hist
	where CAST(MesLiquidacion as  int)=@periodoAnterior
	and CAST(AñoLiquidacion as int)=@Ano

	
	---Trae las bonificaciones asosiadas a este periodo.

	delete   from  BON_BonificacionEspecial_Recu
	insert into BON_BonificacionEspecial_Recu
	select *  from [BON_BonificacionEspecial_Hist]
	where Mes=@periodoAnterior
	and Ano=@Ano
		
	--- Limpia Tabla de Resultados
	delete from BON_Resultados_Recu
	insert into BON_Resultados_Recu
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
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalPlanesComisinesXoficina
	,0 as TotalComisinesValidasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
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
	,0 as PorcentajeSinCeremoniaXZona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from BON_Liquidacion_Ventas_Recu 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_Liquidacion_Ventas_Recu group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from BON_Liquidacion_Ventas_Recu as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacionPerma datetime;
			declare @fechaFinalLiquidacionPerma datetime;
			select @fechaInicialLiquidacionPerma=valor from [BON_Parametros-1] where Id=6
			select @fechaFinalLiquidacionPerma=valor from [BON_Parametros-1] where Id=7
			set @fechaInicialLiquidacionPerma=dateadd(M,2,@fechaInicialLiquidacionPerma) --- +2 meses ya que es la permanencia actual
			set @fechaFinalLiquidacionPerma=dateadd(M,2,@fechaFinalLiquidacionPerma)

				
						UPDATE [BON_Liquidacion_Ventas_Recu] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

						UPDATE [BON_Liquidacion_Ventas_Recu] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=22) 
									and insdCumPerTotal>=(select valor from [BON_Parametros-1] where Id=23)
									or finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

---Calcula la Asistencia del mes Anterior
declare @fechaInicioActual datetime,
@fechaFinActual datetime

Select @fechaInicioActual= valor from [BON_Parametros-1] where Id=6
Select @fechaFinActual= valor from [BON_Parametros-1] where Id=7


 Exec BON_CargarAsistencia @fechaInicioActual, @fechaFinActual

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_Resultados_Recu as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_Resultados_Recu as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

	 	 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas_Recu)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas_Recu)
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

	--Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas_Recu 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas_Recu 
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 as resultado
    from [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 as resultado
     		FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)


	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados_Recu] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados_Recu] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=24)	
				

			 UPDATE [BON_Resultados_Recu] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=29)
	

			 UPDATE [BON_Resultados_Recu] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from BON_Liquidacion_Ventas_Recu as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from BON_Liquidacion_Ventas_Recu)
	and ret.Ano=(select top 1 AñoLiquidacion from BON_Liquidacion_Ventas_Recu)
	

END
