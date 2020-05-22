USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_Guardar_Historico_Liquidacion]    Script Date: 21/05/2020 9:13:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_Guardar_Historico_Liquidacion]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into BON_Liquidacion_Ventas_Hist
    select * from BON_Liquidacion_Ventas
	
	declare @Mes int
	declare @Ano int 
	select @Mes=MesLiquidacion,@Ano=AñoLiquidacion from BON_Liquidacion_Ventas
	insert into BON_BonificacionEspecial_Hist
	select *,@Mes,@Ano from BON_BonificacionEspecial 

	insert into BON_PamVentasOutsorsing_Hist
	select * from BON_PamVentasOutsorsing



	
END
