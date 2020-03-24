USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalculaReglas]    Script Date: 18/03/2020 6:31:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BON_CalculaReglas] 
@cantidadReglas int
AS

BEGIN 

declare 
@cantidadReglasBonificaciones int=@cantidadReglas, 
@CantidadReglasComisiones int =@cantidadReglas-1



  update BON_Liquidacion_Ventas set ComisionValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_Liquidacion_Ventas]
 where  
 ([ValidaPlan]+ [Venta]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]) = @CantidadReglasComisiones)
 -- + [Prospecto] Usuario no solicita esta regla en la validacion
 -- +  [Asistencia]se retira la asistencia, ya que no es obligatoria en todas
 --+ [Permanencia] se retira ya que no pertenece a la venta valida y solo sirve para saber si se le paga o no

  update BON_Liquidacion_Ventas set VentaValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_Liquidacion_Ventas]
 where  
 ([ValidaPlan]+ [Venta]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]+ [Prospecto]) = @cantidadReglasBonificaciones)-- +  [Asistencia]se retira la asistencia, ya que no es obligatoria en todas
 --+ [Permanencia] se retira ya que no pertenece a la venta valida y solo sirve para saber si se le paga o no

 return @@RowCount

END 

