USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActParametroGeneral]    Script Date: 14/02/2020 12:55:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[BON_ActParametroGeneral] 
@Id int,
@Valor varchar(50),
@UsuActualiza varchar(20)
AS
UPDATE  dbo.BON_Parametros SET Valor = @Valor, UsuActualiza = @UsuActualiza, 
FecActualiza = GETDATE() where Id = @Id
return @@RowCount

