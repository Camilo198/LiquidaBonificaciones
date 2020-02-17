USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_ValidadorHistoricoVentasPerfectas]    Script Date: 17/02/2020 3:19:14 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_ValidadorHistoricoVentasPerfectas](
	[Contrato] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[ValorPlan] [int] NOT NULL,
	[MesLiquidacion] [int] NOT NULL,
	[AñoLiquidacion] [int] NOT NULL,
	[FechaLiquidacion] [datetime] NOT NULL,
	[UsuarioLiquida] [varchar](50) NOT NULL,
	[VentaValida] [bit] NOT NULL,
	[MesValidacion] [int] NULL,
	[AñoValidacion] [int] NULL,
	[FechaValidacion] [nchar](10) NULL,
	[UsuarioValida] [varchar](50) NULL,
 CONSTRAINT [PK_ValidadorHistoricoVentasPerfectas] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


