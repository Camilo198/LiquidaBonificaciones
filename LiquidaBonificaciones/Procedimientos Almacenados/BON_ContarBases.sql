USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 14/02/2020 1:10:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ContarBases] 
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

            --Llamadas de Bienvenida
            declare @Servidordetail_epro varchar(100)
            declare @BaseDatosdetail_epro varchar(100)
            select @Servidordetail_epro = Servidor, @BaseDatosdetail_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=5 --detail_epro
            
            declare @Servidorconfig_epro varchar(100)
            declare @BaseDatosconfig_epro varchar(100)
            select @Servidorconfig_epro = Servidor, @BaseDatosconfig_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --config_epro

  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (SELECT E.[Param1] AS Contrato FROM [' + @Servidordetail_epro +'].'+ @BaseDatosdetail_epro + '.[dbo].[CallDetail] A
             inner join [' + @Servidordetail_epro +'].'+ @BaseDatosdetail_epro + '.[dbo].[MediaDataDetail]  E on A.SeqNum =E.SeqNum AND  A.CallId = E.CallId
             inner join  [' + @Servidorconfig_epro +'].'+ @BaseDatosconfig_epro + '.[dbo].[Disposition] F on E.AgentDispId =F.Disp_Id
             where 
			 --A.Service_Id IN (60,117) and -- Comentariado ya que no se requiere este filtro
			 F.Disp_Id in (374) and E.[Param1] <> '''')'
  		END

  ELSE IF @IdTabla = '3' --Valida Ceremonia de Sueños
  		BEGIN		
            --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=2	
					
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT Contrato FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where Cod_Asamblea LIKE '''+@Ceremonia+'%'' AND Estado = ''P'')'
  		END

  ELSE IF @IdTabla = '4' --Valida Estado en SICO 
  		BEGIN		

		    declare @ServidorSICO varchar(100)
            declare @BaseDatosSICO varchar(100)
            select @ServidorSICO = Servidor, @BaseDatosSICO= BaseDatos from SCO_ServidoresBasesDatos where IDServidoresBasesDatos=9	

			set @query=' exec [' + @ServidorSICO +'].'+ @BaseDatosSICO + '.[DBO].BON_EstadoSICO'
  		END

  ELSE IF @IdTabla = '5' --Valida Perfeccionamiento
  		BEGIN			
  --Perfeccionamiento
    declare @ServidorPerfeccionamiento varchar(100)
    declare @BaseDatosPerfeccionamiento varchar(100)
    select @ServidorPerfeccionamiento = Servidor, @BaseDatosPerfeccionamiento = BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=4
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


 ELSE IF @IdTabla= '19' --Valida Asistencia en Kactus
	
	BEGIN

	SET @query='UPDATE [BON_Liquidacion_Ventas] SET Asistencia = 1
             WHERE  codvendedor in(select VendCodigo from BON_Asesores as ase
			 inner join BON_Liquidacion_Ventas  as liv on (liv.CodVendedor=ase.VendCodigo)
			 inner join BON_AsistenciaTotal as ast on (ase.vendidenro=ast.cedula)
			 left join bon_ausentismos as aus on (ast.cedula=aus.cedula)
			 where ast.diaslaborados-isnull(aus.ausentismos,''0'')>=(select valor from BON_Parametros where Id=18)
			 ) '

		END


	ELSE IF @IdTabla= '21' --Valida La permanencia

		BEGIN
			declare @fechaActualizacionPersistencia  datetime;
			select  top (1)@fechaActualizacionPersistencia=fecActualiza from SCO_CumplimientoPersistencia_hist 
			where fecActualiza>=(select valor from BON_Parametros where Id=6) 
			and fecActualiza<=(select valor from BON_Parametros where Id=7)
			print (@fechaActualizacionPersistencia)
				if @fechaActualizacionPersistencia is not  null
					begin	
						SET @query='UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from SCO_CumplimientoPersistencia_hist 
									where CumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and insdCumPerTotal>=(select valor from BON_Parametros where Id=23)
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24))'
					end
			END
  	
	
	EXEC (@query)


--	select (@query)
  RETURN @@RowCount			
END

