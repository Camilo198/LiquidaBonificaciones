USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion]    Script Date: 03/03/2020 9:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion]
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
---------------------- Especial Asesor x Monto de Ventas

	if(@idPlan=1 or @idPlan=2)
	begin

	
    Exec BON_CalcularVentasTotales @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales,
	 bes.ValorBono as ValorBono,
	 @periodo,
	 @ano,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from BON_Resultados as res	  
	  inner join  BON_Liquidacion_Ventas as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	   where 
	  blv.ventaValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion)
	 

	 end
-------------------- Grupal Asesor
	else if(@idPlan=3)
	 begin
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales
	
	select * from(
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from BON_Resultados as res
	 inner join  BON_Liquidacion_Ventas as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
	   where 
	 blv.ventaValida=1
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 where T1.rn=1
	 end
	
---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5)
	 begin								 
	  Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 

	select * from BON_VentasTotales
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
				cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)  as ValorRealBono, -- revisar
				blv.MesLiquidacion as periodo,
				blv.AñoLiquidacion as año,
				ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
				inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo) 
				inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				where 
				ases.VendTipoVen=1 --Director
				and ases.VendCodigo=pre.CodigoDirector
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			where T1.rn=1 
	 end


	 
------------Especial Director
	else if (@idPlan=6)
	begin

	Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
		select * from(
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		case
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from BON_Parametros where id=27)  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from BON_Parametros where id= 28)/100
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from BON_Parametros where id=27)  
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from BON_Parametros where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		blv.MesLiquidacion as periodo,
		blv.AñoLiquidacion as año,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
		inner join BON_Liquidacion_Ventas as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join BON_Resultados as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
		where 
		ases.VendTipoVen=1 --Director 
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=@periodo
		and pre.Ano=@ano
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 where T1.rn=1 
	 end
	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales
				select * from(
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 case 
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from BON_Parametros where id=27)  and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from BON_Parametros where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)
	
					 end as ValorRealBono,
					 blv.MesLiquidacion as periodo,
					 blv.AñoLiquidacion as año,
					 ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join BON_BonificacionEspecial as bes  on(bes.ID=@idBonificacion)
					 inner join BON_Liquidacion_Ventas as blv on (blv.CodZona=bbt.Codigo) 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_Resultados as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					/* and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)*/
						) as T1 
				where T1.rn=1 

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec BON_CalcularVentasTotales @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales

				select * from(



					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 case 
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from BON_Parametros where id=27)  and bbt.VentasTotales <pre.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from BON_Parametros where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo as periodo,
					 ret.Ano as año,
					ast.DiasLaborados-ISNULL(aus.Ausentismos,0)  as diasAsistidos,
					isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_Retos as ret  on(ret.CodigoGerente=ases.VendCodigo)
					 inner join BON_VentasTotales as bbt on (ret.IdBonificacion=bbt.Codigo)					 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_Resultados as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pre on (pre.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				where T1.rn=1 

	 end
	 /*
	 declare @idBonificacion int =33,
 @idPlan int =6,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=10,
@ano int=2019
	 */
	return @@rowcount
END
