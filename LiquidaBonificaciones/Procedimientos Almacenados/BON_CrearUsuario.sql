USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearUsuario]    Script Date: 14/02/2020 1:11:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_CrearUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
INSERT INTO [dbo].[BON_Usuario] ([USUARIO], [ID_PERFIL],[HABILITA]) VALUES (@Usuario, @IdPerfil, @Habilita)
END

return @@rowcount