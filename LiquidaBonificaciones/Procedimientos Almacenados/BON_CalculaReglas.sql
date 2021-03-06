USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalculaReglas]    Script Date: 14/05/2020 4:03:55 p. m. ******/
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
@CantidadReglasComisiones int=0

if ((select Valor from BON_Parametros where Id=5)='Si')
begin
set @CantidadReglasComisiones=@CantidadReglasComisiones+1
--print @cantidadReglasComisiones
end
if((select Valor from BON_Parametros where Id=12)='Si')
begin
set @CantidadReglasComisiones=@CantidadReglasComisiones+1
end
select @CantidadReglasComisiones
  update BON_PamVentasOutsorsing set ComisionValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_PamVentasOutsorsing]
 where  
 ([NoExclucion]+ [VentaInscripcion]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]+@CantidadReglasComisiones) = @cantidadReglasBonificaciones+1)
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

