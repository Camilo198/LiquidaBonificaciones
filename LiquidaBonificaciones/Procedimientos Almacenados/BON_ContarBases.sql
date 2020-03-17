USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 12/03/2020 4:07:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BON_ContarBases] 
@IdTabla varchar(2),
@Ceremonia varchar(20)
	
AS					

BEGIN

  declare @query as varchar (max)	
  
  
  IF @IdTabla = '1' --Valida Ventas Mayores al valor minimo de inscripcion
  		BEGIN			
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Venta = 1 where Inscripcion >= (select valor from BON_Parametros where Id=20)'
  		END

  ELSE IF @IdTabla = '2' --Valida Llamada de Bienvenida
  		BEGIN			

            declare @ServidorChevyPlanApp varchar(100)
            declare @BaseDatosChevyplanApp varchar(100)
            select @ServidorChevyPlanApp = Servidor, @BaseDatosChevyplanApp= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=6 --ChevyplanApp pasas a 6 y la tabla callDetailHist
            
            declare @Servidorconfig_epro varchar(100)
            declare @BaseDatosconfig_epro varchar(100)
            select @Servidorconfig_epro = Servidor, @BaseDatosconfig_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --config_epro
  			SET @query = 
			--Identifica que el contrato se encuentre en unified


			--Identifica las llamadas que cumplen la tipificacion
			'UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from BON_Parametros as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from bon_liquidacion_ventas as liv)
				) as t1
				where  t1.Motivo like ''%EFECTIVA CON NOVEDAD%'' OR t1.Motivo LIKE ''%LLAMADA EFECTIVA%'' 		

			 )'
			select * from BON_Liquidacion_Ventas where LlamadaBV=1



  		END

  ELSE IF @IdTabla = '3' --Valida Ceremonia de Sueños
  		BEGIN		
            --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=2	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT Contrato FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

  		END

  ELSE IF @IdTabla = '4' --Valida Estado en SICO 
  		BEGIN		

		    declare @ServidorSICO varchar(100)
            declare @BaseDatosSICO varchar(100)
            select @ServidorSICO = Servidor, @BaseDatosSICO= BaseDatos from SCO_ServidoresBasesDatos where IDServidoresBasesDatos=9	--SICODIARIOBD

			set @query=' exec [' + @ServidorSICO +'].'+ @BaseDatosSICO + '.[DBO].BON_EstadoSICO'
  		END

  ELSE IF @IdTabla = '5' --Valida Perfeccionamiento
  		BEGIN			
  --Perfeccionamiento
    declare @ServidorPerfeccionamiento varchar(100)
    declare @BaseDatosPerfeccionamiento varchar(100)
    select @ServidorPerfeccionamiento = Servidor, @BaseDatosPerfeccionamiento = BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=4 --CRMProspectos
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Prospecto = 1
             WHERE CONTRATO IN (SELECT ID FROM [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[ch_contratosleads] where 
             ventaperfeccionada = 1)'
  		END

 ELSE IF @IdTabla = '12' --Valida valor de  Planes para Vehiculos Usados y Nuevos
   		BEGIN	
  			SET @query = '
			---Usados
			UPDATE [BON_Liquidacion_Ventas] SET ValidaPlan = 1
             WHERE codplan=4  and ValorPlan>=(select valor from BON_Parametros where Id=14)
			 ---Nuevos
			 UPDATE [BON_Liquidacion_Ventas] SET ValidaPlan = 1
             WHERE codplan!=4  and ValorPlan>=(select valor from BON_Parametros where Id=15)
			 '
  		END


 ELSE IF @IdTabla= '19' --Valida Asistencia en Kactus Asesores para  desarrollo de equipos Director y Gerente
	
	BEGIN

	SET @query='
	 ---Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like ''%canal Especializado%''
			or  ase.OficNombre like ''%Premium%'' or ase.OficNombre like ''%Empresario Movil%''

			select * from BON_AsistenciaTotal
			 
			
   '

		END


	ELSE IF @IdTabla= '21' --Valida La permanencia

		BEGIN
			declare @fechaInicialLiquidacion datetime;
			declare @fechaFinalLiquidacion datetime;
			select @fechaInicialLiquidacion=valor from BON_Parametros where Id=6
			select @fechaFinalLiquidacion=valor from BON_Parametros where Id=7
			set @fechaInicialLiquidacion=dateadd(M,1,@fechaInicialLiquidacion)
			set @fechaFinalLiquidacion=dateadd(M,1,@fechaFinalLiquidacion)

						SET @query='
						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast('''+Convert(Varchar(50),@fechaInicialLiquidacion)+'''as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast('''+Convert(Varchar(50),@fechaFinalLiquidacion)+''' as datetime)
									)

						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and insdCumPerTotal>=(select valor from BON_Parametros where Id=23)
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast('''+Convert(Varchar(50),@fechaInicialLiquidacion)+'''as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast('''+Convert(Varchar(50),@fechaFinalLiquidacion)+''' as datetime)
									)
										'
			END
  	
	
	EXEC (@query)


--	select (@query)
  RETURN @@RowCount			
END

