USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion]    Script Date: 17/02/2020 9:02:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion]
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
	  -- Especial Asesor x Monto de Ventas

	if(@idPlan=1 or @idPlan=2)
	begin
	
    Exec BON_CalcularVentasTotales @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 ase.VendIdeNro,
	 bbt.VentasTotales,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	ast.DiasLaborados as diasAsistidos,
	isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_Liquidacion_Ventas as blv
	  inner join  BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo)
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  inner join BON_Asesores as ase on(ase.VendCodigo=blv.CodVendedor)
	  inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ase.VendIdeNro)
	  left join BON_Ausentismos as aus on (aus.Cedula=ase.VendIdeNro)
	   where 
	  ventaValida=1
	   and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion)
	 

	 end
	 -- Grupal Asesor
	else if(@idPlan=3)
	 begin
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 

	  insert into BON_LiquidacionBonificacionesGrupales

	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 blv.CodZona,
	 blv.CodOficina,
	blv.CodVendedor,
	 ase.VendIdeNro,
	 bbt.VentasTotales,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	ast.DiasLaborados as diasAsistidos,
	isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	  from BON_Liquidacion_Ventas as blv
	  inner join BON_VentasTotales as bbt on (blv.CodOficina=bbt.Codigo)
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  inner join BON_Asesores as ase on(ase.VendCodigo=blv.CodVendedor)
	  inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ase.VendIdeNro)
	  left join BON_Ausentismos as aus on (aus.Cedula=ase.VendIdeNro)
	   where 
	 ventaValida=1
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1
	 end

	 -- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5)
	 begin

	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 
	  insert into  BON_LiquidacionBonificacionesGrupales
	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 blv.CodZona,
	 blv.CodOficina,
	ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales,
	 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int) as ValorRealBono,
	 blv.MesLiquidacion as periodo,
	blv.AñoLiquidacion as año,
	ast.DiasLaborados as diasAsistidos,
	isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
	  from BON_Asesores as ases
	  inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	  inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo)
	  inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro)
	  left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	   where 
	   ases.VendTipoVen=1 --Director
	 and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1 
	 end


	return @@rowcount
END
