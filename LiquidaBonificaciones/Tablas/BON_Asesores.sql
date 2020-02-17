USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_Asesores]    Script Date: 17/02/2020 3:13:54 p. m. ******/
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
 CONSTRAINT [PK_BON_Asesores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


