USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_GuardarHistoricoParametros]    Script Date: 14/02/2020 1:11:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_GuardarHistoricoParametros]

AS
BEGIN
  INSERT INTO [dbo].[BON_Parametros_Historico]
  SELECT * FROM [dbo].[BON_Parametros]
END

return @@rowcount
