USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetos]    Script Date: 09/03/2020 5:40:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[BON_ConsultaRetosXllave]
@Ano int,
@Periodo int,
@CodigoGerente int,
@FechaIni datetime,
@FechaFin datetime
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza FROM [dbo].[BON_Retos] 
where Ano=@Ano and Periodo=@Periodo and CodigoGerente=@CodigoGerente and FechaInicialReto=@FechaIni and FechaFinalReto=@FechaFin 
END
