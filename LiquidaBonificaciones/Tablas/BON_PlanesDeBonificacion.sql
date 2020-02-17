USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_PlanesDeBonificacion]    Script Date: 17/02/2020 3:18:15 p. m. ******/
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

ALTER TABLE [dbo].[BON_PlanesDeBonificacion]  WITH CHECK ADD  CONSTRAINT [FK_perfilComercial] FOREIGN KEY([IdRol])
REFERENCES [dbo].[BON_PerfilComercial] ([IdRol])
GO

ALTER TABLE [dbo].[BON_PlanesDeBonificacion] CHECK CONSTRAINT [FK_perfilComercial]
GO


