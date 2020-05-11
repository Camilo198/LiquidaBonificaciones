USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 30/04/2020 11:08:06 a. m. ******/
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
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' OR t1.Motivo = ''EFECTIVA YA GESTIONADA''		

			 )'
		


  		END

  ELSE IF @IdTabla = '3' --Valida Ceremonia de Sueños
  		BEGIN		
            --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=10	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT cast(Contrato as numeric(18,0)) FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

  		END

  ELSE IF @IdTabla = '4' --Valida Estado en SICO 
  		BEGIN		

		    declare @ServidorSICO varchar(100)
            declare @BaseDatosSICO varchar(100)
            select @ServidorSICO = Servidor, @BaseDatosSICO= BaseDatos from SCO_ServidoresBasesDatos where IDServidoresBasesDatos=1	--SICODIARIOBD

			set @query=' exec [' + @ServidorSICO +'].'+ @BaseDatosSICO + '.[DBO].BON_EstadoSICO'
  		END

  ELSE IF @IdTabla = '5' --Valida Perfeccionamiento
  		BEGIN			
  --Perfeccionamiento
    declare @ServidorPerfeccionamiento varchar(100)
    declare @BaseDatosPerfeccionamiento varchar(100)
    select @ServidorPerfeccionamiento = Servidor, @BaseDatosPerfeccionamiento = BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=4 --CRMProspectos
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Prospecto = 1
			WHERE CONTRATO IN (SELECT chc.ID FROM [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[ch_contratosleads] as chc 
			 left join [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[documents] as doc on (chc.id=doc.document_name)
			 where 
             ventaperfeccionada = 1			  
			 and doc.deleted = 0
			 )'

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

			 select * from bon_liquidacion_Ventas where validaPlan=1
			 '
  		END


  	
	
	EXEC (@query)


--	select (@query)
  RETURN @@RowCount			
END

