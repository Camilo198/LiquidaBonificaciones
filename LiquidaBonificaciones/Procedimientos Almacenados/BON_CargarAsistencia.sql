USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CargarAsistencia]    Script Date: 14/02/2020 1:04:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CargarAsistencia]
	-- Add the parameters for the stored procedure here
	@fechaInicio datetime,
@fechaFin datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
declare 
@servidorKactus varchar(50),
@BaseKactus varchar(50),
@codNomina varchar (10)=2,
@Query as varchar (max)
--- el 2 es la nomina comercial

select @servidorKactus=Servidor,@BaseKactus=BaseDatos from SCO_ServidoresBasesDatos as sb where sb.IDServidoresBasesDatos=8 
-- Carga los ausentismos
set @Query= 
'
delete from BON_Ausentismos
insert into BON_Ausentismos
select 
	cod_empl
	,SUM([diasMesEnCurso]) as sumaAusentismos
	from(
		select cod_empl,fecDesde,fecHasta,can_ause
		,Convert(int,format(CAST(fecHasta AS DATETIME)-CAST(fecDesde AS DATETIME),''dd'')) 	as ''diasMesEnCurso''

			from
			(select cod_empl
				,case when CAST(fec_desd AS DATE)<CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE) and CAST(fec_hast AS DATE)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE)  
				then CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE) else CAST(fec_desd AS DATE)  end as ''fecDesde''	
				,fec_desd
				,fec_hast
				,case when fec_desd>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE) and CAST(fec_hast AS DATE)>CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE)  
				then CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) else CAST(fec_hast AS DATE)  end as ''fecHasta''
				,can_ause
				,obs_erva
				from['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_ausen 
					where cod_empl 
						in(select cod_empl from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr where cod_tnom='+Convert(varchar(10),@codNomina)+' ) -- trae todos los empleados de nomina activos e inactivos
						and CAST(fec_desd AS DATE)>=dateadd(MM,-1,CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE)) and CAST(fec_hast AS DATE)<=dateadd(MM,+1,CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE)) -- filtra ausentimos de un mes antes y uno despues
						and CAST('''+Convert(varchar(20),@fechaFin)+'''as date)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''as date)-- valida que el rango de fechas este correcto
							) as t1 where  CAST(fecDesde AS DATE)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE) and CAST(fecDesde AS DATE)<=CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) and CAST(fecHasta AS DATE)<=CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) -- Delimita solo los del mes de la liquidacion
						) as t2
						group by cod_empl'
						
						exec (@query)

-- Calcula la asistencia de todos los contratos Activos
set @Query= 

'
delete from BON_AsistenciaParcial
insert into BON_AsistenciaParcial
select  
cod_empl,
case when CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATETIME)-CAST(fec_ingr AS DATETIME)>30 then 30 else Convert(int,format(CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATETIME)-CAST(fec_ingr AS DATETIME),''dd'')) END as ''diasLaborados''
,''Contratado'' as Estado
 from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr where ind_acti in (''A'') and cod_tnom='+Convert(varchar(10),@codNomina) -- trae todos los empleados de nomina activos e inactivos
 +'and fec_ingr<=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE)-- descarta los contratados posterior a la liquidacion
 and CAST('''+Convert(varchar(20),@fechaFin)+'''as date)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''as date)'-- valida que el rango de fechas este correcto
 exec(@query)

 -- Calcula la asistencia de todos los contratos Inactivos
 set @Query= '
 insert into BON_AsistenciaParcial
select  
cod_empl,
convert(int,format(cast(fec_deja as datetime)-CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATETIME),''dd'')) as ''diasLaborados''
,''Retirado'' as Estado
 from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr where ind_acti not in (''A'') and cod_tnom='+Convert(varchar(10),@codNomina) -- trae todos los empleados de nomina activos e inactivos
 +'and fec_deja>=CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
  and fec_deja<=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE)
 '
 exec (@Query)

 -- Calcula la diferencia entre los dias asistidos de todos los contratos en el mes, menos los ausentismos acumulados

 set @Query=
 '
 delete from BON_AsistenciaTotal
 insert into BON_AsistenciaTotal
select cedula, case when  SUM(diasContratado)>30 then 30 else SUM(diasContratado) end  from bon_asistenciaParcial group by cedula'


exec (@Query)
return @@rowcount
END
