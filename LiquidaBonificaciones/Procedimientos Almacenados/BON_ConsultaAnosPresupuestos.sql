USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaAnosPresupuestos]    Script Date: 14/02/2020 1:05:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaAnosPresupuestos]
AS
BEGIN
SELECT distinct Ano FROM [dbo].[BON_Presupuesto]
END
