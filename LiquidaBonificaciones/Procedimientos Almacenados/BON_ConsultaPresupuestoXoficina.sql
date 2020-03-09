USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPresupuestoXoficina]    Script Date: 09/03/2020 12:47:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BON_ConsultaPresupuestoXoficina]
@Ano int,
@Periodo int,
@Oficina int
AS
BEGIN

SELECT * FROM [dbo].[BON_Presupuesto] where Ano=@Ano and Periodo=@Periodo and CodigoOficina=@Oficina

END
