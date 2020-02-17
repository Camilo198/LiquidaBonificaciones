USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_BonificacionEspecial]    Script Date: 17/02/2020 3:16:27 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BON_BonificacionEspecial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionBono] [varchar](50) NULL,
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

ALTER TABLE [dbo].[BON_BonificacionEspecial]  WITH CHECK ADD  CONSTRAINT [FK_PlanBonificacion] FOREIGN KEY([IdPlanBonificacion])
REFERENCES [dbo].[BON_PlanesDeBonificacion] ([ID])
GO

ALTER TABLE [dbo].[BON_BonificacionEspecial] CHECK CONSTRAINT [FK_PlanBonificacion]
GO


