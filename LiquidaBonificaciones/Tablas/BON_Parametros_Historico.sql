USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_Parametros_Historico]    Script Date: 17/02/2020 3:17:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_Parametros_Historico](
	[Id] [int] NULL,
	[Tipo] [varchar](50) NULL,
	[Parametro] [varchar](200) NULL,
	[Valor] [varchar](50) NULL,
	[UsuActualiza] [varchar](50) NULL,
	[FecActualiza] [datetime] NULL,
	[Observaciones] [varchar](200) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


