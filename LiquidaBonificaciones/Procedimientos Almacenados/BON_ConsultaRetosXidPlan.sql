USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetosXidPlan]    Script Date: 20/03/2020 4:11:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_ConsultaRetosXidPlan]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int,
@mes int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from BON_Retos where idPlanBonificacion=@IdPlanBonificacion and Periodo=@mes and Ano=@ano

	return @@rowcount
END
