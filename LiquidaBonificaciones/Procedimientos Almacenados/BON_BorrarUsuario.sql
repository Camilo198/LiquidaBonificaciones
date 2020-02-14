USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarUsuario]    Script Date: 14/02/2020 1:03:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_BorrarUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
DELETE [dbo].[BON_Usuario]  WHERE ID = @Id 
END

return @@rowcount