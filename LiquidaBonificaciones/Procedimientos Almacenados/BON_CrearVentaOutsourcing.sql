USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearVentaOutSourcing]    Script Date: 15/05/2020 8:11:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_CrearVentaOutSourcing]
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
