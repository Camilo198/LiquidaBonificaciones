USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ResetSystem]    Script Date: 14/02/2020 1:18:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ResetSystem]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/*
	delete from  [BON_Liquidacion_Ventas]
	delete from  [BON_LiquidacionBonificacionesGrupales]
	delete from  [BON_LiquidacionBonificaciones]
	DELETE FROM BON_VentasTotales
	DELETE FROM BON_Asesores
	delete from BON_Parametros_Historico
	DELETE FROM BON_Ausentismos
	DELETE FROM BON_AsistenciaParcial
	DELETE FROM BON_AsistenciaTotal
	delete from BON_Presupuesto	

	
	*/


	/*
	DELETE FROM BON_BonificacionEspecial
	*/
END
