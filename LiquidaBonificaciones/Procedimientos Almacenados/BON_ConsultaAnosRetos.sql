USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaAnosPresupuestos]    Script Date: 02/03/2020 12:16:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[BON_ConsultaAnosRetos]
AS
BEGIN
SELECT distinct Ano FROM [dbo].[BON_Retos]
END
