USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_AsesoresXoficina]    Script Date: 17/02/2020 3:15:27 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BON_AsesoresXgrupo](
	[CodGrupo] [int] NOT NULL,
	[CantidadAsesores] [int] NOT NULL,
 CONSTRAINT [PK_AsesoresXgrupo] PRIMARY KEY CLUSTERED 
(
	[CodGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


