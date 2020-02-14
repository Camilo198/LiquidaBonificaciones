USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaUsuario]    Script Date: 14/02/2020 1:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaUsuario]
@Usuario varchar(50)
AS
BEGIN
SELECT [ID]
      ,[USUARIO]
      ,[ID_PERFIL]
      ,[HABILITA]
  FROM [dbo].[BON_Usuario] where USUARIO = @Usuario
END
