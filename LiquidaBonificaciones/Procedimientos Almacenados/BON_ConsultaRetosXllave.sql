USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetosXllave]    Script Date: 16/03/2020 10:32:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BON_ConsultaRetosXllave]
@Ano int,
@Periodo int,
@CodigoGerente int,
@FechaIni datetime,
@FechaFin datetime
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,NumeroReto FROM [dbo].[BON_Retos] 
where Ano=@Ano and Periodo=@Periodo and CodigoGerente=@CodigoGerente and FechaInicialReto=@FechaIni and FechaFinalReto=@FechaFin 
END
