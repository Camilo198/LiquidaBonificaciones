USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearBonificacionEspecial]    Script Date: 14/02/2020 1:10:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
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
insert into BON_BonificacionEspecial (DescripcionBono,PlanesMinimos,PlanesMaximos,ValorBono,Aplica,FechaActualiza,UsuarioActualiza,IdPlanBonificacion)
values (@descripcion, @planesMinimos,@planesMaximos,@valorBono,
@Aplica,GETDATE(),@usuarioactualiza,@planBonificacion)
RETURN @@RowCount
END
