USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_AgruparVentasValidas]    Script Date: 17/02/2020 2:54:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Alter PROCEDURE [dbo].[BON_AgruparVentasValidas]
	-- Add the parameters for the stored procedure here
	@IdPlan int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	---Bono x Cantidad de Ventas
	if (@IdPlan=6)
	begin
	insert into BON_VentasValidasXtipoVenta
	--Clasificacion de ventas Usados
	Select  CodVendedor,Sum(ventaValida) as 'CantidadVentasValidas','2' as IdTipoVenta from BON_Liquidacion_Ventas where VentaValida=1 and CodTipoVenta=4
	group by CodVendedor
	union--Clasificacion de Ventas Nuevos
	Select CodVendedor,Sum(ventaValida) as 'CantidadVentasValidas','1' as IdTipoVenta from BON_Liquidacion_Ventas where VentaValida=1 and CodTipoVenta!=4
	group by CodVendedor
	end 


	return @@rowcount
END
