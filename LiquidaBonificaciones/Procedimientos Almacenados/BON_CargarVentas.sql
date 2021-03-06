USE [Bonificacion_QA]
GO
/****** Object:  StoredProcedure [dbo].[BON_CargarVentas]    Script Date: 30/04/2020 10:59:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BON_CargarVentas] 
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
