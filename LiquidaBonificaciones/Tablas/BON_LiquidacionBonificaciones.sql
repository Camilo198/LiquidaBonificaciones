USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones]    Script Date: 17/02/2020 3:17:00 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_LiquidacionBonificaciones](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NULL,
	[Ausentismos] [int] NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


