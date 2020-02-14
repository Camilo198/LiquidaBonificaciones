USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaUsuarioChevy]    Script Date: 14/02/2020 1:09:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaUsuarioChevy]

AS
BEGIN
DECLARE @query as varchar (max)	
declare @Servidor varchar(100)
declare @BaseDatos varchar(100)

select @Servidor = Servidor, @BaseDatos= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=11

SET @query = 'SELECT [IdUsuario] AS USUARIO FROM [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[ADM_MenuUsuario] WHERE MenuId = 287 AND Habilita = 1'
EXEC (@query)
--SELECT (@query)
RETURN @@RowCount
END
