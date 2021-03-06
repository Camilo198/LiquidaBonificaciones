USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 22/05/2020 7:27:48 a. m. ******/
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
  			SET @query = '
			UPDATE [BON_PamVentasOutsorsing] SET NoExclucion =1 where MarcaExcl!=''EXCL''
		UPDATE [BON_PamVentasOutsorsing] SET VentaInscripcion = 1 where PorcentajeInscripcion >= cast((select valor from BON_Parametros where Id=20) as numeric (18,10))
			UPDATE [BON_Liquidacion_Ventas] SET Venta = 1 where Inscripcion >= cast((select valor from BON_Parametros where Id=20) as numeric (18,10))'
  		END

  ELSE IF @IdTabla = '2' --Valida Llamada de Bienvenida
  		BEGIN			

            declare @ServidorChevyPlanApp varchar(100)
            declare @BaseDatosChevyplanApp varchar(100)
            select @ServidorChevyPlanApp = Servidor, @BaseDatosChevyplanApp= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=6 --ChevyplanApp pasas a 6 y la tabla callDetailHist
            
            declare @ServidorApplication_epro varchar(100)
            declare @BaseDatosApplication_epro varchar(100)
            select @ServidorApplication_epro = Servidor, @BaseDatosApplication_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --Application_epro
  			print @basedatosApplication_epro
			SET @query = 
			--Identifica que el contrato se encuentre en unified
			
			

			--Identifica las llamadas que cumplen la tipificacion
			'UPDATE [BON_PamVentasOutsorsing] SET LlamadaBV = 1
             WHERE Contrato IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from BON_Parametros as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from BON_PamVentasOutsorsing as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' OR t1.Motivo = ''EFECTIVA YA GESTIONADA''	
				union
				SELECT distinct CONTRATO from [' + @ServidorApplication_epro +'].'+ @BaseDatosApplication_epro + '.[dbo].[A_BASE_GENERAL_2018]
 where contrato COLLATE Modern_Spanish_CI_AS in(select liv.Contrato from BON_PamVentasOutsorsing as liv) and Disp1_Id in (374,384)	
and Call1_dt>=(Select Valor from BON_Parametros as par where par.Id=6)
and Call1_dt<=GETDATE()
union
select contrato COLLATE Modern_Spanish_CI_AS from BON_PamVentasOutsorsing where Contrato>=(select valor from BON_Parametros where Id=31) --Identifica las ventas telefonicas
			and Contrato<=(select valor from BON_Parametros where Id=32)
			 )
			  UPDATE [BON_PamVentasOutsorsing] SET LlamadaBV = 1
             WHERE CONTRATO IN (
			select ContratoTelefonico from BON_ContratoTelefonico 
			)

			UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from BON_Parametros as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from bon_liquidacion_ventas as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' OR t1.Motivo = ''EFECTIVA YA GESTIONADA''	
				union
				SELECT distinct CONTRATO from [' + @ServidorApplication_epro +'].'+ @BaseDatosApplication_epro + '.[dbo].[A_BASE_GENERAL_2018]
 where contrato COLLATE Modern_Spanish_CI_AS in(select liv.Contrato from bon_liquidacion_ventas as liv) and Disp1_Id in (374,384)	
and Call1_dt>=(Select Valor from BON_Parametros as par where par.Id=6)
and Call1_dt<=GETDATE()
union
select contrato COLLATE Modern_Spanish_CI_AS from BON_Liquidacion_Ventas where Contrato>=(select valor from BON_Parametros where Id=31) --Identifica las ventas telefonicas
			and Contrato<=(select valor from BON_Parametros where Id=32)
			 )
			 UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (
			select ContratoTelefonico from BON_ContratoTelefonico 
			)
			
		select LlamadaBV from [BON_Liquidacion_Ventas] where LlamadaBV = 1'
		


  		END

  ELSE IF @IdTabla = '3' --Valida Ceremonia de Sueños
  		BEGIN		
            --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=10	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
  			SET @query = '
			UPDATE [BON_PamVentasOutsorsing] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT cast(Contrato as numeric(18,0)) FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')
			
			UPDATE [BON_Liquidacion_Ventas] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT cast(Contrato as numeric(18,0)) FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

  		END

  ELSE IF @IdTabla = '4' --Valida Estado en SICO 
  		BEGIN		

		    declare @ServidorSICO varchar(100)
            declare @BaseDatosSICO varchar(100)
            select @ServidorSICO = Servidor, @BaseDatosSICO= BaseDatos from SCO_ServidoresBasesDatos where IDServidoresBasesDatos=1	--SICODIARIOBD

			set @query=' exec [' + @ServidorSICO +'].'+ @BaseDatosSICO + '.[DBO].BON_EstadoSICO'

		UPDATE  pam SET pam.EstadoSICO = 1 from BON_PamVentasOutsorsing as pam
		where pam.EstadoCupo not in ('T','Z')
	
  		END

  ELSE IF @IdTabla = '5' --Valida Perfeccionamiento
  		BEGIN			
  --Perfeccionamiento
	SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Prospecto = 1
			WHERE CONTRATO IN (
			 select Contrato from BON_CierreCRM where
			 Periodo=(select valor from BON_Parametros where id=9) 
			 and Ano=(select valor from BON_Parametros where id=10)
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

