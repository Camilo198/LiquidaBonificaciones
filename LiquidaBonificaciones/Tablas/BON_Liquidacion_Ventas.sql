USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_Liquidacion_Ventas]    Script Date: 17/02/2020 3:16:38 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_Liquidacion_Ventas](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [int] NULL,
	[NomCliente] [varchar](100) NULL,
	[CodTipoVenta] [int] NULL,
	[TipoVenta] [varchar](100) NULL,
	[CodPlan] [int] NULL,
	[LineaPlan] [varchar](100) NULL,
	[Convenio] [varchar](10) NULL,
	[ValorPlan] [numeric](18, 2) NULL,
	[Inscripcion] [numeric](18, 2) NULL,
	[FechaPago] [datetime] NULL,
	[FechaSuscribe] [datetime] NULL,
	[FechaIngreso] [datetime] NULL,
	[NombrePlan] [varchar](100) NULL,
	[Plazo] [int] NULL,
	[AyuraAsesor] [numeric](18, 2) NULL,
	[AyuraDirector] [numeric](18, 2) NULL,
	[ValidaPlan] [varchar](2) NULL,
	[Venta] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[Asistencia] [int] NULL,
	[Permanencia] [int] NULL,
	[VentaValida] [int] NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


