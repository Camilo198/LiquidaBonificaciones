USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametrosId]    Script Date: 14/02/2020 1:06:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametrosId]
@Id as int,
@Valor as varchar(50)
AS
BEGIN
SELECT  [Id]
      ,[Tipo]
      ,[Parametro]
      ,[Valor]
      ,[UsuActualiza]
      ,[FecActualiza]
      ,[Observaciones]
  FROM [Bonificacion_desarrollo].[dbo].[BON_Parametros_Historico] where Id = @Id and Valor = @Valor
END
