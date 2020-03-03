USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetos]    Script Date: 02/03/2020 4:13:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BON_ConsultaRetos]
@Ano int,
@Periodo int
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza FROM [dbo].[BON_Retos] where Ano=@Ano and Periodo=@Periodo
END
