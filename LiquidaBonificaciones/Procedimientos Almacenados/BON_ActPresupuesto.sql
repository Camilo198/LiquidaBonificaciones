USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActPresupuesto]    Script Date: 14/02/2020 12:56:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ActPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@periodo int,
@ano int,
@usuarioactualiza varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_Presupuesto
set  Presupuesto=@Presupuesto,
FechaActualiza=GETDATE(),UsuarioActualiza=@usuarioactualiza
where CodigoOficina=@CodOficina and Periodo=@periodo and Ano=@ano
RETURN @@RowCount
END
