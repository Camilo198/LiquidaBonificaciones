USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActualizarUsuario]    Script Date: 14/02/2020 12:58:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ActualizarUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
UPDATE [dbo].[BON_Usuario] SET USUARIO = @Usuario, ID_PERFIL = @IdPerfil, HABILITA = @Habilita WHERE ID = @Id 
END

return @@rowcount