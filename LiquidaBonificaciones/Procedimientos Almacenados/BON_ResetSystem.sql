USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ResetSystem]    Script Date: 18/02/2020 9:50:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_ResetSystem]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	/*Eliminar data temporal del sistema
	DELETE FROM BON_VentasTotales
	DELETE FROM BON_Asesores	
	DELETE FROM BON_Ausentismos
	DELETE FROM BON_AsistenciaParcial
	DELETE FROM BON_AsistenciaTotal
	delete from BON_AsesoresXgrupo
	delete from BON_VentasXdesarrolloEquipos
	delete from  [BON_Liquidacion_Ventas]
	delete from BON_VentasValidasXtipoVenta
	delete from BON_VentasTotalesxOficina
	delete from BON_PorcentajeSinCeremonia
	delete from bon_presupuestoXzona

	*/
	select * from BON_LiquidacionBonificaciones
	select * from BON_LiquidacionBonificacionesGrupales
	select * from BON_AsistenciaTotal

	/*
	Eliminar Data Transaccional del sistema
	delete from  [BON_LiquidacionBonificacionesGrupales]
	delete from  [BON_LiquidacionBonificaciones]
	delete from BON_Parametros_Historico
	*/

	


	/*
	Eliminar presupeustos cargados
	Delete from BON_Presupuesto	
	*/

/*--Hard Reset del sistema Elimina datos fundamentales del sistema, al borrar el aplicativo quedara inservible hasta que se reparametrize
	DELETE FROM BON_BonificacionEspecial
	Update BON_Parametros set Valor=null
	*/
	
END
