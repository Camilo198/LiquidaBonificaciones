USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaTodosUsuario]    Script Date: 14/02/2020 1:09:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaTodosUsuario]

AS
BEGIN
SELECT U.[ID]
      ,[USUARIO]
	  ,U.ID_PERFIL
      ,P.PERFIL
      ,[HABILITA]
  FROM [dbo].[BON_Usuario] AS U
  LEFT JOIN [dbo].[BON_Perfil] AS P ON U.ID_PERFIL = P.ID
END
