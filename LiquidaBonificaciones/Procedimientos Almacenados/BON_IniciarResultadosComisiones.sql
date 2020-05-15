-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE BON_IniciarResultadosComisiones
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--- Limpia Tabla de Resultados
	delete from BON_ResultadosComisiones
	insert into BON_ResultadosComisiones
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as AsistenciaTotal
	,0 as Ausentismos	
	from BON_PamVentasOutsorsing
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_PamVentasOutsorsing group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_ResultadosComisiones as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_ResultadosComisiones as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_ResultadosComisiones as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	select * from BON_ResultadosComisiones
END
GO
