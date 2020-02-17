USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_VentasValidasXtipoVenta]    Script Date: 17/02/2020 3:19:44 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BON_VentasValidasXtipoVenta](
	[CodVendedor] [int] NOT NULL,
	[CantidadVentas] [int] NOT NULL,
	[TipoVenta] [int] NOT NULL,
 CONSTRAINT [PK_BON_VentasValidasXtipoVenta] PRIMARY KEY CLUSTERED 
(
	[CodVendedor] ASC,
	[TipoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BON_VentasValidasXtipoVenta]  WITH CHECK ADD  CONSTRAINT [FK_TipoVenta] FOREIGN KEY([TipoVenta])
REFERENCES [dbo].[BON_TipoVenta] ([Id])
GO

ALTER TABLE [dbo].[BON_VentasValidasXtipoVenta] CHECK CONSTRAINT [FK_TipoVenta]
GO


