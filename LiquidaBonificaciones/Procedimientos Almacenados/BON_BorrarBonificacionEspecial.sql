USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarBonificacionEspecial]    Script Date: 14/02/2020 1:02:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_BonificacionEspecial
where id=@id
RETURN @@RowCount
END
