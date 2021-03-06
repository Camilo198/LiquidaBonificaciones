USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActPlanBonificacionEspecial]    Script Date: 14/02/2020 12:56:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ActPlanBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int,
@Estado bit,
@usuarioActualiza varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_PlanesDeBonificacion
set Estado=@Estado, Usuario=@usuarioActualiza,FechaActualizacion=GETDATE()
where id=@id
RETURN @@RowCount
END
