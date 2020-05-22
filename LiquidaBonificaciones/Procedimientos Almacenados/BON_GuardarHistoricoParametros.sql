USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_GuardarHistoricoParametros]    Script Date: 21/05/2020 9:12:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BON_GuardarHistoricoParametros]

AS
BEGIN

exec BON_Guardar_Historico_Liquidacion
declare @Mes int
	declare @Ano int 
	select @Mes=MesLiquidacion,@Ano=AñoLiquidacion from BON_Liquidacion_Ventas
  INSERT INTO [dbo].[BON_Parametros_Historico]
  SELECT *,@Mes,@Ano FROM [dbo].[BON_Parametros]
END

return @@rowcount
