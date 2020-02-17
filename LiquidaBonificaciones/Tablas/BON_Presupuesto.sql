USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_Presupuesto]    Script Date: 17/02/2020 3:18:36 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_Presupuesto](
	[CodigoOficina] [int] NOT NULL,
	[Presupuesto] [int] NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[FechaActualiza] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[CodigoOficina] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


