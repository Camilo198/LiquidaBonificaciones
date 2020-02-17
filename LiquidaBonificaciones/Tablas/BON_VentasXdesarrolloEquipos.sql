USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_VentasXdesarrolloEquipos]    Script Date: 17/02/2020 3:19:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BON_VentasXdesarrolloEquipos](
	[CodAsesor] [int] NOT NULL,
	[CodZona] [int] NOT NULL,
	[CodOficina] [int] NOT NULL,
	[DiasLaborados] [int] NOT NULL,
	[CantidadVentasValidas] [int] NOT NULL,
 CONSTRAINT [PK_VentasXdesarrolloEquipos] PRIMARY KEY CLUSTERED 
(
	[CodAsesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


