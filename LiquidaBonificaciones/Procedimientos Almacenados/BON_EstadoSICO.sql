
DECLARE @query as varchar (max)	
declare @Servidor varchar(100)
declare @BaseDatos varchar(100)
select @Servidor = Servidor, @BaseDatos= BaseDatos from [dbo].[ServidoresBasesDatos] where IDServidoresBasesDatos=2

	SET @query = '
	UPDATE  [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[BON_PamVentasOutsorsing] SET EstadoSICO = 1
             WHERE Contrato IN (SELECT AfilNroCon FROM [SICODIARIOBD].[dbo].[AFIL]
             WHERE AFIL.AfilNroCon in (SELECT contrato FROM [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[BON_pamVentasOutsorsing]) AND (AFIL.AfilEstado<>''T'') AND (AFIL.AfilEstado <>''Z''))'


EXEC (@query)