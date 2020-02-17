USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_Parametros]    Script Date: 17/02/2020 3:17:28 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_Parametros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Parametro] [varchar](200) NULL,
	[Valor] [varchar](50) NULL,
	[UsuActualiza] [varchar](50) NULL,
	[FecActualiza] [datetime] NULL,
	[Observaciones] [varchar](200) NULL,
 CONSTRAINT [PK_BON_Parametros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


