USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 24/02/2020 10:08:14 a. m. ******/
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
             WHERE CONTRATO IN (SELECT E.[Param1] AS Contrato FROM [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.[dbo].[CallDetailHist] A
             inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.[dbo].[MediaDataDetailHist]  E on A.SeqNum =E.SeqNum AND  A.CallId = E.CallId
             inner join  [' + @Servidorconfig_epro +'].'+ @BaseDatosconfig_epro + '.[dbo].[Disposition] F on E.AgentDispId =F.Disp_Id
             where 
			 --A.Service_Id IN (60,117) and -- Comentariado ya que no se requiere este filtro
			 F.Disp_Id in (374,384) and E.[Param1] <> '''')'
			 --374 Llamada Efectiva_C
			 --384 Efectiva con Novedad_C
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

	SET @query='UPDATE [BON_Liquidacion_Ventas] SET AsistenciaDesEquiDir = 1
             WHERE  codvendedor in(select VendCodigo from BON_Asesores as ase
			 inner join BON_Liquidacion_Ventas  as liv on (liv.CodVendedor=ase.VendCodigo)
			 inner join BON_AsistenciaTotal as ast on (ase.vendidenro=ast.cedula)
			 left join bon_ausentismos as aus on (ast.cedula=aus.cedula)
			 where ast.diaslaborados-isnull(aus.ausentismos,''0'')>=(select valor from BON_Parametros where Id=18)
			 ) 

			 UPDATE [BON_Liquidacion_Ventas] SET AsistenciaDesEquiGer = 1
             WHERE  codvendedor in(select VendCodigo from BON_Asesores as ase
			 inner join BON_Liquidacion_Ventas  as liv on (liv.CodVendedor=ase.VendCodigo)
			 inner join BON_AsistenciaTotal as ast on (ase.vendidenro=ast.cedula)
			 left join bon_ausentismos as aus on (ast.cedula=aus.cedula)
			 where ast.diaslaborados-isnull(aus.ausentismos,''0'')>=(select valor from BON_Parametros where Id=29)
			 )'

		END


	ELSE IF @IdTabla= '21' --Valida La permanencia

		BEGIN
			declare @fechaInicialLiquidacion datetime;
			declare @fechaFinalLiquidacion datetime;
			select @fechaInicialLiquidacion=valor from BON_Parametros where Id=6
			select @fechaFinalLiquidacion=valor from BON_Parametros where Id=7
			set @fechaInicialLiquidacion=dateadd(M,1,@fechaInicialLiquidacion)
			set @fechaFinalLiquidacion=dateadd(M,1,@fechaFinalLiquidacion)

						SET @query='UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
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

