USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalculaReglas]    Script Date: 14/02/2020 1:03:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_CalculaReglas] 
@cantidadReglas int
AS

BEGIN  
 update BON_Liquidacion_Ventas set VentaValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_Liquidacion_Ventas]
 where  
 ([ValidaPlan]+ [Venta]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]+ [Prospecto]+ [Permanencia]) = @cantidadReglas)-- +  [Asistencia]se retira la asistencia, ya que no es obligatoria en todas

 return @@RowCount

END 

