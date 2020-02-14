USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_AgruparVentasValidas]    Script Date: 14/02/2020 1:00:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_AgruparVentasValidas]
	-- Add the parameters for the stored procedure here
	@IdPlan int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	---Bono x Cantidad de Ventas
	if (@IdPlan=1)
	begin
	delete from BON_VentasValidas
	DBCC CHECKIDENT('BON_VentasValidas',RESEED, 0)
	insert into BON_VentasValidas
	--Clasificacion de ventas Usados
	Select  CodVendedor,Sum(ventaValida) as 'CantidadVentasValidas','2' as IdTipoVenta from BON_Liquidacion_Ventas where VentaValida=1 and CodTipoVenta=4
	group by CodVendedor
	union--Clasificacion de Ventas Nuevos
	Select CodVendedor,Sum(ventaValida) as 'CantidadVentasValidas','1' as IdTipoVenta from BON_Liquidacion_Ventas where VentaValida=1 and CodTipoVenta!=4
	group by CodVendedor
	end 


	return @@rowcount
END
