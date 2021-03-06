USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActBonificacionEspecial]    Script Date: 14/02/2020 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ActBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int,
@descripcion varchar(50),
@planesMinimos numeric(18,2),
@planesMaximos numeric(18,2),
@valorBono numeric(18,2),
@Aplica bit,
@usuarioactualiza varchar(50),
@planBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_BonificacionEspecial 
set DescripcionBono=@descripcion, PlanesMinimos=@planesMinimos,	PlanesMaximos=@planesMaximos,ValorBono=@valorBono,
Aplica=@Aplica,FechaActualiza=GETDATE(),UsuarioActualiza=@usuarioactualiza,idPlanBonificacion=@planBonificacion
where id=@id
RETURN @@RowCount
END
