USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_EliminaVentasOutSourcing]    Script Date: 15/05/2020 9:00:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_EliminaVentasOutSourcing]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from BON_PamVentasOutsorsing
END
