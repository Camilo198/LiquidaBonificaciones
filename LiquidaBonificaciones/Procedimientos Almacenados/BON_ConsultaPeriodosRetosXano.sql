USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPeriodosPresupuestosXano]    Script Date: 02/03/2020 12:20:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[BON_ConsultaPeriodosRetosXano]
@Ano int
AS
BEGIN
SELECT distinct Periodo FROM [dbo].[BON_Retos] where Ano=@Ano
END
