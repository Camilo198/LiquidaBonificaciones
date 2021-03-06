USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarPresupuesto]    Script Date: 14/02/2020 1:03:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Periodo int,
@Ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_Presupuesto
where CodigoOficina=@CodOficina AND Periodo=@Periodo AND Ano=@Ano
RETURN @@RowCount
END
