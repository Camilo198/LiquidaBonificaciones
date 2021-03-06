USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActualizarCampos]    Script Date: 15/05/2020 8:13:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BON_ActualizarCampos] 

AS

BEGIN
update  [BON_PamVentasOutsorsing] set MesLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Mes Liquidación')
update  [BON_PamVentasOutsorsing] set AñoLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Año Liquidación')
update  [BON_Liquidacion_Ventas] set MesLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Mes Liquidación')
update  [BON_Liquidacion_Ventas] set AñoLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Año Liquidación')
END 

return @@rowcount

