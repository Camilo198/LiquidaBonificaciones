USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 14/02/2020 1:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CalcularVentasTotales]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from BON_VentasTotales
	if(@idPlanBonificacion=1 or @idPlanBonificacion=2)
	begin
	insert Into BON_VentasTotales
	select * from(
	select 
	 CodVendedor ,
	case 
	when @idPlanBonificacion =1 then SUM(VentaValida) 
	when @idPlanBonificacion=2 then SUM (ValorPlan)
	end as VentasTotales
	 from BON_Liquidacion_Ventas where ventaValida=1 
	group by CodVendedor ) as T1
	 where 
	 T1.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 and T1.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 end

	else if(@idPlanBonificacion=3 or @idPlanBonificacion=4)
	begin
	insert Into BON_VentasTotales
	select * from(	
	select 
	 liv.CodOficina ,
	 cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
	 from BON_Liquidacion_Ventas as liv
	 inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
	  where ventaValida=1
	group by liv.CodOficina
	,pre.Presupuesto
	 ) as T1
	 where 
	 T1.VentasTotales>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	 and T1.VentasTotales<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	 end
	
END
