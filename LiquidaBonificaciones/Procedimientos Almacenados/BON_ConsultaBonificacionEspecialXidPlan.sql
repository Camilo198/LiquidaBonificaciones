USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaBonificacionEspecialXidPlan]    Script Date: 14/02/2020 1:05:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaBonificacionEspecialXidPlan]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from bon_bonificacionEspecial where idPlanBonificacion=@IdPlanBonificacion

	return @@rowcount
END
