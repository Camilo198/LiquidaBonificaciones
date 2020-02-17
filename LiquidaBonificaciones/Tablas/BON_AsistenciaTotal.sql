USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_AsistenciaTotal]    Script Date: 17/02/2020 3:15:57 p. m. ******/
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


