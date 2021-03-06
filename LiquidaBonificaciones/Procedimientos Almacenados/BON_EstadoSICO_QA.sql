USE [SICODIARIOBD]
GO
/****** Object:  StoredProcedure [dbo].[BON_EstadoSICO_QA]    Script Date: 18/05/2020 9:18:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[BON_EstadoSICO_QA]
as
DECLARE @query as varchar (max)	
declare @Servidor varchar(100)
declare @BaseDatos varchar(100)

select @Servidor = Servidor, @BaseDatos= BaseDatos from [dbo].[ServidoresBasesDatos] where IDServidoresBasesDatos=3
begin
	SET @query = '
	UPDATE  [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[BON_Liquidacion_Ventas] SET EstadoSICO = 1
             WHERE CONTRATO IN (SELECT AfilNroCon FROM [SICODIARIOBD].[dbo].[AFIL]
             WHERE AFIL.AfilNroCon in (SELECT contrato FROM [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[BON_Liquidacion_Ventas]) AND (AFIL.AfilEstado<>''T'') AND (AFIL.AfilEstado <>''Z''))'
end
  
  	EXEC (@query)
  RETURN @@RowCount			