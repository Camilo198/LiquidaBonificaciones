USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_BorarAsesores_SQL]    Script Date: 14/02/2020 1:02:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorarAsesores_SQL] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
delete from BON_Asesores
DBCC CHECKIDENT('BON_Asesores',RESEED, 0)--Devuelve el indice de la tabla de asesores a 0 para el Id;
RETURN @@RowCount
END
