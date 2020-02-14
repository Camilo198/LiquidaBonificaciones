USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActualizarCampos]    Script Date: 14/02/2020 12:57:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[BON_ActualizarCampos] 

AS

BEGIN
update  [BON_Liquidacion_Ventas] set MesLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Mes Liquidación')
update  [BON_Liquidacion_Ventas] set AñoLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Año Liquidación')
END 

return @@rowcount

