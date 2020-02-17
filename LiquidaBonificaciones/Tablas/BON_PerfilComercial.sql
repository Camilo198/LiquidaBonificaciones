USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_PerfilComercial]    Script Date: 17/02/2020 3:18:05 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_PerfilComercial](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[ROL] [varchar](20) NOT NULL,
	[UsuarioActualiza] [varchar](20) NULL,
	[FechaActualiza] [datetime] NULL,
 CONSTRAINT [PK_BON_PerfilComercial] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


