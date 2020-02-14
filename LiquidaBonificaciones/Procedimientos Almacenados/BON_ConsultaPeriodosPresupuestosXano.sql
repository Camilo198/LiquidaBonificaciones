USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPeriodosPresupuestosXano]    Script Date: 14/02/2020 1:07:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPeriodosPresupuestosXano]
@Ano int
AS
BEGIN
SELECT distinct Periodo FROM [dbo].[BON_Presupuesto] where Ano=@Ano
END
