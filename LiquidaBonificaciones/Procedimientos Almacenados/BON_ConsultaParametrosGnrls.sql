USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametrosGnrls]    Script Date: 14/02/2020 1:06:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametrosGnrls]

AS
BEGIN
SELECT [Id],[Tipo],[Parametro] ,[Valor], [UsuActualiza], [FecActualiza],[Observaciones] FROM [dbo].[BON_Parametros] where Tipo <> 'Estado'
END


