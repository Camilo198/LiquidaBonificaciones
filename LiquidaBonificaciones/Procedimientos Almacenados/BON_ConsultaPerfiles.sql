USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPerfiles]    Script Date: 14/02/2020 1:07:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaPerfiles]

AS
BEGIN
SELECT [ID] ,[PERFIL] FROM [dbo].[BON_Perfil]
END
