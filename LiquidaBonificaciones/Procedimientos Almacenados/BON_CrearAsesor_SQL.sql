USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CrearAsesor_SQL]    Script Date: 14/02/2020 1:10:35 p. m. ******/
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
@nombreRegi varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
insert into BON_Asesores(VendCodigo,VendTipoVen,OficCodigo,VendIdeNro,OficNombre,VendFecIng,VendFecRet,VendTipoAse,VendMail,RegiCodigo,RegiNombre)
values (@codigoVendedor, @tipoVenta,@codigoOficina,@idVendedor,
@nombreOficina,@fechaIngreso,@fechaRetiro,@tipoAsesor,@Email,@codRegi,@nombreRegi)
RETURN @@RowCount
END
