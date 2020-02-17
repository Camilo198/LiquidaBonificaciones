USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_VentasTotales]    Script Date: 17/02/2020 3:19:32 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BON_VentasTotales](
	[Codigo] [int] NOT NULL,
	[VentasTotales] [numeric](18, 2) NULL,
 CONSTRAINT [PK_BON_VentasTotalesXoficina] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


