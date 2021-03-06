USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetos]    Script Date: 16/03/2020 10:33:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BON_ConsultaRetos]
@Ano int,
@Periodo int
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,NumeroReto FROM [dbo].[BON_Retos] where Ano=@Ano and Periodo=@Periodo
order by NumeroReto asc ,CodigoZona asc
END
