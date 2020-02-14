USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearPresupuesto]    Script Date: 14/02/2020 1:11:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@Periodo int,
@Ano int,
@usuarioactualiza varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_Presupuesto(CodigoOficina,Presupuesto,Periodo,Ano,FechaActualiza,UsuarioActualiza)
values (@CodOficina, @Presupuesto,@Periodo,@Ano,
GETDATE(),@usuarioactualiza)
RETURN @@RowCount
END
