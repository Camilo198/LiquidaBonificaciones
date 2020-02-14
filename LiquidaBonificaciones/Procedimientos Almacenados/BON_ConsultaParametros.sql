USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametros]    Script Date: 14/02/2020 1:06:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametros]
@Tipo as varchar(50)
AS
BEGIN
SELECT [Id] ,[Parametro] ,[Valor] FROM [dbo].[BON_Parametros] where Tipo = @Tipo
END
