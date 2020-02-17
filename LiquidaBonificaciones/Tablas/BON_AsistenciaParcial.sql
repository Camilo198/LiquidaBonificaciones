USE [Bonificacion_desarrollo]
GO

/****** Object:  Table [dbo].[BON_AsistenciaParcial]    Script Date: 17/02/2020 3:15:43 p. m. ******/
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


