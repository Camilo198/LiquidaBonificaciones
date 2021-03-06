USE [Bonificacion_QA]
GO
/****** Object:  Table [dbo].[BON_Asesores]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Asesores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[VendCodigo] [int] NULL,
	[VendTipoVen] [int] NULL,
	[VendIdeNro] [bigint] NULL,
	[RegiCodigo] [int] NULL,
	[RegiNombre] [varchar](50) NULL,
	[OficCodigo] [int] NULL,
	[OficNombre] [varchar](250) NULL,
	[VendFecIng] [datetime] NULL,
	[VendFecRet] [datetime] NULL,
	[VendTipoAse] [varchar](10) NULL,
	[VendMail] [varchar](100) NULL,
	[VendNombre] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Asesores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_AsistenciaParcial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_AsistenciaParcial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[DiasContratado] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BON_Asistencia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_AsistenciaTotal]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_AsistenciaTotal](
	[Cedula] [bigint] NOT NULL,
	[DiasLaborados] [int] NOT NULL,
 CONSTRAINT [PK_BON_DiasLaborados] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Ausentismos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_Ausentismos](
	[Cedula] [bigint] NOT NULL,
	[Ausentismos] [int] NOT NULL,
 CONSTRAINT [PK_BON_Ausentismos] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_BonificacionEspecial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_BonificacionEspecial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionBono] [varchar](50) NOT NULL,
	[PlanesMinimos] [numeric](18, 2) NOT NULL,
	[PlanesMaximos] [numeric](18, 2) NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Aplica] [bit] NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
 CONSTRAINT [PK_BON_BonificacionEspecial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_BonificacionEspecial_Hist]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_BonificacionEspecial_Hist](
	[ID] [int] NOT NULL,
	[DescripcionBono] [varchar](50) NOT NULL,
	[PlanesMinimos] [numeric](18, 2) NOT NULL,
	[PlanesMaximos] [numeric](18, 2) NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Aplica] [bit] NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_BonificacionEspecial_Hist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Mes] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_BonificacionEspecial_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_BonificacionEspecial_Recu](
	[ID] [int] NOT NULL,
	[DescripcionBono] [varchar](50) NOT NULL,
	[PlanesMinimos] [numeric](18, 2) NOT NULL,
	[PlanesMaximos] [numeric](18, 2) NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Aplica] [bit] NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_BonificacionEspecial_Recu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Mes] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_BonificacionEspecial-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_BonificacionEspecial-1](
	[ID] [int] NOT NULL,
	[DescripcionBono] [varchar](50) NOT NULL,
	[PlanesMinimos] [numeric](18, 2) NOT NULL,
	[PlanesMaximos] [numeric](18, 2) NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Aplica] [bit] NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_BonificacionEspecial-1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Mes] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_BonificacionEspecial-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_BonificacionEspecial-2](
	[ID] [int] NOT NULL,
	[DescripcionBono] [varchar](50) NOT NULL,
	[PlanesMinimos] [numeric](18, 2) NOT NULL,
	[PlanesMaximos] [numeric](18, 2) NOT NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Aplica] [bit] NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_BonificacionEspecial-2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Mes] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_CierreCRM]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_CierreCRM](
	[Contrato] [varchar](50) NOT NULL,
	[Perfeccionamiento] [int] NOT NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BON_CierreCRM] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_ContratoTelefonico]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_ContratoTelefonico](
	[ContratoTelefonico] [varchar](50) NOT NULL,
	[Periodo] [int] NULL,
	[Año] [int] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
	[FechaActualiza] [datetime] NULL,
 CONSTRAINT [PK_BON_ContratoTelefonico] PRIMARY KEY CLUSTERED 
(
	[ContratoTelefonico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas]    Script Date: 22/05/2020 9:12:00 a. m. ******/
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
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[CodDirectorComision] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas_Hist]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas_Hist](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NOT NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[CodDirectorComision] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NOT NULL,
	[AñoLiquidacion] [varchar](4) NOT NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Liquidacion_Ventas_Hist] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[MesLiquidacion] ASC,
	[AñoLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas_Hist_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas_Hist_Recu](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NOT NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[CodDirectorComision] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NOT NULL,
	[AñoLiquidacion] [varchar](4) NOT NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Liquidacion_Ventas_Hist_Recu] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[MesLiquidacion] ASC,
	[AñoLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas_Hist-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas_Hist-1](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NOT NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[CodDirectorComision] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NOT NULL,
	[AñoLiquidacion] [varchar](4) NOT NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Liquidacion_Ventas_Hist-1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[MesLiquidacion] ASC,
	[AñoLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas_Hist-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas_Hist-2](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NOT NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[CodDirectorComision] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NOT NULL,
	[AñoLiquidacion] [varchar](4) NOT NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL,
 CONSTRAINT [PK_BON_Liquidacion_Ventas_Hist-2] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[MesLiquidacion] ASC,
	[AñoLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas_Recu](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas-1](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Liquidacion_Ventas-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Liquidacion_Ventas-2](
	[CodZona] [int] NULL,
	[NomZona] [varchar](100) NULL,
	[CodOficina] [int] NULL,
	[NomOficina] [varchar](100) NULL,
	[TipoOficina] [int] NULL,
	[CodCargoAsesor] [int] NULL,
	[CargoVendedor] [varchar](50) NULL,
	[CodVendedor] [int] NULL,
	[NomVendedor] [varchar](100) NULL,
	[TipoAsesor] [varchar](1) NULL,
	[Contrato] [varchar](50) NULL,
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
	[ValidaPlan] [int] NULL,
	[Venta] [int] NOT NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[Prospecto] [int] NULL,
	[VentaValida] [int] NULL,
	[ComisionValida] [int] NULL,
	[Permanencia] [int] NULL,
	[NumeroReto] [int] NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[FecActualizacion] [datetime] NULL,
	[UsuarioActualiza] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones_Hist]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones_Hist](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_Hist] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones_Hist_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones_Hist_Recu](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_Hist_Recu] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones_Hist-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones_Hist-1](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_Hist-1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones_Hist-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones_Hist-2](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_Hist-2] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones_Recu](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones_Recu] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones-1](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones-1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificaciones-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificaciones-2](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[PermanenciaDiferida%] [numeric](18, 2) NULL,
	[PermanenciaTotal%] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificaciones-2] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC,
	[IdBonificacion] ASC,
	[IdPlan] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_1] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales_Hist]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales_Hist](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_Hist] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales_Hist_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales_Hist_Recu](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_Hist_Recu] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales_Hist-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales_Hist-1](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_Hist-1] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales_Hist-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales_Hist-2](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_Hist-2] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales_Recu](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales_Recu] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales-1](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales-1] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_LiquidacionBonificacionesGrupales-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_LiquidacionBonificacionesGrupales-2](
	[Contrato] [int] NOT NULL,
	[IdBonificacion] [int] NOT NULL,
	[IdPLan] [int] NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[CodigoOficiona] [int] NOT NULL,
	[CodigoVendedor] [int] NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[MetaAlcanzada%] [numeric](18, 2) NOT NULL,
	[PermanenciaDiferida] [numeric](18, 2) NULL,
	[PermanenciaTotal] [numeric](18, 2) NULL,
	[ValorBono] [numeric](18, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[DiasAsistidos] [int] NOT NULL,
	[Ausentismos] [int] NOT NULL,
	[Observacion] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](20) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[rn] [int] NULL,
 CONSTRAINT [PK_BON_LiquidacionBonificacionesGrupales-2] PRIMARY KEY CLUSTERED 
(
	[IdBonificacion] ASC,
	[CodigoVendedor] ASC,
	[Periodo] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing_Hist]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing_Hist](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing_Hist] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing_Hist-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing_Hist-1](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing_Hist-1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing_Hist-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing_Hist-2](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing_Hist-2] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing-1](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing-1] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PamVentasOutsorsing-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PamVentasOutsorsing-2](
	[Cupo] [varchar](50) NOT NULL,
	[Afiliado] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[CodOficina] [int] NOT NULL,
	[Oficina] [varchar](50) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorPlan] [numeric](18, 0) NOT NULL,
	[CodVendedor] [int] NOT NULL,
	[IdeVendedor] [numeric](18, 0) NOT NULL,
	[nombreVendedor] [varchar](50) NOT NULL,
	[Tipo] [varchar](10) NULL,
	[PorcentajeInscripcion] [numeric](18, 2) NOT NULL,
	[ValorInscripcionSinIva] [numeric](18, 0) NOT NULL,
	[ValorPagoParcial] [numeric](18, 0) NOT NULL,
	[AlturaDiferida] [varchar](50) NULL,
	[TipoContrato] [varchar](50) NOT NULL,
	[EstadoCupo] [varchar](10) NOT NULL,
	[CarroAgil] [varchar](50) NULL,
	[MarcaDiferida] [varchar](50) NULL,
	[CodigoDirector] [int] NOT NULL,
	[IdeDirector] [numeric](18, 0) NOT NULL,
	[NombreDirector] [varchar](50) NOT NULL,
	[ValorIvaInscripcion] [numeric](18, 0) NOT NULL,
	[ValorTotaInscripcionConIva] [numeric](18, 0) NOT NULL,
	[MarcaExcl] [varchar](50) NULL,
	[LineaProducto] [varchar](50) NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[MesLiquidacion] [varchar](2) NULL,
	[AñoLiquidacion] [varchar](4) NULL,
	[NoExclucion] [int] NULL,
	[VentaInscripcion] [int] NULL,
	[LlamadaBV] [int] NULL,
	[Asamblea] [int] NULL,
	[EstadoSICO] [int] NULL,
	[ComisionValida] [int] NULL,
 CONSTRAINT [PK_BON_PamVentasOutsorsing-2] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Parametros]    Script Date: 22/05/2020 9:12:00 a. m. ******/
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
/****** Object:  Table [dbo].[BON_Parametros_Historico]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Parametros_Historico](
	[Id] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Parametro] [varchar](200) NULL,
	[Valor] [varchar](50) NULL,
	[UsuActualiza] [varchar](50) NULL,
	[FecActualiza] [datetime] NULL,
	[Observaciones] [varchar](200) NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_Parametros_Historico] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Parametros-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Parametros-1](
	[Id] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Parametro] [varchar](200) NULL,
	[Valor] [varchar](50) NULL,
	[UsuActualiza] [varchar](50) NULL,
	[FecActualiza] [datetime] NULL,
	[Observaciones] [varchar](200) NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_Parametros-1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Parametros-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Parametros-2](
	[Id] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Parametro] [varchar](200) NULL,
	[Valor] [varchar](50) NULL,
	[UsuActualiza] [varchar](50) NULL,
	[FecActualiza] [datetime] NULL,
	[Observaciones] [varchar](200) NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_BON_Parametros-2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Perfil]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Perfil](
	[ID] [int] NOT NULL,
	[PERFIL] [varchar](100) NULL,
 CONSTRAINT [PK_SCO_Perfil] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_PerfilComercial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
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
/****** Object:  Table [dbo].[BON_PlanesDeBonificacion]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_PlanesDeBonificacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombrePlan] [varchar](50) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Estado] [bit] NULL,
	[DescripcionPlan] [varchar](max) NULL,
	[Usuario] [varchar](50) NULL,
	[FechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_BON_PlanesDeBonificacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Presupuesto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
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
	[CodZona] [int] NULL,
	[CodigoDirector] [int] NULL,
	[CodigoGerente] [int] NULL,
	[RetoSonadoresDia] [int] NULL,
	[RetoExtraSonadoresDia] [numeric](18, 0) NULL,
	[BonoAsesorSonadoresDia] [numeric](18, 0) NULL,
	[BonoAsesorExtraSonadoresDia] [numeric](18, 0) NULL,
	[BonoDirectorSonadoresDia] [numeric](18, 0) NULL,
	[BonoDirectorExtraSonadorDia] [numeric](18, 0) NULL,
	[IdBonificacion] [int] IDENTITY(1,1) NOT NULL,
	[idPlanBonificacion] [int] NULL,
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
/****** Object:  Table [dbo].[BON_PresupuestoXzona]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_PresupuestoXzona](
	[CodZona] [int] NOT NULL,
	[Presupuesto] [int] NOT NULL,
 CONSTRAINT [PK_BON_PresupuestoXzona] PRIMARY KEY CLUSTERED 
(
	[CodZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Resultados]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_Resultados](
	[codVend] [int] NOT NULL,
	[Cedula] [numeric](18, 0) NULL,
	[codZona] [int] NULL,
	[codOficina] [int] NULL,
	[TotalVentasRegistradas] [numeric](18, 0) NULL,
	[TotalVentasValidasXasesor] [numeric](18, 0) NULL,
	[TotalValorPlan] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXoficina] [numeric](18, 2) NULL,
	[TotalComisionesValidasXasesor] [numeric](18, 0) NULL,
	[DiasAsistidos] [numeric](18, 0) NULL,
	[Ausentismos] [numeric](18, 0) NULL,
	[AsistenciaDesEquiDir] [numeric](18, 0) NULL,
	[AsistenciaDesEquiGer] [numeric](18, 0) NULL,
	[AsesoresXoficina] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXofic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOfic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOficCE] [numeric](18, 2) NULL,
	[TotalVentasRegistradasXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXoficina] [numeric](18, 0) NULL,
	[TotalVentasXOficina] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXoficina] [numeric](18, 0) NULL,
	[TotalParticipantesCeremoniaXoficina] [numeric](18, 0) NULL,
	[PorcentajeSinCeremoniaXoficina] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[PermanenciaTotalOficina] [numeric](18, 2) NULL,
	[PermanenciaDiferidaOficina] [numeric](18, 2) NULL,
	[PermanenciaDirector] [numeric](18, 0) NULL,
	[TotalVentasRegistradasXZona] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXzona] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXzona] [numeric](18, 0) NULL,
	[TotalVentasXzona] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXzona] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXzona] [numeric](18, 2) NULL,
	[AsesoresXzona] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXzona] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasZona] [numeric](18, 2) NULL,
	[PorcentajeSinCeremoniaXzona] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[PermanenciaTotalZona] [numeric](18, 2) NULL,
	[PermanenciaDiferidaZona] [numeric](18, 2) NULL,
	[PermanenciaGerente] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BON_Resultados] PRIMARY KEY CLUSTERED 
(
	[codVend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Resultados_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_Resultados_Recu](
	[codVend] [int] NOT NULL,
	[Cedula] [numeric](18, 0) NULL,
	[codZona] [int] NULL,
	[codOficina] [int] NULL,
	[TotalVentasRegistradas] [numeric](18, 0) NULL,
	[TotalVentasValidasXasesor] [numeric](18, 0) NULL,
	[TotalValorPlan] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXoficina] [numeric](18, 2) NULL,
	[TotalComisionesValidasXasesor] [numeric](18, 0) NULL,
	[DiasAsistidos] [numeric](18, 0) NULL,
	[Ausentismos] [numeric](18, 0) NULL,
	[AsistenciaDesEquiDir] [numeric](18, 0) NULL,
	[AsistenciaDesEquiGer] [numeric](18, 0) NULL,
	[AsesoresXoficina] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXofic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOfic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOficCE] [numeric](18, 2) NULL,
	[TotalVentasRegistradasXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXoficina] [numeric](18, 0) NULL,
	[TotalVentasXOficina] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXoficina] [numeric](18, 0) NULL,
	[TotalParticipantesCeremoniaXoficina] [numeric](18, 0) NULL,
	[PorcentajeSinCeremoniaXoficina] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[PermanenciaTotalOficina] [numeric](18, 2) NULL,
	[PermanenciaDiferidaOficina] [numeric](18, 2) NULL,
	[PermanenciaDirector] [numeric](18, 0) NULL,
	[TotalVentasRegistradasXZona] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXzona] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXzona] [numeric](18, 0) NULL,
	[TotalVentasXzona] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXzona] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXzona] [numeric](18, 2) NULL,
	[AsesoresXzona] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXzona] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasZona] [numeric](18, 2) NULL,
	[PorcentajeSinCeremoniaXzona] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[PermanenciaTotalZona] [numeric](18, 2) NULL,
	[PermanenciaDiferidaZona] [numeric](18, 2) NULL,
	[PermanenciaGerente] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BON_Resultados_Recu] PRIMARY KEY CLUSTERED 
(
	[codVend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Resultados-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_Resultados-1](
	[codVend] [int] NOT NULL,
	[Cedula] [numeric](18, 0) NULL,
	[codZona] [int] NULL,
	[codOficina] [int] NULL,
	[TotalVentasRegistradas] [numeric](18, 0) NULL,
	[TotalVentasValidasXasesor] [numeric](18, 0) NULL,
	[TotalValorPlan] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXoficina] [numeric](18, 2) NULL,
	[TotalComisionesValidasXasesor] [numeric](18, 0) NULL,
	[DiasAsistidos] [numeric](18, 0) NULL,
	[Ausentismos] [numeric](18, 0) NULL,
	[AsistenciaDesEquiDir] [numeric](18, 0) NULL,
	[AsistenciaDesEquiGer] [numeric](18, 0) NULL,
	[AsesoresXoficina] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXofic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOfic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOficCE] [numeric](18, 2) NULL,
	[TotalVentasRegistradasXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXoficina] [numeric](18, 0) NULL,
	[TotalVentasXOficina] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXoficina] [numeric](18, 0) NULL,
	[TotalParticipantesCeremoniaXoficina] [numeric](18, 0) NULL,
	[PorcentajeSinCeremoniaXoficina] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[PermanenciaTotalOficina] [numeric](18, 2) NULL,
	[PermanenciaDiferidaOficina] [numeric](18, 2) NULL,
	[PermanenciaDirector] [numeric](18, 0) NULL,
	[TotalVentasRegistradasXZona] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXzona] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXzona] [numeric](18, 0) NULL,
	[TotalVentasXzona] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXzona] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXzona] [numeric](18, 2) NULL,
	[AsesoresXzona] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXzona] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasZona] [numeric](18, 2) NULL,
	[PorcentajeSinCeremoniaXzona] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[PermanenciaTotalZona] [numeric](18, 2) NULL,
	[PermanenciaDiferidaZona] [numeric](18, 2) NULL,
	[PermanenciaGerente] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BON_Resultados-1] PRIMARY KEY CLUSTERED 
(
	[codVend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Resultados-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_Resultados-2](
	[codVend] [int] NOT NULL,
	[Cedula] [numeric](18, 0) NULL,
	[codZona] [int] NULL,
	[codOficina] [int] NULL,
	[TotalVentasRegistradas] [numeric](18, 0) NULL,
	[TotalVentasValidasXasesor] [numeric](18, 0) NULL,
	[TotalValorPlan] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXoficina] [numeric](18, 2) NULL,
	[TotalComisionesValidasXasesor] [numeric](18, 0) NULL,
	[DiasAsistidos] [numeric](18, 0) NULL,
	[Ausentismos] [numeric](18, 0) NULL,
	[AsistenciaDesEquiDir] [numeric](18, 0) NULL,
	[AsistenciaDesEquiGer] [numeric](18, 0) NULL,
	[AsesoresXoficina] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXofic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOfic] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasOficCE] [numeric](18, 2) NULL,
	[TotalVentasRegistradasXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXoficina] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXoficina] [numeric](18, 0) NULL,
	[TotalVentasXOficina] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXoficina] [numeric](18, 0) NULL,
	[TotalParticipantesCeremoniaXoficina] [numeric](18, 0) NULL,
	[PorcentajeSinCeremoniaXoficina] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXoficina] [numeric](18, 0) NULL,
	[PermanenciaTotalOficina] [numeric](18, 2) NULL,
	[PermanenciaDiferidaOficina] [numeric](18, 2) NULL,
	[PermanenciaDirector] [numeric](18, 0) NULL,
	[TotalVentasRegistradasXZona] [numeric](18, 0) NULL,
	[TotalVentasValidasUsadosXzona] [numeric](18, 0) NULL,
	[TotalVentasValidasNuevosXzona] [numeric](18, 0) NULL,
	[TotalVentasXzona] [numeric](18, 0) NULL,
	[TotalVentasAprobadasXzona] [numeric](18, 0) NULL,
	[TotalCumplimientoPresupuestoXzona] [numeric](18, 2) NULL,
	[AsesoresXzona] [numeric](18, 0) NULL,
	[PorcentajeBaseAsesoresCalculoXzona] [numeric](18, 2) NULL,
	[PorcentajeAsesoresConNventasValidasZona] [numeric](18, 2) NULL,
	[PorcentajeSinCeremoniaXzona] [numeric](18, 2) NULL,
	[VentasMaximasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[VentasRegistradasSinCeremoniaXzona] [numeric](18, 0) NULL,
	[PermanenciaTotalZona] [numeric](18, 2) NULL,
	[PermanenciaDiferidaZona] [numeric](18, 2) NULL,
	[PermanenciaGerente] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BON_Resultados-2] PRIMARY KEY CLUSTERED 
(
	[codVend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_ResultadosComisiones]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_ResultadosComisiones](
	[codVend] [int] NOT NULL,
	[Cedula] [numeric](18, 0) NULL,
	[codZona] [int] NULL,
	[codOficina] [int] NULL,
	[TotalVentasRegistradas] [numeric](18, 0) NULL,
	[TotalValorPlan] [numeric](18, 0) NULL,
	[TotalComisionesValidasXVendedor] [numeric](18, 0) NULL,
	[DiasAsistidos] [numeric](18, 0) NULL,
	[Ausentismos] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BON_ResultadosComisiones] PRIMARY KEY CLUSTERED 
(
	[codVend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BON_Retos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Retos](
	[IdBonificacion] [int] IDENTITY(1,1) NOT NULL,
	[CodigoZona] [int] NOT NULL,
	[RetoEnVentas] [int] NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[CodigoGerente] [int] NOT NULL,
	[FechaInicialReto] [datetime] NOT NULL,
	[FechaFinalReto] [datetime] NOT NULL,
	[ValorBonificacion] [numeric](18, 0) NULL,
	[FechaActualiza] [datetime] NOT NULL,
	[UsuarioActualiza] [varchar](50) NOT NULL,
	[IdPlanBonificacion] [int] NOT NULL,
	[VentasValidasUsadosAlcanzadas] [numeric](18, 0) NULL,
	[VentasValidasNuevosAlcanzados] [numeric](18, 0) NULL,
	[TotalVentasValidasAlcanzadas] [numeric](18, 0) NULL,
	[TotalVentasAprobadasAlcanzadas] [numeric](18, 0) NULL,
	[NumeroReto] [int] NULL,
 CONSTRAINT [PK_BON_Retos] PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC,
	[Ano] ASC,
	[CodigoGerente] ASC,
	[FechaInicialReto] ASC,
	[FechaFinalReto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_TipoVendedor]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_TipoVendedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreVenta] [varchar](20) NULL,
 CONSTRAINT [PK_Bon_TipoVenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_TotalBonificaciones]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_TotalBonificaciones](
	[Codvendedor] [int] NOT NULL,
	[Bonificacion1] [numeric](18, 0) NULL,
	[Bonificacion2] [numeric](18, 0) NULL,
	[Bonificacion3] [numeric](18, 0) NULL,
	[Bonificacion4] [numeric](18, 0) NULL,
	[Bonificacion5] [numeric](18, 0) NULL,
	[Bonificacion6] [numeric](18, 0) NULL,
	[Bonificacion7] [numeric](18, 0) NULL,
	[Bonificacion8] [numeric](18, 0) NULL,
	[Bonificacion9] [numeric](18, 0) NULL,
	[Bonificacion10] [numeric](18, 0) NULL,
	[Bonificacion11] [numeric](18, 0) NULL,
	[Bonificacion12] [numeric](18, 0) NULL,
	[Bonificacion13] [numeric](18, 0) NULL,
	[Bonificacion14] [numeric](18, 0) NULL,
	[Bonificacion15] [numeric](18, 0) NULL,
	[Bonificacion16] [numeric](18, 0) NULL,
	[Bonificacion17] [numeric](18, 0) NULL,
	[Bonificacion18] [numeric](18, 0) NULL,
	[Reto1] [numeric](18, 0) NULL,
	[Reto2] [numeric](18, 0) NULL,
	[Reto3] [numeric](18, 0) NULL,
	[Reto4] [numeric](18, 0) NULL,
	[Reto5] [numeric](18, 0) NULL,
	[Reto6] [numeric](18, 0) NULL,
	[Reto7] [numeric](18, 0) NULL,
	[Reto8] [numeric](18, 0) NULL,
	[Reto9] [numeric](18, 0) NULL,
	[Periodo] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[UsuarioActualiza] [varchar](50) NULL,
	[FechaActualiza] [datetime] NULL,
 CONSTRAINT [PK_BON_TotalBonificaciones] PRIMARY KEY CLUSTERED 
(
	[Codvendedor] ASC,
	[Periodo] ASC,
	[Ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_Usuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BON_Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](50) NULL,
	[ID_PERFIL] [int] NULL,
	[HABILITA] [bit] NULL,
 CONSTRAINT [PK_SCO_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BON_ValidadorHistoricoVentasPerfectas]    Script Date: 22/05/2020 9:12:00 a. m. ******/
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
/****** Object:  Table [dbo].[BON_VentasTotales]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BON_VentasTotales](
	[Codigo] [int] NOT NULL,
	[VentasTotales] [numeric](18, 2) NULL,
 CONSTRAINT [PK_BON_VentasTotales] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BON_BonificacionEspecial]  WITH CHECK ADD  CONSTRAINT [FK_PlanBonificacion] FOREIGN KEY([IdPlanBonificacion])
REFERENCES [dbo].[BON_PlanesDeBonificacion] ([ID])
GO
ALTER TABLE [dbo].[BON_BonificacionEspecial] CHECK CONSTRAINT [FK_PlanBonificacion]
GO
ALTER TABLE [dbo].[BON_PlanesDeBonificacion]  WITH CHECK ADD  CONSTRAINT [FK_perfilComercial] FOREIGN KEY([IdRol])
REFERENCES [dbo].[BON_PerfilComercial] ([IdRol])
GO
ALTER TABLE [dbo].[BON_PlanesDeBonificacion] CHECK CONSTRAINT [FK_perfilComercial]
GO
ALTER TABLE [dbo].[BON_Retos]  WITH CHECK ADD  CONSTRAINT [FK_PlanBonificacionRetos] FOREIGN KEY([IdPlanBonificacion])
REFERENCES [dbo].[BON_PlanesDeBonificacion] ([ID])
GO
ALTER TABLE [dbo].[BON_Retos] CHECK CONSTRAINT [FK_PlanBonificacionRetos]
GO
/****** Object:  StoredProcedure [dbo].[BON_ActBonificacionEspecial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ActBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int,
@descripcion varchar(50),
@planesMinimos numeric(18,2),
@planesMaximos numeric(18,2),
@valorBono numeric(18,2),
@Aplica bit,
@usuarioactualiza varchar(50),
@planBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_BonificacionEspecial 
set DescripcionBono=@descripcion, PlanesMinimos=@planesMinimos,	PlanesMaximos=@planesMaximos,ValorBono=@valorBono,
Aplica=@Aplica,FechaActualiza=GETDATE(),UsuarioActualiza=@usuarioactualiza,idPlanBonificacion=@planBonificacion
where id=@id
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ActParametroGeneral]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ActParametroGeneral] 
@Id int,
@Valor varchar(50),
@UsuActualiza varchar(20)
AS
UPDATE  dbo.BON_Parametros SET Valor = @Valor, UsuActualiza = @UsuActualiza, 
FecActualiza = GETDATE() where Id = @Id
return @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[BON_ActPlanBonificacionEspecial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ActPlanBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int,
@Estado bit,
@usuarioActualiza varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_PlanesDeBonificacion
set Estado=@Estado, Usuario=@usuarioActualiza,FechaActualizacion=GETDATE()
where id=@id
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ActPresupuesto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ActPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@periodo int,
@ano int,
@usuarioactualiza varchar(50),
@codZona int,
@codDirector int,
@codGerente int,
@retoSonadores int,
@retoExtraSonadores int,
@bonoAsesorSonadores numeric(18,0),
@bonoAsesorExtraSonadores numeric(18,0),
@bonoDirectoSonadores numeric(18,0),
@bonoDirectorExtraSonadores numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_Presupuesto
set  Presupuesto=@Presupuesto,CodZona=@codZona,CodigoDirector=@codDirector,CodigoGerente=@codGerente,
FechaActualiza=GETDATE(),UsuarioActualiza=@usuarioactualiza,
RetoSonadoresDia=@retoSonadores, RetoExtraSonadoresDia=@retoExtraSonadores,
BonoAsesorSonadoresDia=@bonoAsesorSonadores,BonoAsesorExtraSonadoresDia=@bonoAsesorExtraSonadores,
BonoDirectorSonadoresDia=@bonoDirectoSonadores,BonoDirectorExtraSonadorDia=@bonoDirectorExtraSonadores


where CodigoOficina=@CodOficina and Periodo=@periodo and Ano=@ano
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ActReto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ActReto] 
	-- Add the parameters for the stored procedure here
@CodZona int,
@RetoEnVentas int,
@periodo int,
@ano int,
@codGerente int,
@fechaInicioReto datetime,
@fechaFinReto datetime,
@valorBono numeric (18,0),
@usuarioactualiza varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
update BON_Retos
set  RetoEnVentas=@RetoEnVentas,
FechaActualiza=GETDATE(),
UsuarioActualiza=@usuarioactualiza
,CodigoZona=@CodZona,
ValorBonificacion=@valorBono
where CodigoGerente=@codGerente and Periodo=@periodo 
and Ano=@ano and FechaInicialReto=@fechaInicioReto 
and FechaFinalReto=@fechaFinReto
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ActualizarCampos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ActualizarCampos] 

AS

BEGIN
update  [BON_PamVentasOutsorsing] set MesLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Mes Liquidación')
update  [BON_PamVentasOutsorsing] set AñoLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Año Liquidación')
update  [BON_Liquidacion_Ventas] set MesLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Mes Liquidación')
update  [BON_Liquidacion_Ventas] set AñoLiquidacion = (SELECT Valor FROM [BON_Parametros] WHERE Tipo = 'Liquidacion' and Parametro = 'Año Liquidación')
END 

return @@rowcount


GO
/****** Object:  StoredProcedure [dbo].[BON_ActualizarUsuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ActualizarUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
UPDATE [dbo].[BON_Usuario] SET USUARIO = @Usuario, ID_PERFIL = @IdPerfil, HABILITA = @Habilita WHERE ID = @Id 
END

return @@rowcount
GO
/****** Object:  StoredProcedure [dbo].[BON_BorarAsesores_SQL]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorarAsesores_SQL] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
delete from BON_Asesores
DBCC CHECKIDENT('BON_Asesores',RESEED, 0)--Devuelve el indice de la tabla de asesores a 0 para el Id;
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarBonificacionEspecial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_BonificacionEspecial
where id=@id
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarPresupuesto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Periodo int,
@Ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_Presupuesto
where CodigoOficina=@CodOficina AND Periodo=@Periodo AND Ano=@Ano
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarReto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_BorrarReto] 
	-- Add the parameters for the stored procedure here
@CodGerente int,
@Periodo int,
@Ano int,
@fechaInicioReto datetime,
@fechaFinReto datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
Delete from BON_Retos
where CodigoGerente=@CodGerente AND Periodo=@Periodo AND Ano=@Ano
and FechaInicialReto=@fechaInicioReto and FechaFinalReto=@fechaFinReto
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_BorrarUsuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_BorrarUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
DELETE [dbo].[BON_Usuario]  WHERE ID = @Id 
END

return @@rowcount
GO
/****** Object:  StoredProcedure [dbo].[BON_CalculaReglas]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_CalculaReglas] 
@cantidadReglas int
AS

BEGIN 

declare
@cantidadReglasBonificaciones int=@cantidadReglas, 
@CantidadReglasComisiones int=0

if ((select Valor from BON_Parametros where Id=5)='Si')
begin
set @CantidadReglasComisiones=@CantidadReglasComisiones+1
--print @cantidadReglasComisiones
end
if((select Valor from BON_Parametros where Id=12)='Si')
begin
set @CantidadReglasComisiones=@CantidadReglasComisiones+1
end
select @CantidadReglasComisiones
  update BON_PamVentasOutsorsing set ComisionValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_PamVentasOutsorsing]
 where  
 ([NoExclucion]+ [VentaInscripcion]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]+@CantidadReglasComisiones) = @cantidadReglasBonificaciones+1)
 -- + [Prospecto] Usuario no solicita esta regla en la validacion
 -- +  [Asistencia]se retira la asistencia, ya que no es obligatoria en todas
 --+ [Permanencia] se retira ya que no pertenece a la venta valida y solo sirve para saber si se le paga o no

  update BON_Liquidacion_Ventas set VentaValida=1 
 where Contrato in (SELECT Contrato 
   FROM [dbo].[BON_Liquidacion_Ventas]
 where  
 ([ValidaPlan]+ [Venta]+ [LlamadaBV]+ [Asamblea]+ [EstadoSICO]+ [Prospecto]) = @cantidadReglasBonificaciones)-- +  [Asistencia]se retira la asistencia, ya que no es obligatoria en todas
 --+ [Permanencia] se retira ya que no pertenece a la venta valida y solo sirve para saber si se le paga o no
 
 return @@RowCount

END 


GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CalcularVentasTotales]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	---Especial x Cantidad de Planes y por Monto

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2 or @idPlanBonificacion=9)
	begin

		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=9 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
		from BON_Liquidacion_Ventas
			where ventaValida=1 
			group by CodVendedor


			if (@idPlanBonificacion=1 or @idPlanBonificacion=9)
			begin
				update res
				set res.TotalVentasValidasXasesor=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalVentasValidasXasesor from BON_Resultados
				where TotalVentasValidasXasesor>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalVentasValidasXasesor<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
				end

				else if (@idPlanBonificacion=2)
				begin
				update res
				set res.TotalValorPlan=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
				
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalValorPlan from BON_Resultados
				where TotalValorPlan>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalValorPlan<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
				 end

		end



---------Calcula en base al presupuesto, Bono Grupal Asesor - Director , Bono por desarollo de equipos Asesor - Director 
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5 or @idPlanBonificacion=10 or @idPlanBonificacion=11 or @idPlanBonificacion=12)
	 begin
	 --- Calcula el cumplimiento de presupuesto x oficina
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where pre.Periodo=liv.MesLiquidacion
			and pre.Ano=liv.AñoLiquidacion
			and pre.Presupuesto>0
			group by liv.CodOficina	,pre.Presupuesto 
	
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=isnull(bvt.VentasTotales,100)
	from BON_Resultados as res 
	inner join BON_Liquidacion_Ventas as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	left join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3 or @idPlanBonificacion=10)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4 or @idPlanBonificacion=12)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from BON_Resultados
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5 or @idPlanBonificacion=11)
		begin

		---Calcula el total de ventas validas por vendedor
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from BON_Resultados as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales

		select OficCodigo, COUNT(OficCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=18)
					 
						union
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=18)
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and VendFecRet>=(select  Valor  from BON_Parametros where Id=6)

						) as t1

						group by OficCodigo




			update res
			set res.AsesoresXoficina=bvt.VentasTotales
			 from BON_Resultados as res 
			 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

			 ---Control de porcentaje Asesores por oficina
			 delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as res
				where AsistenciaDesEquiDir=1
				) as T1 
				where T1.AsesoresXoficina>0
				group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		if  (@idPlanBonificacion=5)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and AsistenciaDesEquiDir=1
			
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOfic=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOfic from BON_Resultados
		where 
	  	PorcentajeAsesoresConNventasValidasOfic>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOfic<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		

		end

		else if  (@idPlanBonificacion=11)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric) as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=30) -- Cantidad de Ventas Necesarias para aplicar Canal Especializado
				and AsistenciaDesEquiDir=1
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOficCE=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOficCE from BON_Resultados
		where 
	  	PorcentajeAsesoresConNventasValidasOficCE>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOficCE<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)		

		end
			
	 end
  end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6 or @idPlanBonificacion=17)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)	
		where VentaValida=1 
		and CodPlan=4 
	--	and AsistenciaDesEquiDir=1
		group by liv.CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas as liv
		inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
		where VentaValida=1 and CodPlan!=4 
		--and res.AsistenciaDesEquiDir=1
		group by liv.CodOficina
		
		update res set res.TotalVentasValidasNuevosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)


	delete BON_VentasTotales
	insert BON_VentasTotales
		select distinct codOficina,TotalVentasValidasNuevosXoficina+TotalVentasValidasUsadosXoficina as TotalVentaOficina
		from BON_Resultados

		update res set res.TotalVentasXOficina=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

	----Calculas las Ventas ValidasAprobadas
	delete from BON_VentasTotales
	insert into BON_VentasTotales
				select distinct res.codOficina
				 ,case
				 when   res.TotalVentasValidasUsadosXoficina>
				 res.TotalVentasXOficina *(Select valor from BON_Parametros where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXOficina*(Select valor from BON_Parametros where Id=13)/100)
				  +TotalVentasValidasNuevosXoficina
				 else res.TotalVentasXOficina end  as VentasTotales
				 from BON_Resultados as res

		update res set res.TotalVentasAprobadasXoficina=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalVentasAprobadasXoficina from BON_Resultados
		 where 
		TotalVentasAprobadasXoficina>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and TotalVentasAprobadasXoficina<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)

	end 

			----- Comisiones Asesor
	else if(@idPlanBonificacion=13)
	begin
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ComisionValida) 
		as VentasTotales
		from BON_PamVentasOutsorsing
			where ComisionValida=1 
			group by CodVendedor

			update res
				set res.TotalComisionesValidasXVendedor=bvt.VentasTotales
				from BON_ResultadosComisiones as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)

			delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ValorPlan) 
		as ValorPlan
		from BON_PamVentasOutsorsing
			where ComisionValida=1 
			group by CodVendedor

			update res
				set res.TotalValorPlan=bvt.VentasTotales
				from BON_ResultadosComisiones as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalComisionesValidasXvendedor from BON_ResultadosComisiones
				where TotalComisionesValidasXvendedor>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and TotalComisionesValidasXvendedor<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)


		end
		----

	-------------------
	-----------Comisiones Director
	else if (@idPlanBonificacion=16)
	begin



	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de montos de directores
	select CodigoDirector,CantidadVentasValidas from(
		Select  liv.CodigoDirector
		,Sum(liv.ValorPlan) as 'TotalPlanes'
		,Sum(ComisionValida) as 'CantidadVentasValidas' 
		from BON_PamVentasOutsorsing as liv
		where ComisionValida=1
		group by liv.CodigoDirector
		) as t1
		where
		t1.CantidadVentasValidas >=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
		and t1.CantidadVentasValidas<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
		
	end 
	-----------------------
	
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas where ventaValida=1 
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from BON_Resultados as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
			--and AsistenciaDesEquiGer=1
			where VentaValida=1 
			and CodPlan=4 
			group by liv.CodZona
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas as liv
			inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
			where VentaValida=1 and CodPlan!=4 
		--	and AsistenciaDesEquiGer=1
			group by liv.CodZona
		
		update res set res.TotalVentasValidasNuevosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


		---Calcula las ventas totales
		delete BON_VentasTotales
		insert BON_VentasTotales
			select distinct codZona,TotalVentasValidasNuevosXzona+TotalVentasValidasUsadosXzona as TotalVentaZona
			from BON_Resultados

		update res set res.TotalVentasXzona=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		----Calculas las Ventas ValidasAprobadas
		delete from BON_VentasTotales
		insert into BON_VentasTotales
				select distinct res.codZona
				 ,case
				 when   res.TotalVentasValidasUsadosXzona>
				 res.TotalVentasXzona *(Select valor from BON_Parametros where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXzona*(Select valor from BON_Parametros where Id=13)/100)
				  +TotalVentasValidasNuevosXzona
				 else res.TotalVentasXzona end  as VentasTotales
				 from BON_Resultados as res

		update res set res.TotalVentasAprobadasXzona=bvt.VentasTotales from BON_Resultados as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		---Calculo la Cuota del presupuesto
		delete from BON_VentasTotales
		insert into BON_VentasTotales
			select distinct res.codZona,TotalVentasAprobadasXzona/pxz.Presupuesto*100 as cuotaPresupuesto 
			from BON_Resultados as res
			inner join BON_PresupuestoXzona as pxz on(pxz.CodZona=res.codZona)
			and pxz.Presupuesto>0

		update res set res.TotalCumplimientoPresupuestoXzona=isnull(bvt.VentasTotales,100) from BON_Resultados as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

	



	
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona

				delete BON_VentasTotales
				insert BON_VentasTotales			
				select RegiCodigo, COUNT(RegiCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=29)
					 
						union
						select distinct VendIdeNro, RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from BON_Parametros where id=29)
						and VendFecIng<=(select  Valor  from BON_Parametros where Id=7)
						and VendFecRet>=(select  Valor  from BON_Parametros where Id=6)

						) as t1

						group by RegiCodigo

				

				update res
				set res.AsesoresXzona=bvt.VentasTotales
				from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)




				--Control de porcentaje de asesores detectados
				delete BON_VentasTotales
				insert BON_VentasTotales
							select T1.codZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_Resultados as res
						where res.AsistenciaDesEquiGer=1
						) as T1 
						where T1.AsesoresXzona>0
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)



				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select vde.codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by vde.codZona  order by vde.codZona desc) as 'rn'	 from  BON_Resultados as vde

						where vde.TotalVentasValidasXasesor>=(Select Valor from BON_Parametros where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and vde.AsistenciaDesEquiGer=1	
						
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
			
				
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from BON_Resultados as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

			

				---Retorna las Zonas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codZona,PorcentajeAsesoresConNventasValidasZona from BON_Resultados
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)


				  end
				  
			 
			


			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then 0
					else
					Sum(ventaValida) end 
					as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)
					where VentaValida=1 
				--	and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and CodPlan=4 -- Usados
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<dateadd(d,1,ret.FechaFinalReto)-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales

					Select liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then ret.RetoEnVentas
					else
					Sum(ventaValida) 
					end as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas as liv
					inner join BON_Resultados as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)			
					where VentaValida=1
					 and CodPlan!=4 -- Nuevos
					--and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<dateadd(d,1,ret.FechaFinalReto)-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona,ret.RetoEnVentas
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as ret 
					where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  ret.CodigoZona
						 ,case
						 when   ret.VentasValidasUsadosAlcanzadas>
						 ret.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100  then 	 
						 CEILING(ret.TotalVentasValidasAlcanzadas*(Select valor from BON_Parametros where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else ret.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as ret
						 where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion


				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join BON_Liquidacion_Ventas as lib on (lib.codZona=ret.CodigoZona)
					
					where IdBonificacion=@idBonificacion
					and ret.Periodo=lib.MesLiquidacion
					and ret.Ano=lib.AñoLiquidacion
					and TotalVentasAprobadasAlcanzadas>=ret.RetoEnVentas -- Reto a Cumplir		
				
			  end	 
			
	end 

	else if (@idPlanBonificacion=14)
	begin



	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct res.codVend,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoAsesorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoAsesorExtraSonadoresDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	else if (@idPlanBonificacion=15)
	begin


	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct pre.CodigoOficina,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoDirectorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoDirectorExtraSonadorDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	--- Bono Gerente  Permanencia de Clientes
	
	else if (@idPlanBonificacion=18)
	begin
	
	delete BON_VentasTotales
	insert BON_VentasTotales

	select distinct codZona,PermanenciaTotalZona from BON_Resultados
	where PermanenciaTotalZona>=(select PlanesMinimos from BON_BonificacionEspecial where  ID=@idBonificacion)
	and PermanenciaTotalZona<=(select PlanesMaximos from BON_BonificacionEspecial where  ID=@idBonificacion)
			
					
	end

 
 /*declare @idplanBonificacion int=8,
			@idbonificacion int=309*/
	
return @@rowcount

END

GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CalcularVentasTotales_Recu]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	---Especial x Cantidad de Planes y por Monto

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2 or @idPlanBonificacion=9)
	begin

		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=9 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
		from BON_Liquidacion_Ventas_Recu
			where ventaValida=1 
			group by CodVendedor


			if (@idPlanBonificacion=1 or @idPlanBonificacion=9)
			begin
				update res
				set res.TotalVentasValidasXasesor=bvt.VentasTotales
				from BON_Resultados_Recu as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalVentasValidasXasesor from BON_Resultados_Recu
				where TotalVentasValidasXasesor>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
					and TotalVentasValidasXasesor<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
				end

				else if (@idPlanBonificacion=2)
				begin
				update res
				set res.TotalValorPlan=bvt.VentasTotales
				from BON_Resultados_Recu as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
				
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalValorPlan from BON_Resultados_Recu
				where TotalValorPlan>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
					and TotalValorPlan<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
				 end

		end



---------Calcula en base al presupuesto, Bono Grupal Asesor - Director , Bono por desarollo de equipos Asesor - Director 
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5 or @idPlanBonificacion=10 or @idPlanBonificacion=11 or @idPlanBonificacion=12)
	 begin
	 --- Calcula el cumplimiento de presupuesto x oficina
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from BON_Liquidacion_Ventas_Recu as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where pre.Periodo=liv.MesLiquidacion
			and pre.Ano=liv.AñoLiquidacion
			and pre.Presupuesto>0
			group by liv.CodOficina	,pre.Presupuesto 
	
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=isnull(bvt.VentasTotales,100)
	from BON_Resultados_Recu as res 
	inner join BON_Liquidacion_Ventas_Recu as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	left join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3 or @idPlanBonificacion=10)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from BON_Resultados_Recu
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4 or @idPlanBonificacion=12)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from BON_Resultados_Recu
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5 or @idPlanBonificacion=11)
		begin

		---Calcula el total de ventas validas por vendedor
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas_Recu where ventaValida=1 
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from BON_Resultados_Recu as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales

		select OficCodigo, COUNT(OficCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
					 
						union
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by OficCodigo




			update res
			set res.AsesoresXoficina=bvt.VentasTotales
			 from BON_Resultados_Recu as res 
			 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

			 ---Control de porcentaje Asesores por oficina
			 delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados_Recu as res
				where AsistenciaDesEquiDir=1
				) as T1 
				where T1.AsesoresXoficina>0
				group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		if  (@idPlanBonificacion=5)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados_Recu as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and AsistenciaDesEquiDir=1
			
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOfic=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOfic from BON_Resultados_Recu
		where 
	  	PorcentajeAsesoresConNventasValidasOfic>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOfic<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)		

		end

		else if  (@idPlanBonificacion=11)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric) as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  BON_Resultados_Recu as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=30) -- Cantidad de Ventas Necesarias para aplicar Canal Especializado
				and AsistenciaDesEquiDir=1
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOficCE=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOficCE from BON_Resultados_Recu
		where 
	  	PorcentajeAsesoresConNventasValidasOficCE>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOficCE<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)		

		end
			
	 end
  end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6 or @idPlanBonificacion=17)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas_Recu as liv
		inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)	
		where VentaValida=1 
		and CodPlan=4 
		and AsistenciaDesEquiDir=1
		group by liv.CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas_Recu as liv
		inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)
		where VentaValida=1 and CodPlan!=4 and res.AsistenciaDesEquiDir=1
		group by liv.CodOficina
		
		update res set res.TotalVentasValidasNuevosXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)


	delete BON_VentasTotales
	insert BON_VentasTotales
		select distinct codOficina,TotalVentasValidasNuevosXoficina+TotalVentasValidasUsadosXoficina as TotalVentaOficina
		from BON_Resultados_Recu

		update res set res.TotalVentasXOficina=bvt.VentasTotales from BON_Resultados_Recu as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

	----Calculas las Ventas ValidasAprobadas
	delete from BON_VentasTotales
	insert into BON_VentasTotales
				select distinct res.codOficina
				 ,case
				 when   res.TotalVentasValidasUsadosXoficina>
				 res.TotalVentasXOficina *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXOficina*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXoficina
				 else res.TotalVentasXOficina end  as VentasTotales
				 from BON_Resultados_Recu as res

		update res set res.TotalVentasAprobadasXoficina=bvt.VentasTotales from BON_Resultados_Recu as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalVentasAprobadasXoficina from BON_Resultados_Recu
		 where 
		TotalVentasAprobadasXoficina>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and TotalVentasAprobadasXoficina<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)

	end 
	/*
			----- Comisiones Asesor
	else if(@idPlanBonificacion=13)
	begin
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ComisionValida) 
		as VentasTotales
		from BON_Liquidacion_Ventas_Recu
			where ComisionValida=1 
			group by CodVendedor

				update res
				set res.TotalComisionesValidasXasesor=bvt.VentasTotales
				from BON_Resultados_Recu as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalComisionesValidasXasesor from BON_Resultados_Recu
				where TotalComisionesValidasXasesor>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
					and TotalComisionesValidasXasesor<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)


		end
		----
		*/
	-------------------
	/*
	-----------Comisiones Director
	else if (@idPlanBonificacion=16)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(VentaValida) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas_Recu as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalComisionesValidasXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ValorPlan) as 'CantidadVentasValidas' 
		from BON_Liquidacion_Ventas_Recu as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalPlanesComisionXoficina=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalComisionesValidasXoficina from BON_Resultados_Recu
		 where 
		TotalComisionesValidasXoficina>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
		and TotalComisionesValidasXoficina<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)

	end 
	*/
	-----------------------

	/*
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from BON_Liquidacion_Ventas_Recu where ventaValida=1 
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from BON_Resultados_Recu as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas_Recu as liv
			inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)
			and AsistenciaDesEquiGer=1
			where VentaValida=1 
			and CodPlan=4 
			group by liv.CodZona
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from BON_Liquidacion_Ventas_Recu as liv
			inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)
			where VentaValida=1 and CodPlan!=4 
			and AsistenciaDesEquiGer=1
			group by liv.CodZona
		
		update res set res.TotalVentasValidasNuevosXzona=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


		---Calcula las ventas totales
		delete BON_VentasTotales
		insert BON_VentasTotales
			select distinct codZona,TotalVentasValidasNuevosXzona+TotalVentasValidasUsadosXzona as TotalVentaZona
			from BON_Resultados_Recu

		update res set res.TotalVentasXzona=bvt.VentasTotales from BON_Resultados_Recu as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		----Calculas las Ventas ValidasAprobadas
		delete from BON_VentasTotales
		insert into BON_VentasTotales
				select distinct res.codZona
				 ,case
				 when   res.TotalVentasValidasUsadosXzona>
				 res.TotalVentasXzona *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXzona*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXzona
				 else res.TotalVentasXzona end  as VentasTotales
				 from BON_Resultados_Recu as res

		update res set res.TotalVentasAprobadasXzona=bvt.VentasTotales from BON_Resultados_Recu as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		---Calculo la Cuota del presupuesto
		delete from BON_VentasTotales
		insert into BON_VentasTotales
			select distinct res.codZona,TotalVentasAprobadasXzona/pxz.Presupuesto*100 as cuotaPresupuesto 
			from BON_Resultados_Recu as res
			inner join BON_PresupuestoXzona as pxz on(pxz.CodZona=res.codZona)
			and pxz.Presupuesto>0

		update res set res.TotalCumplimientoPresupuestoXzona=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

	



	
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona

				delete BON_VentasTotales
				insert BON_VentasTotales			
				select RegiCodigo, COUNT(RegiCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
					 
						union
						select distinct VendIdeNro, RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by RegiCodigo

				

				update res
				set res.AsesoresXzona=bvt.VentasTotales
				from BON_Resultados_Recu as res 
				inner join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)




				--Control de porcentaje de asesores detectados
				delete BON_VentasTotales
				insert BON_VentasTotales
							select T1.codZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  BON_Resultados_Recu as res
						where res.AsistenciaDesEquiGer=1
						) as T1 
						where T1.AsesoresXzona>0
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)



				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select vde.codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by vde.codZona  order by vde.codZona desc) as 'rn'	 from  BON_Resultados_Recu as vde

						where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and vde.AsistenciaDesEquiGer=1	
						
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
			
				
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from BON_Resultados_Recu as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

			

				---Retorna las Zonas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codZona,PorcentajeAsesoresConNventasValidasZona from BON_Resultados_Recu
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)


				  end
				  
			 
			


			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then 0
					else
					Sum(ventaValida) end 
					as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas_Recu as liv
					inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)
					where VentaValida=1 
					and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and CodPlan=4 -- Usados
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales

					Select liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then ret.RetoEnVentas
					else
					Sum(ventaValida) 
					end as 'CantidadVentasValidas' 
					from BON_Liquidacion_Ventas_Recu as liv
					inner join BON_Resultados_Recu as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)			
					where VentaValida=1
					 and CodPlan!=4 -- Nuevos
					 and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona,ret.RetoEnVentas
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as ret 
					where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  ret.CodigoZona
						 ,case
						 when   ret.VentasValidasUsadosAlcanzadas>
						 ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
						 CEILING(ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else ret.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as ret
						 where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion


				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join BON_Liquidacion_Ventas_Recu as lib on (lib.codZona=ret.CodigoZona)
					
					where IdBonificacion=@idBonificacion
					and ret.Periodo=lib.MesLiquidacion
					and ret.Ano=lib.AñoLiquidacion
					and TotalVentasAprobadasAlcanzadas>=ret.RetoEnVentas -- Reto a Cumplir		
				
			  end	 
			
	end 
	*/
	else if (@idPlanBonificacion=14)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from BON_Liquidacion_Ventas_Recu as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from BON_Resultados_Recu as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct res.codVend,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoAsesorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoAsesorExtraSonadoresDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados_Recu as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas_Recu as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	else if (@idPlanBonificacion=15)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from BON_Liquidacion_Ventas_Recu as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from BON_Resultados_Recu as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct pre.CodigoOficina,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoDirectorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoDirectorExtraSonadorDia
			else
			0
			end as bonoAsesorCeremonia 
			from BON_Resultados_Recu as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join BON_Liquidacion_Ventas_Recu as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end
	/*
	--- Bono Gerente  Permanencia de Clientes
	
	else 
	
	if (@idPlanBonificacion=18)
	begin
	
	delete BON_VentasTotales
	insert BON_VentasTotales

	select distinct codZona,PermanenciaTotalZona from BON_Resultados_Recu
	where PermanenciaTotalZona>=(select PlanesMinimos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
	and PermanenciaTotalZona<=(select PlanesMaximos from BON_BonificacionEspecial_Recu where  ID=@idBonificacion)
			
					
	end

 */
 /*declare @idplanBonificacion int=8,
			@idbonificacion int=309*/
	
return @@rowcount

END

GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CalcularVentasTotales-1]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	---Especial x Cantidad de Planes y por Monto

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2 or @idPlanBonificacion=9)
	begin

		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=9 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
		from [BON_Liquidacion_Ventas-1]
			where ventaValida=1 
			group by CodVendedor


			if (@idPlanBonificacion=1 or @idPlanBonificacion=9)
			begin
				update res
				set res.TotalVentasValidasXasesor=bvt.VentasTotales
				from [BON_Resultados-1] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalVentasValidasXasesor from [BON_Resultados-1]
				where TotalVentasValidasXasesor>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
					and TotalVentasValidasXasesor<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
				end

				else if (@idPlanBonificacion=2)
				begin
				update res
				set res.TotalValorPlan=bvt.VentasTotales
				from [BON_Resultados-1] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
				
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalValorPlan from [BON_Resultados-1]
				where TotalValorPlan>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
					and TotalValorPlan<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
				 end

		end



---------Calcula en base al presupuesto, Bono Grupal Asesor - Director , Bono por desarollo de equipos Asesor - Director 
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5 or @idPlanBonificacion=10 or @idPlanBonificacion=11 or @idPlanBonificacion=12)
	 begin
	 --- Calcula el cumplimiento de presupuesto x oficina
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from [BON_Liquidacion_Ventas-1] as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where pre.Periodo=liv.MesLiquidacion
			and pre.Ano=liv.AñoLiquidacion
			and pre.Presupuesto>0
			group by liv.CodOficina	,pre.Presupuesto 
	
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=isnull(bvt.VentasTotales,100)
	from [BON_Resultados-1] as res 
	inner join [BON_Liquidacion_Ventas-1] as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	left join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3 or @idPlanBonificacion=10)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from [BON_Resultados-1]
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4 or @idPlanBonificacion=12)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from [BON_Resultados-1]
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5 or @idPlanBonificacion=11)
		begin

		---Calcula el total de ventas validas por vendedor
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from [BON_Liquidacion_Ventas-1] where ventaValida=1 
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from [BON_Resultados-1] as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales

		select OficCodigo, COUNT(OficCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
					 
						union
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by OficCodigo




			update res
			set res.AsesoresXoficina=bvt.VentasTotales
			 from [BON_Resultados-1] as res 
			 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

			 ---Control de porcentaje Asesores por oficina
			 delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-1] as res
				where AsistenciaDesEquiDir=1
				) as T1 
				where T1.AsesoresXoficina>0
				group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		if  (@idPlanBonificacion=5)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-1] as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and AsistenciaDesEquiDir=1
			
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOfic=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOfic from [BON_Resultados-1]
		where 
	  	PorcentajeAsesoresConNventasValidasOfic>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOfic<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)		

		end

		else if  (@idPlanBonificacion=11)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric) as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-1] as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=30) -- Cantidad de Ventas Necesarias para aplicar Canal Especializado
				and AsistenciaDesEquiDir=1
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOficCE=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOficCE from [BON_Resultados-1]
		where 
	  	PorcentajeAsesoresConNventasValidasOficCE>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOficCE<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)		

		end
			
	 end
  end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6 or @idPlanBonificacion=17)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-1] as liv
		inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)	
		where VentaValida=1 
		and CodPlan=4 
		and AsistenciaDesEquiDir=1
		group by liv.CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-1] as liv
		inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)
		where VentaValida=1 and CodPlan!=4 and res.AsistenciaDesEquiDir=1
		group by liv.CodOficina
		
		update res set res.TotalVentasValidasNuevosXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)


	delete BON_VentasTotales
	insert BON_VentasTotales
		select distinct codOficina,TotalVentasValidasNuevosXoficina+TotalVentasValidasUsadosXoficina as TotalVentaOficina
		from [BON_Resultados-1]

		update res set res.TotalVentasXOficina=bvt.VentasTotales from [BON_Resultados-1] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

	----Calculas las Ventas ValidasAprobadas
	delete from BON_VentasTotales
	insert into BON_VentasTotales
				select distinct res.codOficina
				 ,case
				 when   res.TotalVentasValidasUsadosXoficina>
				 res.TotalVentasXOficina *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXOficina*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXoficina
				 else res.TotalVentasXOficina end  as VentasTotales
				 from [BON_Resultados-1] as res

		update res set res.TotalVentasAprobadasXoficina=bvt.VentasTotales from [BON_Resultados-1] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalVentasAprobadasXoficina from [BON_Resultados-1]
		 where 
		TotalVentasAprobadasXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and TotalVentasAprobadasXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)

	end 
	
			----- Comisiones Asesor
	else if(@idPlanBonificacion=13)
	begin
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ComisionValida) 
		as VentasTotales
		from [BON_Liquidacion_Ventas-1]
			where ComisionValida=1 
			group by CodVendedor

				update res
				set res.TotalComisionesValidasXasesor=bvt.VentasTotales
				from [BON_Resultados-1] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalComisionesValidasXasesor from [BON_Resultados-1]
				where TotalComisionesValidasXasesor>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
					and TotalComisionesValidasXasesor<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)


		end
		----
		
	-------------------
	
	-----------Comisiones Director
	else if (@idPlanBonificacion=16)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(VentaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-1] as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalComisionesValidasXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ValorPlan) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-1] as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalPlanesComisionXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalComisionesValidasXoficina from [BON_Resultados-1]
		 where 
		TotalComisionesValidasXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
		and TotalComisionesValidasXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)

	end 
	
	-----------------------

	
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from [BON_Liquidacion_Ventas-1] where ventaValida=1 
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from [BON_Resultados-1] as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from [BON_Liquidacion_Ventas-1] as liv
			inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)
			and AsistenciaDesEquiGer=1
			where VentaValida=1 
			and CodPlan=4 
			group by liv.CodZona
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from [BON_Liquidacion_Ventas-1] as liv
			inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)
			where VentaValida=1 and CodPlan!=4 
			and AsistenciaDesEquiGer=1
			group by liv.CodZona
		
		update res set res.TotalVentasValidasNuevosXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


		---Calcula las ventas totales
		delete BON_VentasTotales
		insert BON_VentasTotales
			select distinct codZona,TotalVentasValidasNuevosXzona+TotalVentasValidasUsadosXzona as TotalVentaZona
			from [BON_Resultados-1]

		update res set res.TotalVentasXzona=bvt.VentasTotales from [BON_Resultados-1] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		----Calculas las Ventas ValidasAprobadas
		delete from BON_VentasTotales
		insert into BON_VentasTotales
				select distinct res.codZona
				 ,case
				 when   res.TotalVentasValidasUsadosXzona>
				 res.TotalVentasXzona *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXzona*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXzona
				 else res.TotalVentasXzona end  as VentasTotales
				 from [BON_Resultados-1] as res

		update res set res.TotalVentasAprobadasXzona=bvt.VentasTotales from [BON_Resultados-1] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		---Calculo la Cuota del presupuesto
		delete from BON_VentasTotales
		insert into BON_VentasTotales
			select distinct res.codZona,TotalVentasAprobadasXzona/pxz.Presupuesto*100 as cuotaPresupuesto 
			from [BON_Resultados-1] as res
			inner join BON_PresupuestoXzona as pxz on(pxz.CodZona=res.codZona)
			and pxz.Presupuesto>0

		update res set res.TotalCumplimientoPresupuestoXzona=isnull(bvt.VentasTotales,100) from [BON_Resultados-1] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

	



	
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona

				delete BON_VentasTotales
				insert BON_VentasTotales			
				select RegiCodigo, COUNT(RegiCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
					 
						union
						select distinct VendIdeNro, RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by RegiCodigo

				

				update res
				set res.AsesoresXzona=bvt.VentasTotales
				from [BON_Resultados-1] as res 
				inner join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)




				--Control de porcentaje de asesores detectados
				delete BON_VentasTotales
				insert BON_VentasTotales
							select T1.codZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  [BON_Resultados-1] as res
						where res.AsistenciaDesEquiGer=1
						) as T1 
						where T1.AsesoresXzona>0
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)



				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select vde.codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by vde.codZona  order by vde.codZona desc) as 'rn'	 from  [BON_Resultados-1] as vde

						where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and vde.AsistenciaDesEquiGer=1	
						
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
			
				
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from [BON_Resultados-1] as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

			

				---Retorna las Zonas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codZona,PorcentajeAsesoresConNventasValidasZona from [BON_Resultados-1]
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)


				  end
				  
			 
			


			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then 0
					else
					Sum(ventaValida) end 
					as 'CantidadVentasValidas' 
					from [BON_Liquidacion_Ventas-1] as liv
					inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)
					where VentaValida=1 
					and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and CodPlan=4 -- Usados
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales

					Select liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then ret.RetoEnVentas
					else
					Sum(ventaValida) 
					end as 'CantidadVentasValidas' 
					from [BON_Liquidacion_Ventas-1] as liv
					inner join [BON_Resultados-1] as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)			
					where VentaValida=1
					 and CodPlan!=4 -- Nuevos
					 and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona,ret.RetoEnVentas
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as ret 
					where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  ret.CodigoZona
						 ,case
						 when   ret.VentasValidasUsadosAlcanzadas>
						 ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
						 CEILING(ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else ret.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as ret
						 where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion


				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join [BON_Liquidacion_Ventas-1] as lib on (lib.codZona=ret.CodigoZona)
					
					where IdBonificacion=@idBonificacion
					and ret.Periodo=lib.MesLiquidacion
					and ret.Ano=lib.AñoLiquidacion
					and TotalVentasAprobadasAlcanzadas>=ret.RetoEnVentas -- Reto a Cumplir		
				
			  end	 
			
	end 

	else if (@idPlanBonificacion=14)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from [BON_Liquidacion_Ventas-1] as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from [BON_Resultados-1] as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct res.codVend,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoAsesorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoAsesorExtraSonadoresDia
			else
			0
			end as bonoAsesorCeremonia 
			from [BON_Resultados-1] as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join [BON_Liquidacion_Ventas-1] as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	else if (@idPlanBonificacion=15)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from [BON_Liquidacion_Ventas-1] as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from [BON_Resultados-1] as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct pre.CodigoOficina,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoDirectorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoDirectorExtraSonadorDia
			else
			0
			end as bonoAsesorCeremonia 
			from [BON_Resultados-1] as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join [BON_Liquidacion_Ventas-1] as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end
	
	--- Bono Gerente  Permanencia de Clientes
	
	else 
	
	if (@idPlanBonificacion=18)
	begin
	
	delete BON_VentasTotales
	insert BON_VentasTotales

	select distinct codZona,PermanenciaTotalZona from [BON_Resultados-1]
	where PermanenciaTotalZona>=(select PlanesMinimos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
	and PermanenciaTotalZona<=(select PlanesMaximos from [BON_BonificacionEspecial-1] where  ID=@idBonificacion)
			
					
	end

 
 /*declare @idplanBonificacion int=8,
			@idbonificacion int=309*/
	
return @@rowcount

END

GO
/****** Object:  StoredProcedure [dbo].[BON_CalcularVentasTotales-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CalcularVentasTotales-2]
	-- Add the parameters for the stored procedure here
	@idBonificacion int,
	@idPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	---Especial x Cantidad de Planes y por Monto

	if(@idPlanBonificacion=1 or @idPlanBonificacion=2 or @idPlanBonificacion=9)
	begin

		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		case
		when @idPlanBonificacion=1 
		then SUM(VentaValida) 
		when @idPlanBonificacion=9 
		then SUM(VentaValida) 
		when @idPlanBonificacion=2 
		then SUM(ValorPlan) 
		end as VentasTotales
		from [BON_Liquidacion_Ventas-2]
			where ventaValida=1 
			group by CodVendedor


			if (@idPlanBonificacion=1 or @idPlanBonificacion=9)
			begin
				update res
				set res.TotalVentasValidasXasesor=bvt.VentasTotales
				from [BON_Resultados-2] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalVentasValidasXasesor from [BON_Resultados-2]
				where TotalVentasValidasXasesor>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
					and TotalVentasValidasXasesor<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
				end

				else if (@idPlanBonificacion=2)
				begin
				update res
				set res.TotalValorPlan=bvt.VentasTotales
				from [BON_Resultados-2] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
				
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalValorPlan from [BON_Resultados-2]
				where TotalValorPlan>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
					and TotalValorPlan<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
				 end

		end



---------Calcula en base al presupuesto, Bono Grupal Asesor - Director , Bono por desarollo de equipos Asesor - Director 
	 else if(@idPlanBonificacion=3 or @idPlanBonificacion=4 or @idPlanBonificacion=5 or @idPlanBonificacion=10 or @idPlanBonificacion=11 or @idPlanBonificacion=12)
	 begin
	 --- Calcula el cumplimiento de presupuesto x oficina
	 delete from BON_VentasTotales	
	  insert Into BON_VentasTotales
			select 
			liv.CodOficina ,
			cast(SUM(liv.VentaValida)AS numeric)*100/cast(pre.Presupuesto As numeric) as VentasTotales 
			from [BON_Liquidacion_Ventas-2] as liv
			inner join BON_Presupuesto as pre on (pre.CodigoOficina=liv.CodOficina)-- solo oficinas que estan en el presupuesto
			where pre.Periodo=liv.MesLiquidacion
			and pre.Ano=liv.AñoLiquidacion
			and pre.Presupuesto>0
			group by liv.CodOficina	,pre.Presupuesto 
	
		
	update res
	set res.TotalCumplimientoPresupuestoXoficina=isnull(bvt.VentasTotales,100)
	from [BON_Resultados-2] as res 
	inner join [BON_Liquidacion_Ventas-2] as liv on (res.codVend=liv.CodVendedor) -- obtener la zona y la oficina
	left join BON_VentasTotales as bvt on (bvt.Codigo=liv.CodOficina)	
	
		if (@idPlanBonificacion=3 or @idPlanBonificacion=10)
		begin
		
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select codVend,TotalCumplimientoPresupuestoXoficina from [BON_Resultados-2]
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		end

		else if (@idPlanBonificacion=4 or @idPlanBonificacion=12)
		begin
		delete  from BON_VentasTotales
		 insert into BON_VentasTotales
		 select distinct codOficina,TotalCumplimientoPresupuestoXoficina from [BON_Resultados-2]
		 where TotalCumplimientoPresupuestoXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and TotalCumplimientoPresupuestoXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)		
		end

		---------Calcula en base al presupuesto parametrizado para desarrollo de equipos
		else if (@idPlanBonificacion=5 or @idPlanBonificacion=11)
		begin

		---Calcula el total de ventas validas por vendedor
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from [BON_Liquidacion_Ventas-2] where ventaValida=1 
			group by CodVendedor


	update res
	set res.TotalVentasValidasXasesor=bvt.VentasTotales
	 from [BON_Resultados-2] as res 
	 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)



	 --Calcula la cantidad de asesores x Oficina
		
		delete from BON_VentasTotales
		insert into BON_VentasTotales

		select OficCodigo, COUNT(OficCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
					 
						union
						select distinct VendIdeNro,OficCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=18)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by OficCodigo




			update res
			set res.AsesoresXoficina=bvt.VentasTotales
			 from [BON_Resultados-2] as res 
			 inner join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

			 ---Control de porcentaje Asesores por oficina
			 delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-2] as res
				where AsistenciaDesEquiDir=1
				) as T1 
				where T1.AsesoresXoficina>0
				group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeBaseAsesoresCalculoXofic=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		if  (@idPlanBonificacion=5)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric)/Cast(T1.AsesoresXoficina as numeric)*100 as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-2] as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
				and AsistenciaDesEquiDir=1
			
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOfic=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOfic from [BON_Resultados-2]
		where 
	  	PorcentajeAsesoresConNventasValidasOfic>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOfic<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)		

		end

		else if  (@idPlanBonificacion=11)
		begin
		delete BON_VentasTotales
		insert BON_VentasTotales
		select T1.CodOficina, 
				cast(MAX(rn) as numeric) as Cuota from(
				select CodOficina,TotalVentasValidasXasesor,AsesoresXoficina
				,ROW_NUMBER() over (PARTITION by codOficina  order by codOficina desc) as 'rn'	 from  [BON_Resultados-2] as vde
				where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=30) -- Cantidad de Ventas Necesarias para aplicar Canal Especializado
				and AsistenciaDesEquiDir=1
				) as T1
			group by T1.CodOficina,T1.AsesoresXoficina

			update res set res.PorcentajeAsesoresConNventasValidasOficCE=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
			
			---Retorna las oficinas que cumplieron las condiciones
		delete BON_VentasTotales
		insert BON_VentasTotales
		select distinct codOficina,PorcentajeAsesoresConNventasValidasOficCE from [BON_Resultados-2]
		where 
	  	PorcentajeAsesoresConNventasValidasOficCE>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and PorcentajeAsesoresConNventasValidasOficCE<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)		

		end
			
	 end
  end

	 




-----------Especial por volumen de ventas director
	else if (@idPlanBonificacion=6 or @idPlanBonificacion=17)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-2] as liv
		inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)	
		where VentaValida=1 
		and CodPlan=4 
		and AsistenciaDesEquiDir=1
		group by liv.CodOficina

		update res set res.TotalVentasValidasUsadosXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		Select liv.CodOficina,Sum(ventaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-2] as liv
		inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)
		where VentaValida=1 and CodPlan!=4 and res.AsistenciaDesEquiDir=1
		group by liv.CodOficina
		
		update res set res.TotalVentasValidasNuevosXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)


	delete BON_VentasTotales
	insert BON_VentasTotales
		select distinct codOficina,TotalVentasValidasNuevosXoficina+TotalVentasValidasUsadosXoficina as TotalVentaOficina
		from [BON_Resultados-2]

		update res set res.TotalVentasXOficina=bvt.VentasTotales from [BON_Resultados-2] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

	----Calculas las Ventas ValidasAprobadas
	delete from BON_VentasTotales
	insert into BON_VentasTotales
				select distinct res.codOficina
				 ,case
				 when   res.TotalVentasValidasUsadosXoficina>
				 res.TotalVentasXOficina *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXOficina*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXoficina
				 else res.TotalVentasXOficina end  as VentasTotales
				 from [BON_Resultados-2] as res

		update res set res.TotalVentasAprobadasXoficina=bvt.VentasTotales from [BON_Resultados-2] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalVentasAprobadasXoficina from [BON_Resultados-2]
		 where 
		TotalVentasAprobadasXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and TotalVentasAprobadasXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)

	end 
	
			----- Comisiones Asesor
	else if(@idPlanBonificacion=13)
	begin
		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(ComisionValida) 
		as VentasTotales
		from [BON_Liquidacion_Ventas-2]
			where ComisionValida=1 
			group by CodVendedor

				update res
				set res.TotalComisionesValidasXasesor=bvt.VentasTotales
				from [BON_Resultados-2] as res 
				inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)
			
				delete  from BON_VentasTotales
				insert into BON_VentasTotales
				select codVend,TotalComisionesValidasXasesor from [BON_Resultados-2]
				where TotalComisionesValidasXasesor>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
					and TotalComisionesValidasXasesor<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)


		end
		----
		
	-------------------
	
	-----------Comisiones Director
	else if (@idPlanBonificacion=16)
	begin

	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(VentaValida) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-2] as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalComisionesValidasXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	
	delete from BON_VentasTotales	
	insert into BON_VentasTotales
	--Clasificacion de ventas Usados
		Select  liv.CodOficina,Sum(ValorPlan) as 'CantidadVentasValidas' 
		from [BON_Liquidacion_Ventas-2] as liv
		where ComisionValida=1 
		group by liv.CodOficina

		update res set res.TotalPlanesComisionXoficina=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codOficina)
	

		delete from BON_VentasTotales
		insert into BON_VentasTotales
		select distinct codOficina,TotalComisionesValidasXoficina from [BON_Resultados-2]
		 where 
		TotalComisionesValidasXoficina>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
		and TotalComisionesValidasXoficina<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)

	end 
	
	-----------------------

	
-----------------Especial por Desarrollo de equipos Gerente y los 9Retos
	else if (@idPlanBonificacion=7 or @idPlanBonificacion=8)
	begin


		delete from BON_VentasTotales	
		insert into  BON_VentasTotales
		select CodVendedor ,
		SUM(VentaValida)  as VentasTotales
			from [BON_Liquidacion_Ventas-2] where ventaValida=1 
			group by CodVendedor

			
		update res
		set res.TotalVentasValidasXasesor=bvt.VentasTotales
		 from [BON_Resultados-2] as res 
		 inner join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo)


		delete from BON_VentasTotales	
		insert into BON_VentasTotales
		--Clasificacion de ventas Usados
			Select  liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from [BON_Liquidacion_Ventas-2] as liv
			inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)
			and AsistenciaDesEquiGer=1
			where VentaValida=1 
			and CodPlan=4 
			group by liv.CodZona
		
		update res set res.TotalVentasValidasUsadosXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
			left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)
	
		--Clasificacion de Ventas Nuevos
		delete from BON_VentasTotales	
		insert into BON_VentasTotales
			Select liv.CodZona,Sum(ventaValida) as 'CantidadVentasValidas' 
			from [BON_Liquidacion_Ventas-2] as liv
			inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)
			where VentaValida=1 and CodPlan!=4 
			and AsistenciaDesEquiGer=1
			group by liv.CodZona
		
		update res set res.TotalVentasValidasNuevosXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)


		---Calcula las ventas totales
		delete BON_VentasTotales
		insert BON_VentasTotales
			select distinct codZona,TotalVentasValidasNuevosXzona+TotalVentasValidasUsadosXzona as TotalVentaZona
			from [BON_Resultados-2]

		update res set res.TotalVentasXzona=bvt.VentasTotales from [BON_Resultados-2] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		----Calculas las Ventas ValidasAprobadas
		delete from BON_VentasTotales
		insert into BON_VentasTotales
				select distinct res.codZona
				 ,case
				 when   res.TotalVentasValidasUsadosXzona>
				 res.TotalVentasXzona *(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
				 CEILING(res.TotalVentasXzona*(Select valor from [BON_Parametros-1] where Id=13)/100)
				  +TotalVentasValidasNuevosXzona
				 else res.TotalVentasXzona end  as VentasTotales
				 from [BON_Resultados-2] as res

		update res set res.TotalVentasAprobadasXzona=bvt.VentasTotales from [BON_Resultados-2] as res 
		inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

		---Calculo la Cuota del presupuesto
		delete from BON_VentasTotales
		insert into BON_VentasTotales
			select distinct res.codZona,TotalVentasAprobadasXzona/pxz.Presupuesto*100 as cuotaPresupuesto 
			from [BON_Resultados-2] as res
			inner join BON_PresupuestoXzona as pxz on(pxz.CodZona=res.codZona)
			and pxz.Presupuesto>0

		update res set res.TotalCumplimientoPresupuestoXzona=isnull(bvt.VentasTotales,100) from [BON_Resultados-2] as res 
		left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

	



	
	
			if (@idPlanBonificacion=7)
			begin
			--Calcula la cantidad de asesores x Zona

				delete BON_VentasTotales
				insert BON_VentasTotales			
				select RegiCodigo, COUNT(RegiCodigo) as baseAsesoresXZona from (
						select distinct VendIdeNro,RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3) and VendFecRet='1929-01-01 00:00:00.000'
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
					 
						union
						select distinct VendIdeNro, RegiCodigo from BON_Asesores as ase
						inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula) 
						left join BON_Ausentismos as aus on (ase.VendIdeNro=aus.Cedula)
						where  VendTipoVen in (3)
						
						and ast.DiasLaborados-ISNULL(aus.Ausentismos,0)>=(select valor from [BON_Parametros-1] where id=29)
						and VendFecIng<=(select  Valor  from [BON_Parametros-1] where Id=7)
						and VendFecRet>=(select  Valor  from [BON_Parametros-1] where Id=6)

						) as t1

						group by RegiCodigo

				

				update res
				set res.AsesoresXzona=bvt.VentasTotales
				from [BON_Resultados-2] as res 
				inner join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)




				--Control de porcentaje de asesores detectados
				delete BON_VentasTotales
				insert BON_VentasTotales
							select T1.codZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by codZona  order by codZona desc) as 'rn'	 from  [BON_Resultados-2] as res
						where res.AsistenciaDesEquiGer=1
						) as T1 
						where T1.AsesoresXzona>0
					group by T1.codZona,T1.AsesoresXzona

				update res set res.PorcentajeBaseAsesoresCalculoXzona=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)



				delete BON_VentasTotales
				insert BON_VentasTotales
				select T1.CodZona, 
						cast(MAX(rn) as numeric)/Cast(T1.AsesoresXzona as numeric)*100 as Cuota from(
						select vde.codZona,TotalVentasValidasXasesor,AsesoresXzona
						,ROW_NUMBER() over (PARTITION by vde.codZona  order by vde.codZona desc) as 'rn'	 from  [BON_Resultados-2] as vde

						where vde.TotalVentasValidasXasesor>=(Select Valor from [BON_Parametros-1] where Id=26) -- Cantidad de Ventas Necesarias para aplicar
						and vde.AsistenciaDesEquiGer=1	
						
						) as T1
					group by T1.codZona,T1.AsesoresXzona
					
			
				
				update res set res.PorcentajeAsesoresConNventasValidasZona=isnull(bvt.VentasTotales,0) from [BON_Resultados-2] as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.codZona)

			

				---Retorna las Zonas que cumplieron las condiciones
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct codZona,PorcentajeAsesoresConNventasValidasZona from [BON_Resultados-2]
					where 
	  				PorcentajeAsesoresConNventasValidasZona>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
					and PorcentajeAsesoresConNventasValidasZona<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)


				  end
				  
			 
			


			else if (@idPlanBonificacion=8)
			begin

				  --Clasificacion de ventas Usados
	
				delete from BON_VentasTotales	
				insert into BON_VentasTotales
					--Clasificacion de ventas Usados
					Select  liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then 0
					else
					Sum(ventaValida) end 
					as 'CantidadVentasValidas' 
					from [BON_Liquidacion_Ventas-2] as liv
					inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)
					where VentaValida=1 
					and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and CodPlan=4 -- Usados
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona
		
				update res set res.VentasValidasUsadosAlcanzadas=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				--Clasificacion de Ventas Nuevos
				delete from BON_VentasTotales	
				insert into BON_VentasTotales

					Select liv.CodZona,
					case
					when res.TotalCumplimientoPresupuestoXzona>=100
					then ret.RetoEnVentas
					else
					Sum(ventaValida) 
					end as 'CantidadVentasValidas' 
					from [BON_Liquidacion_Ventas-2] as liv
					inner join [BON_Resultados-2] as res on (liv.CodVendedor=res.codVend)
					inner join BON_Retos as ret on (ret.IdBonificacion=@idBonificacion and ret.Periodo=liv.MesLiquidacion and ret.Ano=liv.AñoLiquidacion)			
					where VentaValida=1
					 and CodPlan!=4 -- Nuevos
					 and res.AsistenciaDesEquiDir=1 -- Garantiza que la el asesor lleve mas de 1 mes
					and liv.FechaPago>=ret.FechaInicialReto
					and liv.FechaPago<=ret.FechaFinalReto-- Valida el corte de fecha del # reto
					and liv.CodZona=ret.CodigoZona
					group by liv.CodZona,res.TotalCumplimientoPresupuestoXzona,ret.RetoEnVentas
				
				update res set res.VentasValidasNuevosAlcanzados=isnull(bvt.VentasTotales,0) from BON_Retos as res 
				left join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion



				---Calcula las ventas totales
				delete BON_VentasTotales
				insert BON_VentasTotales
					select distinct CodigoZona,VentasValidasNuevosAlcanzados+VentasValidasUsadosAlcanzadas as TotalVentaZona
					from BON_Retos as ret 
					where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasValidasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion
	
				----Calculas las Ventas ValidasAprobadas
				delete from BON_VentasTotales
				insert into BON_VentasTotales
						select  ret.CodigoZona
						 ,case
						 when   ret.VentasValidasUsadosAlcanzadas>
						 ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100  then 	 
						 CEILING(ret.TotalVentasValidasAlcanzadas*(Select valor from [BON_Parametros-1] where Id=13)/100)
						  +VentasValidasNuevosAlcanzados
						 else ret.TotalVentasValidasAlcanzadas end  as VentasTotales
						 from BON_Retos as ret
						 where ret.IdBonificacion=@idBonificacion

				update res set res.TotalVentasAprobadasAlcanzadas=bvt.VentasTotales from BON_Retos as res 
				inner join BON_VentasTotales as bvt on (bvt.Codigo=res.CodigoZona)
				where res.IdBonificacion=@idBonificacion


				delete BON_VentasTotales
				insert BON_VentasTotales

					select distinct ret.IdBonificacion,
					ret.TotalVentasAprobadasAlcanzadas from BON_Retos as ret
					inner join [BON_Liquidacion_Ventas-2] as lib on (lib.codZona=ret.CodigoZona)
					
					where IdBonificacion=@idBonificacion
					and ret.Periodo=lib.MesLiquidacion
					and ret.Ano=lib.AñoLiquidacion
					and TotalVentasAprobadasAlcanzadas>=ret.RetoEnVentas -- Reto a Cumplir		
				
			  end	 
			
	end 

	else if (@idPlanBonificacion=14)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from [BON_Liquidacion_Ventas-2] as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from [BON_Resultados-2] as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct res.codVend,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoAsesorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoAsesorExtraSonadoresDia
			else
			0
			end as bonoAsesorCeremonia 
			from [BON_Resultados-2] as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join [BON_Liquidacion_Ventas-2] as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end

	else if (@idPlanBonificacion=15)
	begin
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select liv.codOficina, SUM (liv.Asamblea)as Ceremonia from [BON_Liquidacion_Ventas-2] as liv group by liv.CodOficina

	update res set res.TotalParticipantesCeremoniaXoficina=vet.VentasTotales from [BON_Resultados-2] as res
	inner join BON_VentasTotales as vet on (vet.Codigo=res.codOficina)

	delete BON_VentasTotales
	insert BON_VentasTotales

			select distinct pre.CodigoOficina,
			case
			when 
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoSonadoresDia
			 and
			 res.TotalParticipantesCeremoniaXoficina<pre.RetoExtraSonadoresDia
			 then
			pre.BonoDirectorSonadoresDia 
			when
			res.TotalParticipantesCeremoniaXoficina>=pre.RetoExtraSonadoresDia
			then
			pre.BonoDirectorExtraSonadorDia
			else
			0
			end as bonoAsesorCeremonia 
			from [BON_Resultados-2] as res
				 inner join BON_Presupuesto as pre on (res.codOficina=pre.CodigoOficina)
				 inner join [BON_Liquidacion_Ventas-2] as liv on (liv.CodOficina=res.codOficina)
					and pre.Ano=liv.AñoLiquidacion
					and pre.Periodo=liv.MesLiquidacion
					and pre.IdBonificacion=@idBonificacion
					
	end
	
	--- Bono Gerente  Permanencia de Clientes
	
	else 
	
	if (@idPlanBonificacion=18)
	begin
	
	delete BON_VentasTotales
	insert BON_VentasTotales

	select distinct codZona,PermanenciaTotalZona from [BON_Resultados-2]
	where PermanenciaTotalZona>=(select PlanesMinimos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
	and PermanenciaTotalZona<=(select PlanesMaximos from [BON_BonificacionEspecial-2] where  ID=@idBonificacion)
			
					
	end

 
 /*declare @idplanBonificacion int=8,
			@idbonificacion int=309*/
	
return @@rowcount

END

GO
/****** Object:  StoredProcedure [dbo].[BON_CargarAsistencia]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CargarAsistencia]
	-- Add the parameters for the stored procedure here
	@fechaInicio datetime,
@fechaFin datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
declare 
@servidorKactus varchar(50),
@BaseKactus varchar(50),
@Query as varchar (max)
--- el 2 es la nomina comercial

select @servidorKactus=Servidor,@BaseKactus=BaseDatos from SCO_ServidoresBasesDatos as sb where sb.IDServidoresBasesDatos=8 


print format (getdate(),'dd')
-- Carga los ausentismos
set @Query= 
'
delete from BON_Ausentismos
insert into BON_Ausentismos
select 
	cod_empl
	,SUM([diasMesEnCurso]) as sumaAusentismos
	from(
		select cod_empl,fecDesde,fecHasta,can_ause
		,case 
		when format (fecHasta,''dd'')=31
		then
		Convert(int,format(CAST(fecHasta AS DATETIME)-CAST(fecDesde AS DATETIME),''dd''))-1
		else
		Convert(int,format(CAST(fecHasta AS DATETIME)-CAST(fecDesde AS DATETIME),''dd'')) 
		end	as ''diasMesEnCurso''

			from
			(select cod_empl
				,case when CAST(fec_desd AS DATE)<CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE) and CAST(fec_hast AS DATE)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE)  
				then CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE) else CAST(fec_desd AS DATE)  end as ''fecDesde''	
				,fec_desd
				,fec_hast
				,case when fec_desd>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE) and CAST(fec_hast AS DATE)>CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE)  
				then CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) else CAST(fec_hast AS DATE)  end as ''fecHasta''
				,can_ause
				,obs_erva
				from['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_ausen 
					where cod_empl 
									in(select cod_empl from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr 
									 ) 
						and 
						CAST(fec_desd AS DATE)>=dateadd(MM,-1,CAST('''+Convert(varchar(20),@fechaInicio)+''' AS DATE)) and CAST(fec_hast AS DATE)<=dateadd(MM,+1,CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE)) -- filtra ausentimos de un mes antes y uno despues
						and CAST('''+Convert(varchar(20),@fechaFin)+'''as date)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''as date)-- valida que el rango de fechas este correcto
							) as t1 
							where  CAST(fecDesde AS DATE)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''AS DATE) 
							and CAST(fecDesde AS DATE)<=CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) 
							and CAST(fecHasta AS DATE)<=CAST('''+Convert(varchar(20),@fechaFin)+'''AS DATE) -- Delimita solo los del mes de la liquidacion
						) as t2
						group by cod_empl'
						
						exec (@query)

-- Calcula la asistencia de todos los contratos Activos
set @Query= 

'
delete from BON_AsistenciaParcial
insert into BON_AsistenciaParcial
select  
cod_empl,
case when CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATETIME)-CAST(fec_ingr AS DATETIME)>30 then 30 else Convert(int,format(CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATETIME)-CAST(fec_ingr AS DATETIME),''dd'')) END as ''diasLaborados''
,''Contratado'' as Estado
 from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr where ind_acti in (''A'') 
 and fec_ingr<=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE)-- descarta los contratados posterior a la liquidacion
 and CAST('''+Convert(varchar(20),@fechaFin)+'''as date)>=CAST('''+Convert(varchar(20),@fechaInicio)+'''as date)'-- valida que el rango de fechas este correcto
 exec(@query)


--- el 2 es la nomina comercial

select @servidorKactus=Servidor,@BaseKactus=BaseDatos from SCO_ServidoresBasesDatos as sb where sb.IDServidoresBasesDatos=8 


 -- Calcula la asistencia de todos los contratos Inactivos

 set @Query= '
insert into BON_AsistenciaParcial
select  
cod_empl,
case
when
fec_reso<=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE) 
and  CAST(fec_ingr AS DATETIME)<CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
then
convert(int,format(cast(fec_reso as datetime)-CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATETIME),''dd'')) 
when
fec_reso<=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE) 
and  CAST(fec_ingr AS DATETIME)>=CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
then
convert(int,format(cast(fec_reso as datetime)-CAST(fec_ingr AS DATETIME),''dd'')) 
when fec_reso>=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE) 
and  CAST(fec_ingr AS DATETIME)<CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
then 30
when fec_reso>=CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE) 
and  CAST(fec_ingr AS DATETIME)>=CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
then
convert(int,format(CAST('''+CONVERT(varchar(20),@fechaFin)+''' AS DATE) -CAST(fec_ingr AS DATETIME),''dd'')) 
end as ''diasLaborados''
,''Retirado'' as Estado
 from ['+ @servidorKactus+'].['+@BaseKactus+'].dbo.nm_contr where ind_acti not in (''A'') 
 and fec_reso>=CAST('''+CONVERT(varchar(20),@fechaInicio)+''' AS DATE)
 '
 exec (@Query)


 -- Calcula la diferencia entre los dias asistidos de todos los contratos en el mes, menos los ausentismos acumulados

 set @Query=
 '
 delete from BON_AsistenciaTotal
 insert into BON_AsistenciaTotal
select cedula, case when  SUM(diasContratado)>30 then 30 else SUM(diasContratado) end  from bon_asistenciaParcial group by cedula'


exec (@Query)
return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CargarCierreCRM]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CargarCierreCRM]
	-- Add the parameters for the stored procedure here
	@usuario varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 declare @query as varchar (max)	
	    declare @ServidorPerfeccionamiento varchar(100)
    declare @BaseDatosPerfeccionamiento varchar(100)
    select @ServidorPerfeccionamiento = Servidor, @BaseDatosPerfeccionamiento = BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=4 --CRMProspectos
  			SET @query = 'Insert [BON_CierreCRM] 
		SELECT distinct
		 chc.ID as ''Contrato''
			,ventaperfeccionada as ''Perfeccionamiento''
			,(select Valor from BON_Parametros where Id =9) as ''Periodo''
			,(select Valor from BON_Parametros where Id =10) as ''Año''
			,GETDATE() as FechaAct
			,'''+@usuario+''' as ''Usuario''
		 FROM [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[ch_contratosleads] as chc 
			 left join [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[documents] as doc on (chc.id=doc.document_name)
			 where 
             ventaperfeccionada = 1			  
			 and doc.deleted = 0
			 and chc.ID not in (Select contrato from BON_CierreCRM where 
			 Periodo =(select Valor from BON_Parametros where Id =9)
			 and Ano=(select Valor from BON_Parametros where Id =10)
			 )
			 '
			 EXEC (@query)
		
			 

--	select (@query)
  RETURN @@RowCount	
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CargarVentas]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_CargarVentas] 
@FecDesde datetime = null
,@FecHasta datetime  = null
,@Usuario as varchar(50)
AS

BEGIN
SET DATEFORMAT  dmy
IF @FecDesde is null or @FecDesde = '' set @FecDesde= '01/01/1950'
IF @FecHasta is null or @FecHasta = '' set @FecHasta= '31/12/2100'

DECLARE @query as varchar (max)	
declare @Servidor varchar(100)
declare @BaseVenstas_SG varchar(100)

select @Servidor = Servidor, @BaseVenstas_SG= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=9 --Ventas
print (@BaseVenstas_SG)
declare @Servidor2 varchar(100)
declare @BasePaginaWeb_FV varchar(100)


select @Servidor2 = Servidor, @BasePaginaWeb_FV= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=2 --Chevyplan
print (@BasePaginaWeb_FV)


SET @query = '
   DELETE FROM BON_Liquidacion_Ventas
   INSERT INTO BON_Liquidacion_Ventas 
   SELECT  DISTINCT
   ASE.RegiCodigo as CodZona,
   LTRIM(RTRIM(ASE.RegiNombre)) AS ZONA,
   ASE.OficCodigo as CodConsesionario, 
   LTRIM(RTRIM(ASE.OficNombre)) AS Concesionario,
   1 as TipoOficina,
   VendTipoVen as CodCargoAsesor,
   CASE WHEN VendTipoVen = ''1'' THEN ''DIRECTOR'' WHEN VendTipoVen = ''5'' THEN ''ASISTENTE''  WHEN  VendTipoVen = ''4'' THEN ''GERENTE'' ELSE ''ASESOR'' END AS CargoAsesor,
   ASESOR AS CodAsesor,
   LTRIM(RTRIM(ASE.VendNombre)) AS Asesor,
   LTRIM(RTRIM(ASE.VendTipoAse)) AS TipoAsesor,
   Cierre.CONTRATO AS CONTRATO,
   LTRIM(RTRIM((NOMBRES + '' '' + APELLIDOS))) AS Cliente,
   TIPOCONTRA AS CodTipoVenta,
   CASE WHEN TIPOCONTRA = ''1'' THEN ''MegaCumplido'' WHEN TIPOCONTRA = ''2'' THEN ''Alternativa Financiera''  WHEN TIPOCONTRA = ''4'' AND FPagos.PLANMANTENI = 0 THEN ''Normal''  WHEN TIPOCONTRA = ''5'' THEN ''Carro Agil'' 
   WHEN FPagos.PLANMANTENI > 0 THEN ''Mantenimiento''  ELSE ''Referido'' END AS TipoVenta,
   TAGEPLAN.TageCodigo AS CodPlan,
   TAGEPLAN.TageNombre AS LINEAPLAN,
   CASE WHEN TABLA_CONVENIO.CONTRATO IS NULL THEN ''Falso'' else ''Verdadero'' end AS CONVENIO,
   FPagos.VALORPLAN AS ValorPlan,
   FPagos.INSCRIPCIO AS PorcentaInscrip,
   FECHA_PAGO AS FECHA_PAGO,
   Cierre.FContrato AS FechaSuscribe,
   Cierre.FINGRESO AS FecIngreso,
   LTRIM(RTRIM(PlanNombre)) AS Vehiculo,
   LTRIM(RTRIM(Cierre.PLAZO)) AS PLAZO,
   ''0'' as ValidaMontoPlan,
   ''0'' as Venta,
   ''0'' as LlamadaBV,
   ''0'' as Asamblea,
   ''0'' as EstadoSICO,
   ''0'' as Prospecto,   
   ''0'' as VentaValida,
   ''0'' as ComisionValida,
   ''0'' as CodDirectorComision,
   ''0'' as Permanencia,
   ''0'' as NumeroReto,
   '''' as MesLiquidacion,
   '''' as AñoLiquidacion,
   GETDATE() as FecActualizacion,
   '''+@Usuario+''' as UsuarioActualiza
   
   FROM  [' + @Servidor +'].'+ @BaseVenstas_SG + '.[dbo].[Cierre_hist] as Cierre 
   LEFT JOIN [' + @Servidor +'].'+ @BaseVenstas_SG + '.[dbo].cliente on IDTITULAR = ID collate SQL_Latin1_General_CP1_CI_AS
  -- LEFT JOIN  [' + @Servidor2 +'].'+ @BasePaginaWeb_FV + '.[dbo].[TEMP_VEND]  WITH (NOLOCK)ON  Cierre.ASESOR = TEMP_VEND.VendCodigo 
  -- LEFT JOIN  [' + @Servidor2 +'].'+ @BasePaginaWeb_FV + '.[dbo].[TEMP_OFIC] OFIC  WITH (NOLOCK)ON TEMP_VEND.VendCodOfi = OFIC.OficCodigo 
   lEFT JOIN [BON_ASESORES] as ASE on Cierre.Asesor=ASE.VendCodigo
   LEFT JOIN  [' + @Servidor +'].'+ @BaseVenstas_SG + '.[dbo].[FPagos]  ON Cierre.Contrato = FPagos.Contrato 
   LEFT JOIN (SELECT Pagos.Contrato ,MAX (Pagos.FecPago) as FECHA_PAGO FROM [' + @Servidor +'].'+ @BaseVenstas_SG + '.[dbo].[Pagos] WHERE Pagos.Estado = ''V''  GROUP BY Pagos.Contrato) AS FECHA_PAGO  ON Cierre.Contrato  = FECHA_PAGO.Contrato 
   LEFT JOIN [' + @Servidor2 +'].'+ @BasePaginaWeb_FV + '.[dbo].[TEMP_PLAN]  WITH (NOLOCK) ON Cierre.CODPLAN = TEMP_PLAN.PlanCodigo
   LEFT JOIN [' + @Servidor2 +'].'+ @BasePaginaWeb_FV + '.[dbo].[TEMP_TAGE] TAGEPLAN WITH (NOLOCK) ON Cierre.LINEAPLAN = TAGEPLAN.TageCodigo AND TAGEPLAN.TageTipo = ''AL''
   LEFT JOIN (select CONTRATO from [' + @Servidor +'].'+ @BaseVenstas_SG + '.[dbo].Det_Promocion WHERE CONVENIO = ''S'' GROUP BY CONTRATO) AS TABLA_CONVENIO ON TABLA_CONVENIO.CONTRATO = CIERRE.CONTRATO  
   where Estado = ''P'' and
   CAST(FRADICADO AS DATE) >= CAST('''+ CONVERT(VARCHAR(20),@FecDesde,103) +''' AS DATE) AND 
   CAST(FRADICADO AS DATE) <= CAST('''+ CONVERT(VARCHAR(20),@FecHasta,103) +''' AS DATE) 
   AND VentaEspecial = 0'
EXEC (@query)
--SELECT (@query)


RETURN @@RowCount


END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaAnosPresupuestos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaAnosPresupuestos]
AS
BEGIN
SELECT distinct Ano FROM [dbo].[BON_Presupuesto]
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaAnosRetos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[BON_ConsultaAnosRetos]
AS
BEGIN
SELECT distinct Ano FROM [dbo].[BON_Retos]
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaBonificacionEspecialXidPlan]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaBonificacionEspecialXidPlan]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from bon_bonificacionEspecial where idPlanBonificacion=@IdPlanBonificacion

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaBonificacionEspecialXidPlan_Recu]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ConsultaBonificacionEspecialXidPlan_Recu]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from BON_BonificacionEspecial_Recu where idPlanBonificacion=@IdPlanBonificacion

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaBonificacionEspecialXidPlan-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ConsultaBonificacionEspecialXidPlan-1]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from [BON_BonificacionEspecial-1] where idPlanBonificacion=@IdPlanBonificacion

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaBonificacionEspecialXidPlan-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ConsultaBonificacionEspecialXidPlan-2]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from [BON_BonificacionEspecial-2] where idPlanBonificacion=@IdPlanBonificacion

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametros]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametros]
@Tipo as varchar(50)
AS
BEGIN
SELECT [Id] ,[Parametro] ,[Valor] FROM [dbo].[BON_Parametros] where Tipo = @Tipo
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametrosGnrls]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametrosGnrls]

AS
BEGIN
SELECT [Id],[Tipo],[Parametro] ,[Valor], [UsuActualiza], [FecActualiza],[Observaciones] FROM [dbo].[BON_Parametros] where Tipo <> 'Estado'
END



GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaParametrosId]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaParametrosId]
@Id as int,
@Valor as varchar(50)
AS
BEGIN
SELECT  [Id]
      ,[Tipo]
      ,[Parametro]
      ,[Valor]
      ,[UsuActualiza]
      ,[FecActualiza]
      ,[Observaciones]
  FROM [Bonificacion_desarrollo].[dbo].[BON_Parametros_Historico] where Id = @Id and Valor = @Valor
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPerfilComercial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaPerfilComercial]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from BON_PerfilComercial
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPerfiles]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaPerfiles]

AS
BEGIN
SELECT [ID] ,[PERFIL] FROM [dbo].[BON_Perfil]
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPeriodosPresupuestosXano]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPeriodosPresupuestosXano]
@Ano int
AS
BEGIN
SELECT distinct Periodo FROM [dbo].[BON_Presupuesto] where Ano=@Ano
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPeriodosRetosXano]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPeriodosRetosXano]
@Ano int
AS
BEGIN
SELECT distinct Periodo FROM [dbo].[BON_Retos] where Ano=@Ano
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPlanesBonificacion]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_ConsultaPlanesBonificacion]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from BON_PlanesDeBonificacion
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPlanesBonificacionXId]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaPlanesBonificacionXId]
	-- Add the parameters for the stored procedure here
@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from BON_PlanesDeBonificacion where ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPlanesBonificacionXrol]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaPlanesBonificacionXrol]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from BON_PlanesDeBonificacion where IdRol=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPresupuesto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPresupuesto]
@Ano int,
@Periodo int
AS
BEGIN
SELECT * FROM [dbo].[BON_Presupuesto] where Ano=@Ano and Periodo=@Periodo
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaPresupuestoXoficina]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaPresupuestoXoficina]
@Ano int,
@Periodo int,
@Oficina int
AS
BEGIN

SELECT * FROM [dbo].[BON_Presupuesto] where Ano=@Ano and Periodo=@Periodo and CodigoOficina=@Oficina

END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetos]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaRetos]
@Ano int,
@Periodo int
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,NumeroReto FROM [dbo].[BON_Retos] where Ano=@Ano and Periodo=@Periodo
order by NumeroReto asc ,CodigoZona asc
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetosXidPlan]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultaRetosXidPlan]
	-- Add the parameters for the stored procedure here
@IdPlanBonificacion int,
@mes int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select * from BON_Retos where idPlanBonificacion=@IdPlanBonificacion and Periodo=@mes and Ano=@ano

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaRetosXllave]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BON_ConsultaRetosXllave]
@Ano int,
@Periodo int,
@CodigoGerente int,
@FechaIni datetime,
@FechaFin datetime
AS
BEGIN
SELECT CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,NumeroReto FROM [dbo].[BON_Retos] 
where Ano=@Ano and Periodo=@Periodo and CodigoGerente=@CodigoGerente and FechaInicialReto=@FechaIni and FechaFinalReto=@FechaFin 
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultarFechaCierreCRM]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_ConsultarFechaCierreCRM]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 FechaActualizacion from BON_CierreCRM order by FechaActualizacion desc
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaTodosUsuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaTodosUsuario]

AS
BEGIN
SELECT U.[ID]
      ,[USUARIO]
	  ,U.ID_PERFIL
      ,P.PERFIL
      ,[HABILITA]
  FROM [dbo].[BON_Usuario] AS U
  LEFT JOIN [dbo].[BON_Perfil] AS P ON U.ID_PERFIL = P.ID
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaUsuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaUsuario]
@Usuario varchar(50)
AS
BEGIN
SELECT [ID]
      ,[USUARIO]
      ,[ID_PERFIL]
      ,[HABILITA]
  FROM [dbo].[BON_Usuario] where USUARIO = @Usuario
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ConsultaUsuarioChevy]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ConsultaUsuarioChevy]

AS
BEGIN
DECLARE @query as varchar (max)	
declare @Servidor varchar(100)
declare @BaseDatos varchar(100)

select @Servidor = Servidor, @BaseDatos= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=11

SET @query = 'SELECT [IdUsuario] AS USUARIO FROM [' + @Servidor +'].'+ @BaseDatos + '.[dbo].[ADM_MenuUsuario] WHERE MenuId = 287 AND Habilita = 1'
EXEC (@query)
--SELECT (@query)
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_ContarBases]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_ContarBases] 
@IdTabla varchar(2),
@Ceremonia varchar(20)
	
AS					

BEGIN

  declare @query as varchar (max)	
  
  
  IF @IdTabla = '1' --Valida Ventas Mayores al valor minimo de inscripcion
  		BEGIN			
  			SET @query = '
			UPDATE [BON_PamVentasOutsorsing] SET NoExclucion =1 where MarcaExcl!=''EXCL''
		UPDATE [BON_PamVentasOutsorsing] SET VentaInscripcion = 1 where PorcentajeInscripcion >= cast((select valor from BON_Parametros where Id=20) as numeric (18,10))
			UPDATE [BON_Liquidacion_Ventas] SET Venta = 1 where Inscripcion >= cast((select valor from BON_Parametros where Id=20) as numeric (18,10))'
  		END

  ELSE IF @IdTabla = '2' --Valida Llamada de Bienvenida
  		BEGIN			

            declare @ServidorChevyPlanApp varchar(100)
            declare @BaseDatosChevyplanApp varchar(100)
            select @ServidorChevyPlanApp = Servidor, @BaseDatosChevyplanApp= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=6 --ChevyplanApp pasas a 6 y la tabla callDetailHist
            
            declare @ServidorApplication_epro varchar(100)
            declare @BaseDatosApplication_epro varchar(100)
            select @ServidorApplication_epro = Servidor, @BaseDatosApplication_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --Application_epro
  			print @basedatosApplication_epro
			SET @query = 
			--Identifica que el contrato se encuentre en unified
			
			

			--Identifica las llamadas que cumplen la tipificacion
			'UPDATE [BON_PamVentasOutsorsing] SET LlamadaBV = 1
             WHERE Contrato IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from BON_Parametros as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from BON_PamVentasOutsorsing as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' OR t1.Motivo = ''EFECTIVA YA GESTIONADA''	
				union
				SELECT distinct CONTRATO from [' + @ServidorApplication_epro +'].'+ @BaseDatosApplication_epro + '.[dbo].[A_BASE_GENERAL_2018]
 where contrato COLLATE Modern_Spanish_CI_AS in(select liv.Contrato from BON_PamVentasOutsorsing as liv) and Disp1_Id in (374,384)	
and Call1_dt>=(Select Valor from BON_Parametros as par where par.Id=6)
and Call1_dt<=GETDATE()
union
select contrato COLLATE Modern_Spanish_CI_AS from BON_PamVentasOutsorsing where Contrato>=(select valor from BON_Parametros where Id=31) --Identifica las ventas telefonicas
			and Contrato<=(select valor from BON_Parametros where Id=32)
			 )
			  UPDATE [BON_PamVentasOutsorsing] SET LlamadaBV = 1
             WHERE CONTRATO IN (
			select ContratoTelefonico from BON_ContratoTelefonico 
			)

			UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from BON_Parametros as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from bon_liquidacion_ventas as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' OR t1.Motivo = ''EFECTIVA YA GESTIONADA''	
				union
				SELECT distinct CONTRATO from [' + @ServidorApplication_epro +'].'+ @BaseDatosApplication_epro + '.[dbo].[A_BASE_GENERAL_2018]
 where contrato COLLATE Modern_Spanish_CI_AS in(select liv.Contrato from bon_liquidacion_ventas as liv) and Disp1_Id in (374,384)	
and Call1_dt>=(Select Valor from BON_Parametros as par where par.Id=6)
and Call1_dt<=GETDATE()
union
select contrato COLLATE Modern_Spanish_CI_AS from BON_Liquidacion_Ventas where Contrato>=(select valor from BON_Parametros where Id=31) --Identifica las ventas telefonicas
			and Contrato<=(select valor from BON_Parametros where Id=32)
			 )
			 UPDATE [BON_Liquidacion_Ventas] SET LlamadaBV = 1
             WHERE CONTRATO IN (
			select ContratoTelefonico from BON_ContratoTelefonico 
			)
			
		select LlamadaBV from [BON_Liquidacion_Ventas] where LlamadaBV = 1'
		


  		END

  ELSE IF @IdTabla = '3' --Valida Ceremonia de Sueños
  		BEGIN		
            --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=10	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
  			SET @query = '
			UPDATE [BON_PamVentasOutsorsing] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT cast(Contrato as numeric(18,0)) FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')
			
			UPDATE [BON_Liquidacion_Ventas] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT cast(Contrato as numeric(18,0)) FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

  		END

  ELSE IF @IdTabla = '4' --Valida Estado en SICO 
  		BEGIN		

		    declare @ServidorSICO varchar(100)
            declare @BaseDatosSICO varchar(100)
            select @ServidorSICO = Servidor, @BaseDatosSICO= BaseDatos from SCO_ServidoresBasesDatos where IDServidoresBasesDatos=1	--SICODIARIOBD

			set @query=' exec [' + @ServidorSICO +'].'+ @BaseDatosSICO + '.[DBO].BON_EstadoSICO'

		UPDATE  pam SET pam.EstadoSICO = 1 from BON_PamVentasOutsorsing as pam
		where pam.EstadoCupo not in ('T','Z')
	
  		END

  ELSE IF @IdTabla = '5' --Valida Perfeccionamiento
  		BEGIN			
  --Perfeccionamiento
	SET @query = 'UPDATE [BON_Liquidacion_Ventas] SET Prospecto = 1
			WHERE CONTRATO IN (
			 select Contrato from BON_CierreCRM where
			 Periodo=(select valor from BON_Parametros where id=9) 
			 and Ano=(select valor from BON_Parametros where id=10)
			 )'
			 
  		END

 ELSE IF @IdTabla = '12' --Valida valor de  Planes para Vehiculos Usados y Nuevos
   		BEGIN	
  			SET @query = '
			---Usados
			UPDATE [BON_Liquidacion_Ventas] SET ValidaPlan = 1
             WHERE codplan=4  and ValorPlan>=(select valor from BON_Parametros where Id=14)
			 ---Nuevos
			 UPDATE [BON_Liquidacion_Ventas] SET ValidaPlan = 1
             WHERE codplan!=4  and ValorPlan>=(select valor from BON_Parametros where Id=15)

			 select * from bon_liquidacion_Ventas where validaPlan=1
			 '
  		END


  	
	
	EXEC (@query)


--	select (@query)
  RETURN @@RowCount			
END


GO
/****** Object:  StoredProcedure [dbo].[BON_CrearAsesor_SQL]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearAsesor_SQL] 
	-- Add the parameters for the stored procedure here
@codigoVendedor int,
@tipoVenta int,
@codigoOficina int,
@idVendedor varchar(50),
@nombreOficina varchar(250),
@fechaIngreso datetime,
@fechaRetiro datetime,
@tipoAsesor varchar(10),
@Email varchar(100),
@codRegi int,
@nombreRegi varchar(50),
@nombreVendedor varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_Asesores(VendCodigo,VendTipoVen,OficCodigo,VendIdeNro,OficNombre,VendFecIng,VendFecRet,VendTipoAse,VendMail,RegiCodigo,RegiNombre,VendNombre)
values (@codigoVendedor, @tipoVenta,@codigoOficina,@idVendedor,
@nombreOficina,@fechaIngreso,@fechaRetiro,@tipoAsesor,@Email,@codRegi,@nombreRegi,@nombreVendedor)
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CrearBonificacionEspecial]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearBonificacionEspecial] 
	-- Add the parameters for the stored procedure here
@descripcion varchar(50),
@planesMinimos numeric(18,2),
@planesMaximos numeric(18,2),
@valorBono numeric(18,2),
@Aplica bit,
@usuarioactualiza varchar(50),
@planBonificacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_BonificacionEspecial (DescripcionBono,PlanesMinimos,PlanesMaximos,ValorBono,Aplica,FechaActualiza,UsuarioActualiza,IdPlanBonificacion)
values (@descripcion, @planesMinimos,@planesMaximos,@valorBono,
@Aplica,GETDATE(),@usuarioactualiza,@planBonificacion)
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CrearPresupuesto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearPresupuesto] 
	-- Add the parameters for the stored procedure here
@CodOficina int,
@Presupuesto int,
@Periodo int,
@Ano int,
@usuarioactualiza varchar(50),
@CodZona int,
@CodGerente int,
@CodDirector int,
@retoSonadores int,
@retoExtraSonadores int,
@bonoAsesorSonadores numeric(18,0),
@bonoAsesorExtraSonadores numeric(18,0),
@bonoDirectoSonadores numeric(18,0),
@bonoDirectorExtraSonadores numeric(18,0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @idPlanBonificacion int=14
    -- Update statements for procedure here
insert into BON_Presupuesto(CodigoOficina,Presupuesto,Periodo,Ano,FechaActualiza,UsuarioActualiza
,CodZona,CodigoGerente,CodigoDirector,RetoSonadoresDia,RetoExtraSonadoresDia,BonoAsesorSonadoresDia,BonoAsesorExtraSonadoresDia
,BonoDirectorSonadoresDia,BonoDirectorExtraSonadorDia,idPlanBonificacion)
values (@CodOficina, @Presupuesto,@Periodo,@Ano,
GETDATE(),@usuarioactualiza,@CodZona,@CodGerente,@CodDirector,@retoSonadores,@retoExtraSonadores,
@bonoAsesorSonadores,@bonoAsesorExtraSonadores,@bonoDirectoSonadores,@bonoDirectorExtraSonadores,@idPlanBonificacion)
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CrearReto]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearReto] 
	-- Add the parameters for the stored procedure here
@CodZona int,
@RetoEnVentas int,
@periodo int,
@ano int,
@codGerente int,
@fechaInicioReto datetime,
@fechaFinReto datetime,
@valorBono numeric (18,0),
@usuarioactualiza varchar(50),
@numeroReto int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_Retos(CodigoZona,RetoEnVentas,Periodo,Ano,CodigoGerente,FechaInicialReto,FechaFinalReto,ValorBonificacion,FechaActualiza,UsuarioActualiza,IdPlanBonificacion,NumeroReto)
values (@CodZona, @RetoEnVentas,@Periodo,@Ano,@codGerente,
@fechaInicioReto,@fechaFinReto,
@valorBono,
GETDATE(),@usuarioactualiza,8,@numeroReto)
RETURN @@RowCount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_CrearUsuario]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_CrearUsuario]
@Id int,
@Usuario varchar(50),
@IdPerfil int,
@Habilita int
AS
BEGIN
INSERT INTO [dbo].[BON_Usuario] ([USUARIO], [ID_PERFIL],[HABILITA]) VALUES (@Usuario, @IdPerfil, @Habilita)
END

return @@rowcount
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearVentaOutSourcing]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_CrearVentaOutSourcing]
	-- Add the parameters for the stored procedure here
	          
              @Cupo Varchar (50),
			  @Afiliado Varchar (50),
              @Contrato Varchar (50),
              @CodOficina int,
              @Oficina varchar(50),
			  @FechaVenta datetime,
              @ValorPlan numeric (18,0),
              @CodVendedor int,
			  @IdeVendedor numeric,
			  @nombreVendedor varchar (50),
			  @Tipo varchar (50),
			  @PorcentajeInscripcion numeric (18,2),
			  @ValorInscripcionSinIva numeric (18,0),
			  @ValorPagoParcial numeric (18,0),
			  @AlturaDiferida varchar (50),
			  @TipoContrato varchar (50),
			  @CarroAgil varchar (50),
			  @MarcaDiferida varchar (50),
			  @CodigoDirector int,
			  @IdDirector numeric (18,0),
			  @NombreDirector varchar (50),
			  @ValorIvaInscripcion numeric (18,0),
			  @ValorTotaInscripcionConIva numeric(18,0),
			  @MarcaExcl varchar (50),
			  @LineaProducito varchar (50),
              @UsuarioActualiza varchar (50),
			  @EstadoCupo varchar (10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into BON_PamVentasOutsorsing (Cupo,Afiliado,Contrato,CodOficina,Oficina,FechaVenta,ValorPlan,CodVendedor
	,IdeVendedor,nombreVendedor,Tipo,PorcentajeInscripcion,ValorInscripcionSinIva,ValorPagoParcial,AlturaDiferida
	,TipoContrato,CarroAgil,MarcaDiferida,CodigoDirector,IdeDirector,NombreDirector,ValorIvaInscripcion
	,ValorTotaInscripcionConIva,MarcaExcl,LineaProducto,UsuarioActualiza,FechaActualiza,EstadoCupo,
	NoExclucion,VentaInscripcion,LlamadaBV,Asamblea,EstadoSICO,ComisionValida) values(
	          @Cupo,
			  @Afiliado,
              @Contrato,
              @CodOficina,
              @Oficina,
			  @FechaVenta,
              @ValorPlan,
              @CodVendedor,
			  @IdeVendedor,
			  @nombreVendedor,
			  @Tipo,
			  @PorcentajeInscripcion,
			  @ValorInscripcionSinIva,
			  @ValorPagoParcial,
			  @AlturaDiferida,
			  @TipoContrato,
			  @CarroAgil,
			  @MarcaDiferida,
			  @CodigoDirector,
			  @IdDirector,
			  @NombreDirector,
			  @ValorIvaInscripcion,
			  @ValorTotaInscripcionConIva,
			  @MarcaExcl,
			  @LineaProducito,
              @UsuarioActualiza	,	
			  getdate()  ,
			  @EstadoCupo,
			  0,
			  0,
			  0,
			  0,
			  0,
			  0
			  )

			  return @@rowcount

END

GO
/****** Object:  StoredProcedure [dbo].[BON_EliminaVentasOutSourcing]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_EliminaVentasOutSourcing]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from BON_PamVentasOutsorsing
END

GO
/****** Object:  StoredProcedure [dbo].[BON_Guardar_Historico_Liquidacion]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_Guardar_Historico_Liquidacion]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into BON_Liquidacion_Ventas_Hist
    select * from BON_Liquidacion_Ventas
	
	declare @Mes int
	declare @Ano int 
	select @Mes=MesLiquidacion,@Ano=AñoLiquidacion from BON_Liquidacion_Ventas
	insert into BON_BonificacionEspecial_Hist
	select *,@Mes,@Ano from BON_BonificacionEspecial 

	insert into BON_PamVentasOutsorsing_Hist
	select * from BON_PamVentasOutsorsing



	
END

GO
/****** Object:  StoredProcedure [dbo].[BON_GuardarHistoricoParametros]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BON_GuardarHistoricoParametros]

AS
BEGIN

exec BON_Guardar_Historico_Liquidacion
declare @Mes int
	declare @Ano int 
	select @Mes=MesLiquidacion,@Ano=AñoLiquidacion from BON_Liquidacion_Ventas
  INSERT INTO [dbo].[BON_Parametros_Historico]
  SELECT *,@Mes,@Ano FROM [dbo].[BON_Parametros]
END

return @@rowcount

GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_IniciarResultados] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Exec BON_IniciarResultadosComisiones
-- Directores Retirados en el mes
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
--0
from BON_Liquidacion_Ventas as liv
inner join BON_Asesores as ase on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=ase.VendFecRet
and ase.VendFecRet>=(select valor from BON_Parametros where id=6)
and ase.VendFecRet<=(select valor from BON_Parametros where id=7)
and ase.VendFecIng<=(select valor from BON_Parametros where id=6)

-- Directores que entraron y se retiraron en el mismo mes
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecIng>=(select valor from BON_Parametros where id=6)
and ase.VendFecIng<=(select valor from BON_Parametros where id=7)
and ase.VendFecRet>=(select valor from BON_Parametros where id=6)
and ase.VendFecRet<=(select valor from BON_Parametros where id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=ase.VendFecRet

-- Directores  Activos que se retiraron despues del periodo de la liquidacion
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecRet=dateadd(M,1,(select valor from BON_Parametros where Id=7))
and ase.VendFecIng<= (select valor from BON_Parametros where Id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=(select valor from BON_Parametros where Id=7)

-- Directores que Activos para comisiones
update liv  set liv.CodDirectorComision=
ase.VendCodigo 
from BON_Liquidacion_Ventas as liv
inner join 
BON_Asesores as ase
on  (liv.CodOficina=ase.OficCodigo)
where VendTipoVen=1 
and ase.VendFecRet='1929-01-01 00:00:00.000'
and ase.VendFecIng<= (select valor from BON_Parametros where Id=7)
and liv.codDirectorComision=0
and liv.FechaPago>=ase.VendFecIng
and liv.FechaPago<=dateadd(d,1,(select valor from BON_Parametros where Id=7))

	--- limpia los calculos de una liquidacion previa.
	delete from BON_LiquidacionBonificaciones
	delete from BON_LiquidacionBonificacionesGrupales
	--- Limpia Tabla de Resultados
	delete from BON_Resultados
	insert into BON_Resultados
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
    ,0 as TotalVentasVAlidas 
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as TotalPorcentajeCumplimiento
	,0 as AsistenciaTotal
	,0 as AsistenciaDesDirector
	,0 as AsistenciaDesGerente
	,0 as Ausentismos
	,0 as AsesoresXoficina
	,0 as PorcentajeAsesoresCalculo
	,0 as PorcentajeAsesoresConNVentasValidasXOficina
	,0 as PorcentajeAsesoresConNVentasValidasXoficinaCE
	,0 as TotalVentasRegistradasXoficina
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
	,0 as VentasMaximasSinCeremoniaXoficina
	,0 as VentasRegistradasSinCeremoniaXoficina
	,0 as PermanenciaTotalOficina
	,0 as PermanenciaDiferidaOficina
	,0 as PermanenciaDirector
	,0 as TotalVentasUsadosXzona
	,0 as TotalVentasNuevosXzona
	,0 as TotalVentasXzona
	,0 as TotalVentasAprobadasXzona
	,0 as TotalCumplimientoPresupuestoXzona
	,0 as AsesoresXzona
	,0 as PorcentajeBaseAsesoresCalculoXzona
	,0 as PorcentajeAsesoresConNventasValidasZona
	,0 as TotalVentasRegistradasXoficina
	,0 as PorcentajeSinCeremoniaXZona
	,0 as VentasMaximasSinCeremoniaXzona
	,0 as VentasRegistradasSinCeremoniaXzona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from BON_Liquidacion_Ventas 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_Liquidacion_Ventas group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from BON_Liquidacion_Ventas as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacion datetime;
			declare @fechaFinalLiquidacion datetime;
			select @fechaInicialLiquidacion=valor from BON_Parametros where Id=6
			select @fechaFinalLiquidacion=valor from BON_Parametros where Id=7
			set @fechaInicialLiquidacion=dateadd(M,1,@fechaInicialLiquidacion)
			set @fechaFinalLiquidacion=dateadd(M,1,@fechaFinalLiquidacion)

			--Caso especial si no lo encuentra pero esta activo
						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)
									and CodVendedor not in
									(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),dateadd(M,-1,@fechaInicialLiquidacion))as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),dateadd(M,-1,@fechaFinalLiquidacion)) as datetime)
									)
									and CodVendedor not in (
									select ase.VendCodigo from BON_Asesores as ase
									where VendFecRet>=(select valor from BON_Parametros where Id=6)
									and VendFecRet<=GETDATE()
									)

						UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and insdCumPerTotal>=(select valor from BON_Parametros where Id=23)
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)
--Para diferida en 0 se asume que es del 100 % por default
									UPDATE [BON_Liquidacion_Ventas] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from BON_Parametros where Id=22) 
									and InsdTotCliPerTotal=0
									or finalCumPerTotal>=(select valor from BON_Parametros where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacion)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacion) as datetime)
									)


	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_Resultados as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_Resultados as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

	 	 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Presupuesto<900
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

--Calcula las ventas Registrada por oficina

  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodOficina, count (*) as ventasRegistradas
			from BON_Liquidacion_Ventas 
			group by CodOficina

  	update res set res.TotalVentasRegistradasXoficina=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)


			--Calcula las ventas Registrada por Zona

  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, count (*) as ventasRegistradas
			from BON_Liquidacion_Ventas 
			group by CodZona

  	update res set res.TotalVentasRegistradasXZona=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	--- Ingresa la cantidad de ventas sin ceremonia Maxima x oficina
	delete from BON_VentasTotales
	insert BON_VentasTotales
	select distinct codOficina,round(TotalVentasRegistradasXoficina*(select valor from BON_Parametros where Id=27)/100,0)
	from BON_Resultados
	update res set res.VentasMaximasSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

		--- Ingresa la cantidad de ventas sin ceremonia Maxima x Zona
	delete from BON_VentasTotales
	insert BON_VentasTotales
	select distinct codZona,round(TotalVentasRegistradasXZona*(select valor from BON_Parametros where Id=27)/100,0)
	from BON_Resultados
	update res set res.VentasMaximasSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
	--Calcula el total de ventas sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric)) as totalSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodZona	
	update res set res.VentasRegistradasSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el total de ventas sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric)) as totalSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodOficina
	update res set res.VentasRegistradasSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


	--Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas 
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


	------------------------Base Clientes al Dia-- Se Calcula de la permanencia Total Al dia.
	delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric)) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.TotalParticipantesCeremoniaXoficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

------


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	round(SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100,0) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	round(SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100,0) 
	 as resultado
     
  FROM [SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, round(SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100,0) as resultado
    from [SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			round(SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100,0) as resultado
     		FROM [SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacion
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacion
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from BON_Resultados as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)





	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from BON_Parametros where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from BON_Parametros where Id=23)
				or PermanenciaTotalOficina>=(select valor from BON_Parametros where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from BON_Parametros where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from BON_Parametros where Id=23)
				or PermanenciaTotalZona>=(select valor from BON_Parametros where Id=24)	
				

			 UPDATE [BON_Resultados] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from BON_Parametros where Id=29)
	

			 UPDATE [BON_Resultados] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from BON_Parametros where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from BON_Liquidacion_Ventas as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from BON_Liquidacion_Ventas)
	and ret.Ano=(select top 1 AñoLiquidacion from BON_Liquidacion_Ventas)
	/*--- Asigna las Ventas pagadas antes del mes del primer rero por defecto al reto 1
	  update liv set liv.NumeroReto=1 from BON_Liquidacion_Ventas as liv
	where FechaPago< (select top 1 FechaInicialReto from BON_Retos where NumeroReto=1)
	*/
END

GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados_RecuPerma]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_IniciarResultados_RecuPerma] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


		declare @periodoAnterior varchar (2)
	declare @periodoActual varchar (2)
	declare @Ano varchar (4)
	select @periodoActual=valor from [BON_Parametros] where Id=9


	if (@periodoActual=01)
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	Set @Ano=@Ano-1	
	set @periodoAnterior=12
	print @periodoAnterior
	print @Ano
	end
	else
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	select @periodoAnterior=@periodoActual-1
	print @periodoAnterior
	print @Ano
	end

	--- Indica los parametros a tener en cuenta para esta liquidacion
	delete from [BON_Parametros-1]
	insert into [BON_Parametros-1]
	select * from BON_Parametros_Historico where Periodo=@periodoAnterior and Ano=@Ano

	---- Trar la liquidacion previa asocida al historico
	delete from BON_Liquidacion_Ventas_Recu
	insert into BON_Liquidacion_Ventas_Recu
	select * from BON_Liquidacion_Ventas_Hist
	where CAST(MesLiquidacion as  int)=@periodoAnterior
	and CAST(AñoLiquidacion as int)=@Ano

	
	---Trae las bonificaciones asosiadas a este periodo.

	delete   from  BON_BonificacionEspecial_Recu
	insert into BON_BonificacionEspecial_Recu
	select *  from [BON_BonificacionEspecial_Hist]
	where Mes=@periodoAnterior
	and Ano=@Ano
		
	--- Limpia Tabla de Resultados
	delete from BON_Resultados_Recu
	insert into BON_Resultados_Recu
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
    ,0 as TotalVentasVAlidas 
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as TotalPorcentajeCumplimiento
	,0 as AsistenciaTotal
	,0 as AsistenciaDesDirector
	,0 as AsistenciaDesGerente
	,0 as Ausentismos
	,0 as AsesoresXoficina
	,0 as PorcentajeAsesoresCalculo
	,0 as PorcentajeAsesoresConNVentasValidasXOficina
	,0 as PorcentajeAsesoresConNVentasValidasXoficinaCE
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalPlanesComisinesXoficina
	,0 as TotalComisinesValidasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
	,0 as PermanenciaTotalOficina
	,0 as PermanenciaDiferidaOficina
	,0 as PermanenciaDirector
	,0 as TotalVentasUsadosXzona
	,0 as TotalVentasNuevosXzona
	,0 as TotalVentasXzona
	,0 as TotalVentasAprobadasXzona
	,0 as TotalCumplimientoPresupuestoXzona
	,0 as AsesoresXzona
	,0 as PorcentajeBaseAsesoresCalculoXzona
	,0 as PorcentajeAsesoresConNventasValidasZona
	,0 as PorcentajeSinCeremoniaXZona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from BON_Liquidacion_Ventas_Recu 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_Liquidacion_Ventas_Recu group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from BON_Liquidacion_Ventas_Recu as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacionPerma datetime;
			declare @fechaFinalLiquidacionPerma datetime;
			select @fechaInicialLiquidacionPerma=valor from [BON_Parametros-1] where Id=6
			select @fechaFinalLiquidacionPerma=valor from [BON_Parametros-1] where Id=7
			set @fechaInicialLiquidacionPerma=dateadd(M,2,@fechaInicialLiquidacionPerma) --- +2 meses ya que es la permanencia actual
			set @fechaFinalLiquidacionPerma=dateadd(M,2,@fechaFinalLiquidacionPerma)

				
						UPDATE [BON_Liquidacion_Ventas_Recu] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

						UPDATE [BON_Liquidacion_Ventas_Recu] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=22) 
									and insdCumPerTotal>=(select valor from [BON_Parametros-1] where Id=23)
									or finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

---Calcula la Asistencia del mes Anterior
declare @fechaInicioActual datetime,
@fechaFinActual datetime

Select @fechaInicioActual= valor from [BON_Parametros-1] where Id=6
Select @fechaFinActual= valor from [BON_Parametros-1] where Id=7


 Exec BON_CargarAsistencia @fechaInicioActual, @fechaFinActual

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_Resultados_Recu as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_Resultados_Recu as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

	 	 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas_Recu)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas_Recu)
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

	--Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas_Recu 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from BON_Liquidacion_Ventas_Recu 
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from BON_Resultados_Recu as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 as resultado
    from [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 as resultado
     		FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from BON_Resultados_Recu as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)


	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados_Recu] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados_Recu] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=24)	
				

			 UPDATE [BON_Resultados_Recu] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=29)
	

			 UPDATE [BON_Resultados_Recu] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from BON_Liquidacion_Ventas_Recu as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from BON_Liquidacion_Ventas_Recu)
	and ret.Ano=(select top 1 AñoLiquidacion from BON_Liquidacion_Ventas_Recu)
	

END

GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_IniciarResultados-1] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


		declare @periodoAnterior varchar (2)
	declare @periodoActual varchar (2)
	declare @Ano varchar (4)
	select @periodoActual=valor from [BON_Parametros] where Id=9


	if (@periodoActual=01)
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	Set @Ano=@Ano-1	
	set @periodoAnterior=12
	print @periodoAnterior
	print @Ano
	end
	else
	begin
	select @Ano=valor from [BON_Parametros] where Id=10
	select @periodoAnterior=@periodoActual-1
	print @periodoAnterior
	print @Ano
	end
	delete from [BON_Parametros-1]
	insert into [BON_Parametros-1]
	select * from BON_Parametros_Historico where Periodo=@periodoAnterior and Ano=@Ano

	---- Carga las ventas del historico para este periodo
	delete from [BON_Liquidacion_Ventas-1]
	insert into [BON_Liquidacion_Ventas-1]
	select * from BON_Liquidacion_Ventas_Hist
	where CAST(MesLiquidacion as  int)=@periodoAnterior
	and CAST(AñoLiquidacion as int)=@Ano

	---Trae las bonificaciones asosiadas a este periodo.

	delete   from  [BON_BonificacionEspecial-1]
	insert into [BON_BonificacionEspecial-1]
	select *  from [BON_BonificacionEspecial_Hist]
	where Mes=@periodoAnterior
	and Ano=@Ano
	
	--- Limpia Tabla de Resultados
	delete from [BON_Resultados-1]
	insert into [BON_Resultados-1]
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
    ,0 as TotalVentasVAlidas 
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as TotalPorcentajeCumplimiento
	,0 as AsistenciaTotal
	,0 as AsistenciaDesDirector
	,0 as AsistenciaDesGerente
	,0 as Ausentismos
	,0 as AsesoresXoficina
	,0 as PorcentajeAsesoresCalculo
	,0 as PorcentajeAsesoresConNVentasValidasXOficina
	,0 as PorcentajeAsesoresConNVentasValidasXoficinaCE
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalPlanesComisinesXoficina
	,0 as TotalComisinesValidasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
	,0 as PermanenciaTotalOficina
	,0 as PermanenciaDiferidaOficina
	,0 as PermanenciaDirector
	,0 as TotalVentasUsadosXzona
	,0 as TotalVentasNuevosXzona
	,0 as TotalVentasXzona
	,0 as TotalVentasAprobadasXzona
	,0 as TotalCumplimientoPresupuestoXzona
	,0 as AsesoresXzona
	,0 as PorcentajeBaseAsesoresCalculoXzona
	,0 as PorcentajeAsesoresConNventasValidasZona
	,0 as PorcentajeSinCeremoniaXZona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from [BON_Liquidacion_Ventas-1] 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from [BON_Liquidacion_Ventas-1] group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from [BON_Resultados-1] as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from [BON_Liquidacion_Ventas-1] as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacionPerma datetime;
			declare @fechaFinalLiquidacionPerma datetime;
			select @fechaInicialLiquidacionPerma=valor from [BON_Parametros-1] where Id=6
			select @fechaFinalLiquidacionPerma=valor from [BON_Parametros-1] where Id=7
			set @fechaInicialLiquidacionPerma=dateadd(M,1,@fechaInicialLiquidacionPerma) --- +1 meses ya que es la permanencia actual
			set @fechaFinalLiquidacionPerma=dateadd(M,1,@fechaFinalLiquidacionPerma)

				
						UPDATE [BON_Liquidacion_Ventas-1] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

						UPDATE [BON_Liquidacion_Ventas-1] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=22) 
									and insdCumPerTotal>=(select valor from [BON_Parametros-1] where Id=23)
									or finalCumPerTotal>=(select valor from [BON_Parametros-1] where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

---Calcula la Asistencia del mes Anterior
declare @fechaInicioActual datetime,
@fechaFinActual datetime

Select @fechaInicioActual= valor from [BON_Parametros-1] where Id=6
Select @fechaFinActual= valor from [BON_Parametros-1] where Id=7


 Exec BON_CargarAsistencia @fechaInicioActual, @fechaFinActual

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from [BON_Resultados-1] as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from [BON_Resultados-1] as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

	  declare @query as varchar (max)	
	 ----Recalcula las llamadas de Bienvenida
	
	        declare @ServidorChevyPlanApp varchar(100)
            declare @BaseDatosChevyplanApp varchar(100)
            select @ServidorChevyPlanApp = Servidor, @BaseDatosChevyplanApp= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=6 --ChevyplanApp pasas a 6 y la tabla callDetailHist
            
            declare @Servidorconfig_epro varchar(100)
            declare @BaseDatosconfig_epro varchar(100)
            select @Servidorconfig_epro = Servidor, @BaseDatosconfig_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --config_epro
  			SET @query = 
			--Identifica que el contrato se encuentre en unified


			--Identifica las llamadas que cumplen la tipificacion
			'UPDATE [BON_Liquidacion_Ventas-1] SET LlamadaBV = 1
             WHERE CONTRATO IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from [BON_Parametros-1] as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from [bon_liquidacion_ventas-1] as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' 		

			 )'
			 exec (@query)

 ----Recalcula las llamadas de Bienvenida
			   --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
			declare @Ceremonia varchar (50)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=2	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
			select @Ceremonia=valor from [BON_Parametros-1] where Id=8
			print @ceremonia
			set @Ceremonia= SUBSTRING(@Ceremonia,7,4)+SUBSTRING(@Ceremonia,4,2)
			print @ceremonia
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas-1] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT Contrato FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

			 exec (@query)


--------Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from [BON_Liquidacion_Ventas-1])
		 and pre.Periodo=(Select top (1) MesLiquidacion from [BON_Liquidacion_Ventas-1])
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

---------Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from [BON_Liquidacion_Ventas-1] 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from [BON_Resultados-1] as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from [BON_Liquidacion_Ventas-1]
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from [BON_Resultados-1] as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from [BON_Resultados-1] as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from [BON_Resultados-1] as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 as resultado
    from [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from [BON_Resultados-1] as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 as resultado
     		FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from [BON_Resultados-1] as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)


	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados-1] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalOficina>=(select valor from [BON_Parametros-1] where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados-1] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from [BON_Parametros-1] where Id=23)
				or PermanenciaTotalZona>=(select valor from [BON_Parametros-1] where Id=24)	
				

			 UPDATE [BON_Resultados-1] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=29)
	

			 UPDATE [BON_Resultados-1] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from [BON_Parametros-1] where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from [BON_Liquidacion_Ventas-1] as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from [BON_Liquidacion_Ventas-1])
	and ret.Ano=(select top 1 AñoLiquidacion from [BON_Liquidacion_Ventas-1])
	

END

GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultados-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_IniciarResultados-2] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


	declare @periodoAnterior varchar (2)
	declare @periodoActual varchar (2)
	declare @Ano varchar (4)
	select @periodoActual=valor from [BON_Parametros-1] where Id=9


	if (@periodoActual=01)
	begin
	select @Ano=valor from [BON_Parametros-1] where Id=10
	Set @Ano=@Ano-1	
	set @periodoAnterior=12
	print @periodoAnterior
	print @Ano
	end
	else
	begin
	select @Ano=valor from [BON_Parametros-1] where Id=10
	select @periodoAnterior=@periodoActual-1
	print @periodoAnterior
	print @Ano
	end
	delete from [BON_Parametros-2]
	insert into [BON_Parametros-2]
	select * from BON_Parametros_Historico where Periodo=@periodoAnterior and Ano=@Ano

	--- Carga las ventas asociadas para este periodo del historico
	delete from [BON_Liquidacion_Ventas-2]
	insert into [BON_Liquidacion_Ventas-2]
	select * from BON_Liquidacion_Ventas_Hist
	where CAST(MesLiquidacion as  int)=@periodoAnterior
	and CAST(AñoLiquidacion as int)=@Ano

		---Trae las bonificaciones asosiadas a este periodo.

	delete   from  [BON_BonificacionEspecial-2]
	insert into [BON_BonificacionEspecial-2]
	select *  from [BON_BonificacionEspecial_Hist]
	where Mes=@periodoAnterior
	and Ano=@Ano

	
	
	--- Limpia Tabla de Resultados
	delete from [BON_Resultados-2]
	insert into [BON_Resultados-2]
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
    ,0 as TotalVentasVAlidas 
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as TotalPorcentajeCumplimiento
	,0 as AsistenciaTotal
	,0 as AsistenciaDesDirector
	,0 as AsistenciaDesGerente
	,0 as Ausentismos
	,0 as AsesoresXoficina
	,0 as PorcentajeAsesoresCalculo
	,0 as PorcentajeAsesoresConNVentasValidasXOficina
	,0 as PorcentajeAsesoresConNVentasValidasXoficinaCE
	,0 as TotalVentasUsadosXoficina
	,0 as TotalVentasNuevosXoficina
	,0 as TotalVentasXoficina
	,0 as TotalVentasAprobadasXoficina
	,0 as TotalPlanesComisinesXoficina
	,0 as TotalComisinesValidasXoficina
	,0 as TotalParticipantesCeremoniaXoficina
	,0 as PorcentajeSinCeremoniaXoficina
	,0 as PermanenciaTotalOficina
	,0 as PermanenciaDiferidaOficina
	,0 as PermanenciaDirector
	,0 as TotalVentasUsadosXzona
	,0 as TotalVentasNuevosXzona
	,0 as TotalVentasXzona
	,0 as TotalVentasAprobadasXzona
	,0 as TotalCumplimientoPresupuestoXzona
	,0 as AsesoresXzona
	,0 as PorcentajeBaseAsesoresCalculoXzona
	,0 as PorcentajeAsesoresConNventasValidasZona
	,0 as PorcentajeSinCeremoniaXZona
	,0 as PermanenciaTotalZona	
	,0 as PermanenciaDiferidaZona
	,0 as PermanenciaGerente
	
	from [BON_Liquidacion_Ventas-2] 
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from [BON_Liquidacion_Ventas-2] group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from [BON_Resultados-2] as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

--	Update que clasifica los asesores a que tipo pertenecen si son especializados o Tradicionales	 
			 update  liv set liv.TipoOficina=2  from [BON_Liquidacion_Ventas-2] as liv
			inner join BON_Asesores as ase on (ase.OficCodigo=liv.CodOficina)
			where  
			ase.OficNombre like '%canal Especializado%'
			or  ase.OficNombre like '%Premium%' or ase.OficNombre like '%Empresario Movil%'

	-----Valida La permanencia de Asesores


			declare @fechaInicialLiquidacionPerma datetime;
			declare @fechaFinalLiquidacionPerma datetime;
			select @fechaInicialLiquidacionPerma=valor from [BON_Parametros-2] where Id=6
			select @fechaFinalLiquidacionPerma=valor from [BON_Parametros-2] where Id=7
			set @fechaInicialLiquidacionPerma=dateadd(M,1,@fechaInicialLiquidacionPerma) --- +1 meses ya que es la permanencia actual
			set @fechaFinalLiquidacionPerma=dateadd(M,1,@fechaFinalLiquidacionPerma)

				
						UPDATE [BON_Liquidacion_Ventas-2] SET Permanencia = 1
							where CodVendedor not in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist ) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
									and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

						UPDATE [BON_Liquidacion_Ventas-2] SET Permanencia = 1
							where CodVendedor in 
								(select codAsesor from (
								select codAsesor,fecActualiza  from SCO_CumplimientoPersistencia_hist 
									where finalCumPerTotal>=(select valor from [BON_Parametros-2] where Id=22) 
									and insdCumPerTotal>=(select valor from [BON_Parametros-2] where Id=23)
									or finalCumPerTotal>=(select valor from [BON_Parametros-2] where Id=24)) as T1
									where cast(T1.fecActualiza as datetime)>=Cast(Convert(Varchar(50),@fechaInicialLiquidacionPerma)as datetime)
			and cast(T1.fecActualiza as datetime)<=Cast(Convert(Varchar(50),@fechaFinalLiquidacionPerma) as datetime)
									)

---Calcula la Asistencia del mes Anterior
declare @fechaInicioActual datetime,
@fechaFinActual datetime

Select @fechaInicioActual= valor from [BON_Parametros-2] where Id=6
Select @fechaFinActual= valor from [BON_Parametros-2] where Id=7


 Exec BON_CargarAsistencia @fechaInicioActual, @fechaFinActual

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from [BON_Resultados-2] as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from [BON_Resultados-2] as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)

	  declare @query as varchar (max)	
	 ----Recalcula las llamadas de Bienvenida
	
	        declare @ServidorChevyPlanApp varchar(100)
            declare @BaseDatosChevyplanApp varchar(100)
            select @ServidorChevyPlanApp = Servidor, @BaseDatosChevyplanApp= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=6 --ChevyplanApp pasas a 6 y la tabla callDetailHist
            
            declare @Servidorconfig_epro varchar(100)
            declare @BaseDatosconfig_epro varchar(100)
            select @Servidorconfig_epro = Servidor, @BaseDatosconfig_epro= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=7 --config_epro
  			SET @query = 
			--Identifica que el contrato se encuentre en unified


			--Identifica las llamadas que cumplen la tipificacion
			'UPDATE [BON_Liquidacion_Ventas-2] SET LlamadaBV = 1
             WHERE CONTRATO IN (		 
			 select distinct Contrato from(
				select cdt.Dato1 as Contrato,cld.submotivo as Motivo,cld.fechaGestion  as FechaTip from [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CallData as cdt 
				inner join [' + @ServidorChevyPlanApp +'].'+ @BaseDatosChevyplanApp + '.dbo.CollectionData as cld on (cdt.RecordID=cld.RecordID)
				where cld.fechaGestion>=(Select Valor from [BON_Parametros-2] as par where par.Id=6) and cld.fechaGestion<=GETDATE() 
				and cdt.Dato1 in (select liv.Contrato from [BON_Liquidacion_Ventas-2] as liv)
				) as t1
				where  t1.Motivo = ''EFECTIVA CON NOVEDAD'' OR t1.Motivo = ''LLAMADA EFECTIVA'' 		

			 )'
			 exec (@query)

 ----Recalcula las llamadas de Bienvenida
			   --Ceremonia
            declare @ServidorCeremonia varchar(100)
            declare @BaseDatosCeremonia varchar(100)
			declare @Ceremonia varchar (50)
            select @ServidorCeremonia = Servidor, @BaseDatosCeremonia= BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=2	--Chevyasam
			print (@servidorCeremonia)
			print (@basedatosceremonia)		
			select @Ceremonia=valor from [BON_Parametros-2] where Id=8
			print @ceremonia
			set @Ceremonia= SUBSTRING(@Ceremonia,7,4)+SUBSTRING(@Ceremonia,4,2)
			print @ceremonia
  			SET @query = 'UPDATE [BON_Liquidacion_Ventas-2] SET Asamblea = 1
             WHERE CONTRATO IN (SELECT Contrato FROM [' + @ServidorCeremonia +'].'+ @BaseDatosCeremonia + '.[dbo].[HIS_asamblea_participantes] 
             where SubString(cast(Cod_Asamblea as varchar),1,4)+SubString(cast(Cod_Asamblea as varchar),5,2) >= '''+@Ceremonia+''' AND Estado = ''P'')'

			 exec (@query)


--------Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from [BON_Liquidacion_Ventas-2])
		 and pre.Periodo=(Select top (1) MesLiquidacion from [BON_Liquidacion_Ventas-2])
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc

---------Calcula el porcentaje sin ceremonia X Zona
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodZona,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from [BON_Liquidacion_Ventas-2] 
				  group by CodZona	
	update res set res.PorcentajeSinCeremoniaXzona=bvt.VentasTotales from [BON_Resultados-2] as res
	inner Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo) 


	
	--Calcula el porcentaje sin ceremonia X Oficina
	  delete from BON_VentasTotales
	  insert BON_VentasTotales
				  select CodOficina,(COUNT(*)-cast(SUM(Asamblea)as numeric))/COUNT(*)*100 as ProrcentajeSinCeremonia 
				  from [BON_Liquidacion_Ventas-2]
				  group by CodOficina
	update res set res.PorcentajeSinCeremoniaXoficina=bvt.VentasTotales from [BON_Resultados-2] as res
	inner Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo) 


  --Calcula persistencia Total por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 
	SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal>0
  group by CodConcesionario

  	update res set res.PermanenciaTotalOficina=isnull(bvt.VentasTotales,100) from [BON_Resultados-2] as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	
  --Calcula persistencia Diferida por oficina que aplica a Director
  delete from BON_VentasTotales
	  insert BON_VentasTotales
  SELECT 
    CodConcesionario, 

	SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 
	 as resultado
     
  FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and InsdTotCliPerTotal>0
  group by CodConcesionario


  	update res set res.PermanenciaDiferidaOficina=isnull(bvt.VentasTotales,100) from [BON_Resultados-2] as res
	left Join BON_VentasTotales as bvt on (res.codOficina=bvt.Codigo)

	--- Calcula persistencia Total por Zona que aplica a GErente
	
	delete from BON_VentasTotales
	  insert BON_VentasTotales
	  SELECT 
    CodZona, SUM(cast(FinalTotCliDiaTotal as numeric))/Sum(cast(FinalTotCliPerTotal as numeric))*100 as resultado
    from [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
	  where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
		and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
		and FinalTotCliPerTotal >0
	group by CodZona


	update res set res.PermanenciaTotalZona=isnull(bvt.VentasTotales,100) from [BON_Resultados-2] as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)

	
--Calcula persistencia Diferida por Zona que aplica a GErente
  delete from BON_VentasTotales
	  insert BON_VentasTotales
		SELECT 
			CodZona, 
			SUM(cast(InsdTotCliDiaTotal as numeric))/Sum(cast(InsdTotCliPerTotal as numeric))*100 as resultado
     		FROM [Bonificacion_desarrollo].[dbo].[SCO_CumplimientoPersistencia_Hist] 
			where cast(fecActualiza as datetime)>=@fechaInicialLiquidacionPerma
			and cast(fecActualiza as datetime)<=@fechaFinalLiquidacionPerma
			and InsdTotCliPerTotal>0
			group by CodZona


  	update res set res.PermanenciaDiferidaZona=isnull(bvt.VentasTotales,100) from [BON_Resultados-2] as res
	left Join BON_VentasTotales as bvt on (res.codZona=bvt.Codigo)


	--Valida la permanencia del director que esta en la base
		UPDATE [BON_Resultados-2] SET PermanenciaDirector = 1
		where 
				PermanenciaTotalOficina>=(select valor from [BON_Parametros-2] where Id=22) 
				and PermanenciaDiferidaOficina>=(select valor from [BON_Parametros-2] where Id=23)
				or PermanenciaTotalOficina>=(select valor from [BON_Parametros-2] where Id=24)
								

	--Valida la permanencia del Gerente que esta en la base
		UPDATE [BON_Resultados-2] SET PermanenciaGerente = 1
				where 
				PermanenciaTotalZona>=(select valor from [BON_Parametros-2] where Id=22) 
				and PermanenciaDiferidaZona>=(select valor from [BON_Parametros-2] where Id=23)
				or PermanenciaTotalZona>=(select valor from [BON_Parametros-2] where Id=24)	
				

			 UPDATE [BON_Resultados-2] SET AsistenciaDesEquiGer = 1
			 where DiasAsistidos >=(select valor from [BON_Parametros-2] where Id=29)
	

			 UPDATE [BON_Resultados-2] SET AsistenciaDesEquiDir = 1
          where DiasAsistidos >=(select valor from [BON_Parametros-2] where Id=18)


		  	--Asigna las ventas a un RetoGerente			


  	update liv set liv.NumeroReto=isnull(ret.NumeroReto,0) from [BON_Liquidacion_Ventas-2] as liv
	left Join BON_Retos as ret on (liv.FechaPago>=ret.FechaInicialReto and liv.FechaPago<= dateadd(d,1,FechaFinalReto))
	where ret.Periodo=(select top 1 MesLiquidacion from [BON_Liquidacion_Ventas-2])
	and ret.Ano=(select top 1 AñoLiquidacion from [BON_Liquidacion_Ventas-2])
	

END

GO
/****** Object:  StoredProcedure [dbo].[BON_IniciarResultadosComisiones]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_IniciarResultadosComisiones]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--- Limpia Tabla de Resultados
	delete from BON_ResultadosComisiones
	insert into BON_ResultadosComisiones
	select distinct CodVendedor
	,0 as Cedula
	,0 as CodigoZona
    ,0 as CodigoOficina 
	,0 as TotalVentasRegsitradas
	,0 as TotalComisionesVAlidas 
	,0 as TotalVAlorPlan
	,0 as AsistenciaTotal
	,0 as Ausentismos	
	from BON_PamVentasOutsorsing
	---- Detecta el total de ventas registradas por asesor
	delete from BON_VentasTotales
	insert into BON_VentasTotales
	select codVendedor,count(CodVendedor) as VentasRegistradas
	 from BON_PamVentasOutsorsing group by CodVendedor
	update res set res.TotalVentasRegistradas=bvt.VentasTotales from BON_ResultadosComisiones as res
	inner Join BON_VentasTotales as bvt on (res.codVend=bvt.Codigo) 

	--Detecta la asistencia y ausentismo de los codigos de vendedor
		update res
	set res.cedula=ast.Cedula ,res.DiasAsistidos=ast.DiasLaborados-isnull(aus.Ausentismos,'0'), res.Ausentismos=isnull(aus.Ausentismos,'0')
	 from BON_ResultadosComisiones as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	 inner join BON_AsistenciaTotal as ast on (ase.VendIdeNro=ast.Cedula)
	 left join BON_Ausentismos as aus on (ast.Cedula=aus.Cedula)
	 -- Detecta la oficiona y la zona a la que pertenece cada vendedor
	 update res
	set  res.codZona=ase.RegiCodigo,res.codOficina=ase.OficCodigo
	 from BON_ResultadosComisiones as res 
	 inner join BON_Asesores as ase on (res.codVend=ase.VendCodigo)
	select * from BON_ResultadosComisiones
END

GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion]
	-- Add the parameters for the stored procedure here
 @idBonificacion int ,
 @idPlan int,
@usuario varchar(20),
@Observacion varchar(max),
@periodo int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 -- Especial Asesor x Valor de Plan
---------------------- Especial Asesor x Monto de Ventas
--declare @tipoOfi int
declare @tipoOfi int


	

 if(@idPlan=1 or @idPlan=2 or @idPlan=9)
	begin
	
	if(@idPlan=1 or @idPlan=2)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=9 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

    Exec BON_CalcularVentasTotales @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales as Total,
	 case
	 when cph.InsdTotCliPerTotal=0 then 100
	 when cph.InsdCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else cph.InsdCumPerTotal
	 end as permanenciaDiferida,
	 case
	 when cph.FinalCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else  cph.FinalCumPerTotal end as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then 
		case
		when 
		@idPlan=9
		then 
		bes.ValorBono*blv.ValorPlan/100 
		else
		bes.ValorBono
		end
	 else 0 
	 end as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_Resultados as res	  
	  inner join  BON_Liquidacion_Ventas as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from BON_Parametros where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from BON_Parametros where Id=7)))
	   where 
	  blv.ventaValida=1
	  and blv.CodCargoAsesor=3
	  and TipoOficina=@tipoOfi
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	 
	
	 end

	---Comisiones Asesor
	if(@idPlan=13)
	begin
	

    Exec BON_CalcularVentasTotales @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales,
	 case
	 when
	 cph.InsdTotCliPerTotal=0 then 100
	 else isnull(cph.InsdCumPerTotal,100) 
	 end as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 bes.ValorBono*blv.ValorPlan/100  as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_ResultadosComisiones as res	  
	  inner join  BON_PamVentasOutsorsing as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from BON_Parametros where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from BON_Parametros where Id=7)))
	   where 
	  blv.ComisionValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	
	 end
	---
-------------------- Grupal Asesor
	else if(@idPlan=3 or @idPlan=10)
	 begin

	 if( @idPlan=3)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=10)
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales
	
	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
    case
	 when cph.InsdTotCliPerTotal=0 then 100
	 when cph.InsdCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else cph.InsdCumPerTotal
	 end as permanenciaDiferida,
	 case
	 when cph.FinalCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else  cph.FinalCumPerTotal end as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bes.ValorBono 
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from BON_Resultados as res
	 inner join  BON_Liquidacion_Ventas as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from BON_Parametros where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from BON_Parametros where Id=7)))
	   where 
	 blv.ventaValida=1
	 and blv.CodCargoAsesor=3
	 and TipoOficina=@tipoOfi
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1
	 end
	
	


---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5 or @idPlan=11 or @idPlan=12)
	 begin		
	 
	 if(@idPlan=4 or @idPlan=5)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=11 or @idPlan=12 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end
	 						 
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 

	select * from BON_VentasTotales
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
			    res.PermanenciaDiferidaOficina as permanenciaDiferida,
				res.PermanenciaTotalOficina as permanenciaTotal,
				case 
				 when res.PermanenciaDirector=0 
				 then			 
				0
				when 
				 @idPlan=5 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				when 
				 @idPlan=11 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				else
				cast(round(cast(bes.ValorBono as numeric),0,0) as int) 
				end 
				as ValorRealBono, 
				blv.MesLiquidacion as periodo,
				blv.AñoLiquidacion as año,
				isnull(ast.DiasLaborados,0)-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
				inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo) 
				left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				Inner join BON_Resultados as res on (res.codOficina=ases.OficCodigo)
			
				where 
				TipoOficina=@tipoOfi
				and ases.VendCodigo=pre.CodigoDirector
				and pre.Periodo=@periodo
				and pre.Ano=@ano
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			where T1.rn=1 
	 end


	 
------------Especial Director
	else if (@idPlan=6 or  @idPlan=17)
	begin

	if(@idPlan=6)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=17)
	begin 
	
	set @tipoOfi=2 -- CanalEspecializado
	
	end



	Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,
		case
		when res.PermanenciaDirector=0
		then
		0
		when 
		res.VentasRegistradasSinCeremoniaXoficina>res.VentasMaximasSinCeremoniaXoficina  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from BON_Parametros where id= 28)/100
		when 
		res.VentasRegistradasSinCeremoniaXoficina>res.VentasMaximasSinCeremoniaXoficina   
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from BON_Parametros where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		isnull(ast.DiasLaborados,0)-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
		inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo) 
		left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and TipoOficina=@tipoOfi
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end


------------Comision Director
	else if (@idPlan=16)
	begin

	Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 
	insert into  BON_LiquidacionBonificaciones

Select distinct
		blv.Contrato as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		isnull(ases.RegiCodigo,0),
		blv.CodOficina,
		blv.CodigoDirector,
		blv.IdeDirector,
		bbt.VentasTotales,
		0 as permanenciaDiferida,
		0 as permanenciaTotal,		
		bes.ValorBono*blv.ValorPlan/100 ---- se pasa de porcentaje a relativo y se calcula
		as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		isnull(ast.DiasLaborados,0)-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual
	--	,ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo)
	,1 as 'rn'	  
		
		from BON_PamVentasOutsorsing as blv
		inner join BON_VentasTotales as bbt on (blv.CodigoDirector=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
		left join BON_AsistenciaTotal as ast on  (ast.Cedula=blv.IdeDirector) -- Valida que el director este en kactus
		left join BON_Asesores as ases on (ases.VendCodigo=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=blv.IdeDirector)

		where 
		blv.ComisionValida=1 
     	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	
	 end
	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales

				select * from(
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case  
					 when
					 res.PermanenciaGerente=0 --or res.TotalCumplimientoPresupuestoXzona<=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.VentasRegistradasSinCeremoniaXzona>res.VentasMaximasSinCeremoniaXzona   and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(isnull(ast.DiasLaborados,30) as numeric),0,0) as int)*(Select Valor from BON_Parametros where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(isnull(ast.DiasLaborados,30) as numeric),0,0) as int)	
					 end as ValorRealBono,
					 blv.MesLiquidacion as periodo,
					 blv.AñoLiquidacion as año,
					 isnull(ast.DiasLaborados,0)-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
					 inner join BON_Liquidacion_Ventas as blv on (blv.CodZona=bbt.Codigo) 
					 left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_Resultados as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				
					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					 and pre.Periodo=@periodo
					and pre.Ano=@ano
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales


				select * from(

					 

					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case 
					 when
					 res.PermanenciaGerente=0
					 then
					 0
					 --Comentariado por cambio en las reglas del plan
					 --when 
					 --res.TotalCumplimientoPresupuestoXzona<=(Select Valor from BON_Parametros where Id=25)-- Cuota minima de Cumplimiento
					 --then
					 --0
					 when 
					 res.VentasRegistradasSinCeremoniaXzona>res.VentasMaximasSinCeremoniaXzona  and bbt.VentasTotales <pxz.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric),0,0) as int)*(Select Valor from BON_Parametros where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo as periodo,
					 ret.Ano as año,
					isnull(ast.DiasLaborados,0)-ISNULL(aus.Ausentismos,0)  as diasAsistidos,
					isnull(aus.Ausentismos,0) as Ausentismos,
					 'Reto'+Cast(ret.NumeroReto as varchar(10)) as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_Retos as ret  on(ret.CodigoGerente=ases.VendCodigo)
					 inner join BON_VentasTotales as bbt on (ret.IdBonificacion=bbt.Codigo)					 
					 left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_Resultados as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and ret.Periodo=@periodo
					 and ret.Ano=@ano
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.IdPLan=@idPlan and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	-------------------- Grupal Asesor Participantes en Ceremonia
	else if(@idPlan=14 )
	 begin

	
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 case
	 when cph.InsdTotCliPerTotal=0 then 100
	 when cph.InsdCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else cph.InsdCumPerTotal
	 end as permanenciaDiferida,
	 case
	 when cph.FinalCumPerTotal is null and blv.Permanencia=0 then 0
	 when cph.InsdCumPerTotal is null and blv.Permanencia=1 then 100
	 else  cph.FinalCumPerTotal end as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from BON_Resultados as res
	 inner join  BON_Liquidacion_Ventas as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from BON_Parametros where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from BON_Parametros where Id=7)))
 where 
    blv.CodCargoAsesor=3
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	 	-------------------- Grupal Director Participantes en Ceremonia
	else if(@idPlan=15 )
	 begin

	
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 res.PermanenciaDiferidaOficina as permanenciaDiferida,
	 res.PermanenciaTotalOficina as permanenciaTotal,
	 case 
	 when res.PermanenciaDirector=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 isnull(ast.DiasLaborados,0)-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo) 
		left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoDirector 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=1 --Director 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	
	 	-------------------- Grupal Gerente cumplimiento permanencia
	else if(@idPlan=18)
	 begin
	 	 
    Exec BON_CalcularVentasTotales @idBonificacion, @idPlan

	 insert into BON_LiquidacionBonificacionesGrupales
	 
	
	 select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales as metaAlcanzada,
	 res.PermanenciaDiferidaZona as permanenciaDiferida,
	 res.PermanenciaTotalZona as permanenciaTotal,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 isnull(ast.DiasLaborados,0)-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
		inner join BON_Liquidacion_Ventas as blv on (blv.CodZona=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes on (bes.ID=@idBonificacion) 
		left join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados as res on (res.codZona=blv.CodZona) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoGerente 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=4 --Gerente 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1

	   End

	   
	/*	declare @idBonificacion int =309,
 @idPlan int =8,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=2,
@ano int=2020 */
	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion_RecuPerma]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion_RecuPerma]
	-- Add the parameters for the stored procedure here
 @idBonificacion int ,
 @idPlan int,
@usuario varchar(20),
@Observacion varchar(max),
@periodo int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 -- Especial Asesor x Valor de Plan
---------------------- Especial Asesor x Monto de Ventas
--declare @tipoOfi int
declare @tipoOfi int


 if(@idPlan=1 or @idPlan=2 or @idPlan=9)
	begin
	
	if(@idPlan=1 or @idPlan=2)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=9 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

    Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,codVend,T1.Cedula,Total,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales as Total,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then 
		case
		when 
		@idPlan=9
		then 
		bes.ValorBono*blv.ValorPlan/100 
		else
		bes.ValorBono
		end
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_Resultados_Recu as res	  
	  inner join  BON_Liquidacion_Ventas_Recu as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ventaValida=1
	  and TipoOficina=@tipoOfi
	--  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	  )as t1
	  inner join BON_LiquidacionBonificaciones_Final  as lbf on(t1.Contrato=lbf.Contrato and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono

	 end

	---
	/*
	---Comisiones Asesor
	if(@idPlan=13)
	begin
	

    Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 bes.ValorBono*blv.ValorPlan/100  as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_Resultados_Recu as res	  
	  inner join  BON_Liquidacion_Ventas_Recu as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ComisionValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	
	 end
	 */
	---
-------------------- Grupal Asesor
	else if(@idPlan=3 or @idPlan=10)
	 begin

	 if( @idPlan=3)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=10)
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

	  Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.CodVendedor,T1.Cedula,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bes.ValorBono 
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from BON_Resultados_Recu as res
	 inner join  BON_Liquidacion_Ventas_Recu as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	 blv.ventaValida=1
	 and TipoOficina=@tipoOfi
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 
     inner join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.CodVendedor=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1
	 end
	
	


---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5 or @idPlan=11 or @idPlan=12)
	 begin		
	 
	 if(@idPlan=4 or @idPlan=5)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=11 or @idPlan=12 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end
	 
	  Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 

	 insert into  BON_LiquidacionBonificacionesGrupales

		Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
			    res.PermanenciaDiferidaOficina as permanenciaDiferida,
				res.PermanenciaTotalOficina as permanenciaTotal,
				case 
				 when res.PermanenciaDirector=0 
				 then			 
				0
				when 
				 @idPlan=5 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				when 
				 @idPlan=11 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				else
				cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int) 
				end 
				as ValorRealBono, 
				 blv.MesLiquidacion,
				blv.AñoLiquidacion,
				ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
				inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodOficina=bbt.Codigo) 
				inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				Inner join BON_Resultados_Recu as res on (res.codOficina=ases.OficCodigo)
			
				where 
				TipoOficina=@tipoOfi
				and ases.VendCodigo=pre.CodigoDirector
				and pre.Periodo=blv.MesLiquidacion
				and pre.Ano=blv.AñoLiquidacion
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			   inner join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1

	 end


	 
------------Especial Director
	else if (@idPlan=6 or  @idPlan=17)
	begin

	if(@idPlan=6)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=17)
	begin 
	
	set @tipoOfi=2 -- CanalEspecializado
	
	end



	Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
			Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,
		case
		when res.PermanenciaDirector=0
		then
		0
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from [BON_Parametros-1] where id= 28)/100
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from [BON_Parametros-1] where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		 blv.MesLiquidacion,
		 blv.AñoLiquidacion,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
		inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados_Recu as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and TipoOficina=@tipoOfi
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=blv.MesLiquidacion
		and pre.Ano=blv.AñoLiquidacion
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 
		inner join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1
	 end

	 /*
------------Comision Director
	else if (@idPlan=16)
	begin

	Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales

		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,		
		bes.ValorBono/30*cast(ast.DiasLaborados as numeric)/100*res.TotalPlanesComisionXoficina ----
		
		--bes.ValorBono*bbt.VentasTotales 
		as ValorRealBono,
		blv.MesLiquidacion,
		blv.AñoLiquidacion,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
		inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados_Recu as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=blv.MesLiquidacion
		and pre.Ano=blv.AñoLiquidacion
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end
	 */
/*	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales
				select * from(
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case  
					 when
					 res.PermanenciaGerente=0 or res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					 blv.MesLiquidacion as periodo,
					 blv.AñoLiquidacion as año,
					 ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
					 inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodZona=bbt.Codigo) 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_Resultados_Recu as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					 and pre.Periodo=@periodo
					and pre.Ano=@ano
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales


				select * from(

					 

					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case 
					 when
					 res.PermanenciaGerente=0
					 then
					 0
					 when 
					 res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and bbt.VentasTotales <pxz.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo as periodo,
					 ret.Ano as año,
					ast.DiasLaborados-ISNULL(aus.Ausentismos,0)  as diasAsistidos,
					isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_Retos as ret  on(ret.CodigoGerente=ases.VendCodigo)
					 inner join BON_VentasTotales as bbt on (ret.IdBonificacion=bbt.Codigo)					 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_Resultados_Recu as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and ret.Periodo=@periodo
					 and ret.Ano=@ano
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.IdPLan=@idPlan and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end

	 */
	-------------------- Grupal Asesor Participantes en Ceremonia
	else if(@idPlan=14 )
	 begin

	
	  Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.CodVendedor,T1.Cedula,T1.metaAlcanzada,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from BON_Resultados_Recu as res
	 inner join  BON_Liquidacion_Ventas_Recu as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,2,(select valor from [BON_Parametros-1] where Id=7)))
 where 
	 blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1
	   inner join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.CodVendedor=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1


	 end

	 	-------------------- Grupal Director Participantes en Ceremonia
	else if(@idPlan=15 )
	 begin

	
	  Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.metaAlcanzada,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono/2 as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 res.PermanenciaDiferidaOficina as permanenciaDiferida,
	 res.PermanenciaTotalOficina as permanenciaTotal,
	 case 
	 when res.PermanenciaDirector=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados_Recu as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoDirector 
  and pre.Periodo=blv.MesLiquidacion
  and pre.Ano=blv.AñoLiquidacion
 and ases.VendTipoVen=1 --Director 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1
	  inner join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1


	 end

	/*
	 	-------------------- Grupal Gerente cumplimiento permanencia
	else if(@idPlan=18)
	 begin
	 	 
    Exec BON_CalcularVentasTotales_Recu @idBonificacion, @idPlan

	 insert into BON_LiquidacionBonificacionesGrupales
	 
	
	 select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales as metaAlcanzada,
	 res.PermanenciaDiferidaZona as permanenciaDiferida,
	 res.PermanenciaTotalZona as permanenciaTotal,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
		inner join BON_Liquidacion_Ventas_Recu as blv on (blv.CodZona=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes on (bes.ID=@idBonificacion) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados_Recu as res on (res.codZona=blv.CodZona) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoGerente 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=4 --Gerente 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1

	   End
	   */
	/*	declare @idBonificacion int =309,
 @idPlan int =8,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=2,
@ano int=2020 */
	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion-1]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion-1]
	-- Add the parameters for the stored procedure here
 @idBonificacion int ,
 @idPlan int,
@usuario varchar(20),
@Observacion varchar(max),
@periodo int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 -- Especial Asesor x Valor de Plan
---------------------- Especial Asesor x Monto de Ventas
--declare @tipoOfi int
declare @tipoOfi int


	

 if(@idPlan=1 or @idPlan=2 or @idPlan=9)
	begin
	
	if(@idPlan=1 or @idPlan=2)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=9 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales as Total,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then 
		case
		when 
		@idPlan=9
		then 
		bes.ValorBono*blv.ValorPlan/100 
		else
		bes.ValorBono
		end
	 else 0 
	 end as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-1] as res	  
	  inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ventaValida=1
	  and TipoOficina=@tipoOfi
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	 
	
	 end

	---
	if(@idPlan=13)
	begin
	

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 bes.ValorBono*blv.ValorPlan/100  as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-1] as res	  
	  inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ComisionValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	
	 end
	---
-------------------- Grupal Asesor
	else if(@idPlan=3 or @idPlan=10)
	 begin

	 if( @idPlan=3)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=10)
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales
	
	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bes.ValorBono 
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-1] as res
	 inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	 blv.ventaValida=1
	 and TipoOficina=@tipoOfi
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1
	 end
	
	


---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5 or @idPlan=11 or @idPlan=12)
	 begin		
	 
	 if(@idPlan=4 or @idPlan=5)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=11 or @idPlan=12 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end
	 						 
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 

	select * from BON_VentasTotales
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
			    res.PermanenciaDiferidaOficina as permanenciaDiferida,
				res.PermanenciaTotalOficina as permanenciaTotal,
				case 
				 when res.PermanenciaDirector=0 
				 then			 
				0
				when 
				 @idPlan=5 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				when 
				 @idPlan=11 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				else
				cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int) 
				end 
				as ValorRealBono, 
				blv.MesLiquidacion as periodo,
				blv.AñoLiquidacion as año,
				ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
				inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
				inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				Inner join [BON_Resultados-1] as res on (res.codOficina=ases.OficCodigo)
			
				where 
				TipoOficina=@tipoOfi
				and ases.VendCodigo=pre.CodigoDirector
				and pre.Periodo=@periodo
				and pre.Ano=@ano
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			where T1.rn=1 
	 end


	 
------------Especial Director
	else if (@idPlan=6 or  @idPlan=17)
	begin

	if(@idPlan=6)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=17)
	begin 
	
	set @tipoOfi=2 -- CanalEspecializado
	
	end



	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,
		case
		when res.PermanenciaDirector=0
		then
		0
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from [BON_Parametros-1] where id= 28)/100
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from [BON_Parametros-1] where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and TipoOficina=@tipoOfi
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end


------------Comision Director
	else if (@idPlan=16)
	begin

	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales

		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,		
		bes.ValorBono/30*cast(ast.DiasLaborados as numeric)/100*res.TotalPlanesComisionXoficina ----
		
		--bes.ValorBono*bbt.VentasTotales 
		as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end
	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales
				select * from(
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case  
					 when
					 res.PermanenciaGerente=0 or res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					 blv.MesLiquidacion as periodo,
					 blv.AñoLiquidacion as año,
					 ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
					 inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodZona=bbt.Codigo) 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join [BON_Resultados-1] as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					 and pre.Periodo=@periodo
					and pre.Ano=@ano
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales


				select * from(

					 

					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case 
					 when
					 res.PermanenciaGerente=0
					 then
					 0
					 when 
					 res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and bbt.VentasTotales <pxz.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo as periodo,
					 ret.Ano as año,
					ast.DiasLaborados-ISNULL(aus.Ausentismos,0)  as diasAsistidos,
					isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_Retos as ret  on(ret.CodigoGerente=ases.VendCodigo)
					 inner join BON_VentasTotales as bbt on (ret.IdBonificacion=bbt.Codigo)					 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join [BON_Resultados-1] as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and ret.Periodo=@periodo
					 and ret.Ano=@ano
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.IdPLan=@idPlan and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	-------------------- Grupal Asesor Participantes en Ceremonia
	else if(@idPlan=14 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-1] as res
	 inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
 where 
	 blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	 	-------------------- Grupal Director Participantes en Ceremonia
	else if(@idPlan=15 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 res.PermanenciaDiferidaOficina as permanenciaDiferida,
	 res.PermanenciaTotalOficina as permanenciaTotal,
	 case 
	 when res.PermanenciaDirector=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoDirector 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=1 --Director 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	
	 	-------------------- Grupal Gerente cumplimiento permanencia
	else if(@idPlan=18)
	 begin
	 	 
    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan

	 insert into BON_LiquidacionBonificacionesGrupales
	 
	
	 select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales as metaAlcanzada,
	 res.PermanenciaDiferidaZona as permanenciaDiferida,
	 res.PermanenciaTotalZona as permanenciaTotal,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodZona=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes on (bes.ID=@idBonificacion) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codZona=blv.CodZona) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoGerente 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=4 --Gerente 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1

	   End
	/*	declare @idBonificacion int =309,
 @idPlan int =8,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=2,
@ano int=2020 */
	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion-2]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion-2]
	-- Add the parameters for the stored procedure here
 @idBonificacion int ,
 @idPlan int,
@usuario varchar(20),
@Observacion varchar(max),
@periodo int,
@ano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 -- Especial Asesor x Valor de Plan
---------------------- Especial Asesor x Monto de Ventas
--declare @tipoOfi int
declare @tipoOfi int


	

 if(@idPlan=1 or @idPlan=2 or @idPlan=9)
	begin
	
	if(@idPlan=1 or @idPlan=2)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=9 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales as Total,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then 
		case
		when 
		@idPlan=9
		then 
		bes.ValorBono*blv.ValorPlan/100 
		else
		bes.ValorBono
		end
	 else 0 
	 end as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-2] as res	  
	  inner join  [BON_Liquidacion_Ventas-2] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=7)))
	   where 
	  blv.ventaValida=1
	  and TipoOficina=@tipoOfi
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	 
	
	 end

	---
	if(@idPlan=13)
	begin
	

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 bes.ValorBono*blv.ValorPlan/100  as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-2] as res	  
	  inner join  [BON_Liquidacion_Ventas-2] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=7)))
	   where 
	  blv.ComisionValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	
	 end
	---
-------------------- Grupal Asesor
	else if(@idPlan=3 or @idPlan=10)
	 begin

	 if( @idPlan=3)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=10)
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales
	
	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bes.ValorBono 
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-2] as res
	 inner join  [BON_Liquidacion_Ventas-2] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=7)))
	   where 
	 blv.ventaValida=1
	 and TipoOficina=@tipoOfi
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1
	 end
	
	


---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5 or @idPlan=11 or @idPlan=12)
	 begin		
	 
	 if(@idPlan=4 or @idPlan=5)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=11 or @idPlan=12 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end
	 						 
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 

	select * from BON_VentasTotales
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
			    res.PermanenciaDiferidaOficina as permanenciaDiferida,
				res.PermanenciaTotalOficina as permanenciaTotal,
				case 
				 when res.PermanenciaDirector=0 
				 then			 
				0
				when 
				 @idPlan=5 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-2] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				when 
				 @idPlan=11 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-2] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				else
				cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int) 
				end 
				as ValorRealBono, 
				blv.MesLiquidacion as periodo,
				blv.AñoLiquidacion as año,
				ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
				inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodOficina=bbt.Codigo) 
				inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				Inner join [BON_Resultados-2] as res on (res.codOficina=ases.OficCodigo)
			
				where 
				TipoOficina=@tipoOfi
				and ases.VendCodigo=pre.CodigoDirector
				and pre.Periodo=@periodo
				and pre.Ano=@ano
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			where T1.rn=1 
	 end


	 
------------Especial Director
	else if (@idPlan=6 or  @idPlan=17)
	begin

	if(@idPlan=6)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=17)
	begin 
	
	set @tipoOfi=2 -- CanalEspecializado
	
	end



	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,
		case
		when res.PermanenciaDirector=0
		then
		0
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-2] where id=27)  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from [BON_Parametros-2] where id= 28)/100
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-2] where id=27)  
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from [BON_Parametros-2] where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-2] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and TipoOficina=@tipoOfi
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end


------------Comision Director
	else if (@idPlan=16)
	begin

	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales

		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,		
		bes.ValorBono/30*cast(ast.DiasLaborados as numeric)/100*res.TotalPlanesComisionXoficina ----
		
		--bes.ValorBono*bbt.VentasTotales 
		as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-2] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end
	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales
				select * from(
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case  
					 when
					 res.PermanenciaGerente=0 or res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-2] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-2] where id=27)  and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-2] where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					 blv.MesLiquidacion as periodo,
					 blv.AñoLiquidacion as año,
					 ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join [BON_BonificacionEspecial-2] as bes  on(bes.ID=@idBonificacion)
					 inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodZona=bbt.Codigo) 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join [BON_Resultados-2] as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					 and pre.Periodo=@periodo
					and pre.Ano=@ano
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales


				select * from(

					 

					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case 
					 when
					 res.PermanenciaGerente=0
					 then
					 0
					 when 
					 res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-2] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-2] where id=27)  and bbt.VentasTotales <pxz.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-2] where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo as periodo,
					 ret.Ano as año,
					ast.DiasLaborados-ISNULL(aus.Ausentismos,0)  as diasAsistidos,
					isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_Retos as ret  on(ret.CodigoGerente=ases.VendCodigo)
					 inner join BON_VentasTotales as bbt on (ret.IdBonificacion=bbt.Codigo)					 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join [BON_Resultados-2] as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and ret.Periodo=@periodo
					 and ret.Ano=@ano
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.IdPLan=@idPlan and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end


	-------------------- Grupal Asesor Participantes en Ceremonia
	else if(@idPlan=14 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-2] as res
	 inner join  [BON_Liquidacion_Ventas-2] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-2] where Id=7)))
 where 
	 blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	 	-------------------- Grupal Director Participantes en Ceremonia
	else if(@idPlan=15 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 res.PermanenciaDiferidaOficina as permanenciaDiferida,
	 res.PermanenciaTotalOficina as permanenciaTotal,
	 case 
	 when res.PermanenciaDirector=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-2] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoDirector 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=1 --Director 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1


	 end

	
	 	-------------------- Grupal Gerente cumplimiento permanencia
	else if(@idPlan=18)
	 begin
	 	 
    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan

	 insert into BON_LiquidacionBonificacionesGrupales
	 
	
	 select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales as metaAlcanzada,
	 res.PermanenciaDiferidaZona as permanenciaDiferida,
	 res.PermanenciaTotalZona as permanenciaTotal,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-2] as blv on (blv.CodZona=bbt.Codigo)
		inner join [BON_BonificacionEspecial-2] as bes on (bes.ID=@idBonificacion) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-2] as res on (res.codZona=blv.CodZona) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoGerente 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=4 --Gerente 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1

	   End
	/*	declare @idBonificacion int =309,
 @idPlan int =8,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=2,
@ano int=2020 */
	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarReportes]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_LiquidarReportes] 
	-- Add the parameters for the stored procedure here
	 @usuario varchar(50),
	 @periodo int,
	 @año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

delete from BON_TotalBonificaciones
insert into  BON_TotalBonificaciones
select  distinct CodVendedor,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,MesLiquidacion,AñoLiquidacion,@Usuario,GETDATE() from BON_Liquidacion_Ventas
union select  distinct CodigoDirector,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@periodo,@año,@Usuario,GETDATE() from BON_Presupuesto
union select  distinct CodigoGerente,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@periodo,@año,@Usuario,GETDATE() from BON_Presupuesto

----Asesores Tradicionales
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=1
group by CodigoVendedor


update tob set tob.Bonificacion1=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=2
group by CodigoVendedor


update tob set tob.Bonificacion2=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=3
group by CodigoVendedor


update tob set tob.Bonificacion3=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

----Asesores Canal Especializado
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=9
group by CodigoVendedor


update tob set tob.Bonificacion9=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=10
group by CodigoVendedor


update tob set tob.Bonificacion10=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

-----Directores Tradicionales
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=4
group by CodigoVendedor


update tob set tob.Bonificacion4=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=5
group by CodigoVendedor


update tob set tob.Bonificacion5=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=6
group by CodigoVendedor


update tob set tob.Bonificacion6=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=14
group by CodigoVendedor


update tob set tob.Bonificacion14=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


-----Directores Canal Especializado
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=12
group by CodigoVendedor


update tob set tob.Bonificacion12=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=11
group by CodigoVendedor


update tob set tob.Bonificacion11=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=17
group by CodigoVendedor


update tob set tob.Bonificacion17=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=15
group by CodigoVendedor


update tob set tob.Bonificacion15=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)



----Gerente
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto1'
group by CodigoVendedor


update tob set tob.Reto1=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)



delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto2'
group by CodigoVendedor

update tob set tob.Reto2=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto3'
group by CodigoVendedor

update tob set tob.Reto3=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto4'
group by CodigoVendedor

update tob set tob.Reto4=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto5'
group by CodigoVendedor

update tob set tob.Reto5=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto6'
group by CodigoVendedor

update tob set tob.Reto6=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto7'
group by CodigoVendedor

update tob set tob.Reto7=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto8'
group by CodigoVendedor

update tob set tob.Reto8=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto9'
group by CodigoVendedor

update tob set tob.Reto9=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 
group by CodigoVendedor

update tob set tob.Bonificacion8=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=7
group by CodigoVendedor

update tob set tob.Bonificacion7=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=18
group by CodigoVendedor

update tob set tob.Bonificacion18=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptAsesoresPre]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptAsesoresPre] 
	-- Add the parameters for the stored procedure here
	-- @Periodo  int,
--	@Año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @usuario varchar(50)
	declare @periodo int
	declare @ano int

	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
    -- Insert statements for procedure here
	select distinct
liv.CodVendedor as 'CODIGO'
,res.Cedula AS 'CEDULA'
,liv.NomVendedor AS 'NOMBRE'
,liv.NomOficina AS 'CONCESIONARIO'
,lib.[PermanenciaDiferida%] as 'PERMANENCIA DIFERIDA'
,lib.[PermanenciaTotal%] AS 'PERMANENCIA TOTAL'
,liv.Permanencia AS 'CUMPLE PERMANENCIA'
,res.TotalCumplimientoPresupuestoXoficina AS 'CUMPLIMIENTO EQUIPO'
,lib.DiasAsistidos as 'DIAS LABORADOS'
,res.AsistenciaDesEquiDir AS 'CUENTA DES. EQUI DIRECTOR'
,res.AsistenciaDesEquiGer AS 'CUENTA DES. EQUI GERENTE'
,res.TotalVentasValidasXasesor AS 'VENTAS TOTALES VALIDAS'
,res.TotalValorPlan AS 'SUMA VALOR DEL PLAN'
,Case
when liv.TipoOficina=1
then 
tob.Bonificacion1
else
tob.Bonificacion9
end
as ' ESPECIAL # VENTAS'
,tob.Bonificacion2 as 'ESPECIAL VALOR DEL PLAN'
,Case
when liv.TipoOficina=1
then
tob.Bonificacion3
else
tob.Bonificacion10
end as 'GRUPAL'
,tob.Bonificacion14 as 'BASE DE CLIENTES'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,case
when liv.TipoOficina=1
then
tob.Bonificacion1+tob.Bonificacion2 +tob.Bonificacion3+tob.Bonificacion14+0+0 
else
tob.Bonificacion9+0 +tob.Bonificacion10+tob.Bonificacion14+0+0 
End as 'TOTAL BONIFICACION'
 from BON_Liquidacion_Ventas as liv
inner join BON_Resultados as res  on (res.codVend=liv.CodVendedor)
inner join BON_LiquidacionBonificaciones as lib on (lib.CodigoVendedor=liv.CodVendedor)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=liv.CodVendedor)
where lib.Periodo=liv.MesLiquidacion
and lib.Año=liv.AñoLiquidacion
and liv.CodCargoAsesor=3
END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptComisionAsesoresPre]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptComisionAsesoresPre]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @usuario varchar(50)
	declare @periodo int
	declare @ano int
	declare @contrato varchar (50)
	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
    -- Insert statements for procedure here

	select 
	pam.Contrato as 'Contrato',
	pam.Afiliado as 'Nombre del Cliente',
	pam.FechaVenta as 'Fecha de Ingreso de La Ventas',
	pam.ValorPlan as 'Valor Del Plan' ,
	case
	when
	ase.VendTipoVen=1
	then
	'DIRECTOR'
	else
	'ASESOR' end as 'Cargo',
	pam.CodVendedor as 'CODIGO Vendedor',
	pam.IdeVendedor as 'Identificacion Vendedor',
	pam.nombreVendedor as 'Nombre del Vendedor',
	pam.CodOficina as 'Codigo Oficina',
	pam.Oficina as 'Nombre del Equipo',
	pam.EstadoCupo as 'Estado del Cliente',
	pam.VentaInscripcion as 'No Habil. Tipo 2',
	pam.LlamadaBV as 'Estado Llamada',
	pam.NoExclucion as 'No Marca Excl',
	pam.Asamblea as 'Asamblea',
	pam.EstadoSICO as 'Estado Sico',
	pam.ComisionValida as 'Comision Valida',
	case
	when
	ase.VendTipoVen=1
	then
	0.00 
	else
	isnull(bes.ValorBono,0.00) end as '%Comision Asesor',
	case
	when
	ase.VendTipoVen=1
	then
	0.00 
	else	
	isnull(lib.ValorBono,0.00) end as 'Valor Comision Asesor'


 from BON_PamVentasOutsorsing as pam
left join BON_LiquidacionBonificaciones as lib on (pam.Contrato=lib.Contrato
and lib.IdPlan in (13) 
and lib.Periodo=pam.MesLiquidacion
and lib.Año=pam.AñoLiquidacion)
left join BON_BonificacionEspecial as bes on (bes.ID=lib.IdBonificacion)
left join BON_Asesores as ase on (ase.VendCodigo=pam.CodVendedor)

order by Contrato
END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptComisionDirectoresPre]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptComisionDirectoresPre]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @usuario varchar(50)
	declare @periodo int
	declare @ano int
	declare @contrato varchar (50)
	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
    -- Insert statements for procedure here
	select 
	pam.Contrato as 'Contrato',
	pam.Afiliado as 'Nombre del Cliente',
	pam.FechaVenta as 'Fecha de Ingreso de La Ventas',
	pam.ValorPlan as 'Valor Del Plan' ,
	case
	when
	ase.VendTipoVen=1
	then
	'DIRECTOR'
	else
	'ASESOR' end as 'Cargo',
	pam.CodigoDirector as 'CODIGO Director',
	pam.IdeDirector as 'Identificacion Director',
	pam.NombreDirector as 'Nombre del Director',
	pam.CodOficina as 'Codigo Oficina',
	pam.Oficina as 'Nombre del Equipo',
	pam.EstadoCupo as 'Estado del Cliente',
	pam.VentaInscripcion as 'No Habil. Tipo 2',
	pam.LlamadaBV as 'Estado Llamada',
	pam.NoExclucion as 'No Marca Excl',
	pam.Asamblea as 'Asamblea',
	pam.EstadoSICO as 'Estado Sico',
	pam.ComisionValida as 'Comision Valida',
	case
	when
	ase.VendTipoVen!=1
	then
	0.00 
	else
	isnull(bes.ValorBono,0.00) end as '%Comision Director',
	case
	when
	ase.VendTipoVen!=1
	then
	0.00 
	else	
	isnull(lib.ValorBono,0.00) end as 'Valor Comision Director'


 from BON_PamVentasOutsorsing as pam
left join BON_LiquidacionBonificaciones as lib on (pam.Contrato=lib.Contrato
and lib.IdPlan in (16) 
and lib.Periodo=pam.MesLiquidacion
and lib.Año=pam.AñoLiquidacion)
left join BON_BonificacionEspecial as bes on (bes.ID=lib.IdBonificacion)
left join BON_Asesores as ase on (ase.VendCodigo=pam.CodigoDirector)

order by Contrato

END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptDirectoresPre]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptDirectoresPre]
	-- Add the parameters for the stored procedure here
--	@Periodo int,
--    @Año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		declare @usuario varchar(50)
	declare @periodo int
	declare @ano int

	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano

select distinct
lib.CodigoVendedor as 'CODIGO'
,lib.CodigoOficiona as 'OFICINA'
,lib.Cedula AS 'CEDULA'
,ase.VendNombre AS 'NOMBRE'
,lib.CodigoZona as 'ZONA'
,ase.OficNombre AS 'CONCESIONARIO'
,lib.PermanenciaDiferida as 'PERMANENCIA DIFERIDA'
,lib.PermanenciaTotal AS 'PERMANENCIA TOTAL'
,res.PermanenciaDirector AS 'CUMPLE PERMANENCIA'
,isnull(pre.Presupuesto,0) as 'CUOTA'
,res.TotalVentasRegistradasXoficina as 'Ventas Radicadas'
,res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina-isnull(pre.Presupuesto,0) as 'Ventas Adicionales'
,lib.DiasAsistidos as 'DIAS LABORADOS'
,res.TotalVentasValidasUsadosXoficina as 'CANT. USADOS'
,CEILING((res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina)*(SELECT VALOR FROM BON_Parametros WHERE id=13)/100) as 'lIMITE VENTA USADOS'
,CASE
WHEN 
res.TotalVentasValidasUsadosXoficina>CEILING((res.TotalVentasValidasNuevosXoficina+res.TotalVentasValidasUsadosXoficina)*(SELECT VALOR FROM BON_Parametros WHERE id=13)/100)
THEN
'VERDADERO'
ELSE
'FALSO'
END AS 'PENALIDAD'
,res.TotalCumplimientoPresupuestoXoficina AS 'Result Grupo'
,case
when
liv.TipoOficina=1
then
res.PorcentajeAsesoresConNventasValidasOfic
else
res.PorcentajeAsesoresConNventasValidasOficCE
end  as 'Desarrollo De Equipos'
,res.TotalVentasAprobadasXoficina AS 'VENTAS TOTALES VALIDAS'
,CASE
WHEN
res.VentasRegistradasSinCeremoniaXoficina>res.VentasMaximasSinCeremoniaXoficina
THEN
'SI'
ELSE
'NO'
END
AS 'PENALIZAR BONO'
,Case
 when liv.TipoOficina=1
 then 
	tob.Bonificacion4
 else	
 tob.Bonificacion12
END AS 'Bono Cumpl ppto'
,Case
 when liv.TipoOficina=1
 then 
	tob.Bonificacion5
else 
	tob.Bonificacion11
END as 'Desarrollo de Equipos'
,Case
 when liv.TipoOficina=1
 then
	tob.Bonificacion6
else 
		tob.Bonificacion17
end as 'Nuevo Especial' -- Solo este tiene penalidad
,tob.Bonificacion15 as 'BASE DE CLIENTES'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,Case 
when liv.TipoOficina=1
then
	
	tob.Bonificacion4+tob.Bonificacion5 +tob.Bonificacion6+tob.Bonificacion15+0+0-0 
else
	tob.Bonificacion12+tob.Bonificacion11 +tob.Bonificacion17+tob.Bonificacion15+0+0-0 

end as 'TOTAL BONIFICACION'
 from BON_LiquidacionBonificacionesGrupales as lib
inner join BON_Resultados as res  on (lib.CodigoOficiona=res.codOficina)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=lib.CodigoVendedor)
inner join BON_Asesores as ase on (lib.CodigoVendedor=ase.VendCodigo)
inner join BON_Liquidacion_Ventas as liv on (liv.CodOficina=lib.CodigoOficiona)
left join BON_Presupuesto as pre on (pre.CodigoOficina=lib.CodigoOficiona)
where lib.Periodo=liv.MesLiquidacion
and lib.Año=liv.AñoLiquidacion
and pre.Periodo=liv.MesLiquidacion
and pre.Ano=liv.AñoLiquidacion
and ase.VendTipoVen=1 --Director
END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptGerentesPre]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptGerentesPre]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		declare @usuario varchar(50)
	declare @periodo int
	declare @ano int

	select @periodo=Periodo,@ano=Año,@usuario=UsuarioActualiza from BON_LiquidacionBonificaciones
	exec BON_LiquidarReportes @usuario, @periodo, @ano
	 	 --Agrupa el presupuesto por Zona
	delete from BON_PresupuestoXzona
	insert into BON_PresupuestoXzona
	 Select RegiCodigo, Sum(Presupuesto) as PresupuestoZona from(
		 select ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
		 from BON_Asesores  as ase
		 inner join BON_Presupuesto as pre on (ase.OficCodigo=pre.CodigoOficina)
		 where pre.Ano=(Select top (1) AñoLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Periodo=(Select top (1) MesLiquidacion from BON_Liquidacion_Ventas)
		 and pre.Presupuesto<900
		 group by ase.RegiCodigo,ase.OficCodigo,pre.Presupuesto
	) as T1
	group by T1.RegiCodigo
	order by RegiCodigo asc
--------


select distinct
lib.CodigoVendedor as 'CODIGO'
,lib.Cedula AS 'CEDULA'
,ase.VendNombre AS 'NOMBRE'
,lib.CodigoZona as 'COD_ZONA'
,ase.RegiNombre AS 'NOM_ZONA'
,lib.PermanenciaDiferida as 'PERMANENCIA DIFERIDA'
,lib.PermanenciaTotal AS 'PERMANENCIA TOTAL'
,res.PermanenciaGerente AS 'CUMPLE PERMANENCIA'
,isnull(pre.Presupuesto,0) as 'PPTO'
,res.TotalVentasAprobadasXzona as 'EJEC'
,res.TotalCumplimientoPresupuestoXzona AS 'CUMPLIMIENTO'
,res.PorcentajeAsesoresConNventasValidasZona as 'desarrollo de equipos'
,CASE
WHEN
res.VentasRegistradasSinCeremoniaXzona>res.VentasMaximasSinCeremoniaXzona
THEN
'SI'
ELSE
'NO'
END
AS 'PENALIZAR BONO'
,tob.Reto1 as 'Reto1'
,tob.Reto2 as 'Reto2'
,tob.Reto3 as 'Reto3'
,tob.Reto4 as 'Reto4'
,tob.Reto5 as 'Reto5'
,tob.Reto6 as 'Reto6'
,tob.Reto7 as 'Reto7'
,tob.Reto8 as 'Reto8'
,tob.Reto9  as 'Reto9'
,tob.Bonificacion8  as '9Retos'
,tob.Bonificacion7 AS 'Bono Desarrollo Equipos'
,tob.Bonificacion18 as 'Bono Permanencia de Clientes'
,0 as 'RECUPERACION RETO PERMANENCIA'
,0 as 'BONIS PASADAS' 
,tob.Bonificacion7+tob.Bonificacion8 +tob.Bonificacion18+0+0-0  as 'TOTAL BONIFICACION'
from BON_LiquidacionBonificacionesGrupales as lib
inner join BON_Resultados as res  on (lib.CodigoZona=res.codZona)
inner join BON_TotalBonificaciones as tob on (tob.Codvendedor=lib.CodigoVendedor)
inner join BON_Asesores as ase on (lib.CodigoVendedor=ase.VendCodigo)
left join BON_PresupuestoXzona as pre on (pre.CodZona=lib.CodigoZona)
where ase.VendTipoVen=4 --Gerente

END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptLiquidacionVentas]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptLiquidacionVentas] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from BON_Liquidacion_Ventas
END

GO
/****** Object:  StoredProcedure [dbo].[BON_RptResultados]    Script Date: 22/05/2020 9:12:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BON_RptResultados] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from BON_Resultados
END

GO
