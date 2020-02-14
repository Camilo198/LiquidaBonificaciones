USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPresupuesto]    Script Date: 14/02/2020 1:09:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPresupuesto]
@Ano int,
@Periodo int
AS
BEGIN
SELECT * FROM [dbo].[BON_Presupuesto] where Ano=@Ano and Periodo=@Periodo
END
