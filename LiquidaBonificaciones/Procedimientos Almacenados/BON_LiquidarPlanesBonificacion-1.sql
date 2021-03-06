USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarPlanesBonificacion-1]    Script Date: 01/04/2020 8:31:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_LiquidarPlanesBonificacion-1]
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
--declare @tipoOfi int
declare @tipoOfi int




 if(@idPlan=1 or @idPlan=2 or @idPlan=9)
	begin
	
	if(@idPlan=1 or @idPlan=2)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=9 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
	insert into BON_LiquidacionBonificaciones

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,codVend,T1.Cedula,Total,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 blv.Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 res.codZona,
	 res.codOficina,
	 res.codVend,
	 res.Cedula,
	 bbt.VentasTotales as Total,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then 
		case
		when 
		@idPlan=9
		then 
		bes.ValorBono*blv.ValorPlan/100 
		else
		bes.ValorBono
		end
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-1] as res	  
	  inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ventaValida=1
	  and TipoOficina=@tipoOfi
	--  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	  )as t1
	  left join BON_LiquidacionBonificaciones_Final  as lbf on(t1.Contrato=lbf.Contrato and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono

	 end

	---
	
	---Comisiones Asesor
	if(@idPlan=13)
	begin
	

    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan
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
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 bes.ValorBono*blv.ValorPlan/100  as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	res.DiasAsistidos as diasAsistidos,
	isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	  @usuario as UsuarioAct,
	  GETDATE() as FechaActual,
	  ROW_NUMBER() over (PARTITION by blv.Contrato  order by blv.contrato) as 'rn'
	  from [BON_Resultados-1] as res	  
	  inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join  BON_VentasTotales as bbt on (res.codVend=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	  blv.ComisionValida=1
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones where idBonificacion=@idBonificacion) 
	  and blv.Contrato not in (Select Contrato from BON_LiquidacionBonificaciones_Final where idBonificacion=@idBonificacion) 
	
	 end
	 
	---
-------------------- Grupal Asesor
	else if(@idPlan=3 or @idPlan=10)
	 begin

	 if( @idPlan=3)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=10)
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end

	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.CodVendedor,T1.Cedula,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 bbt.VentasTotales,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bes.ValorBono 
	 else 0 
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-1] as res
	 inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
	   where 
	 blv.ventaValida=1
	 and TipoOficina=@tipoOfi
	 and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 
     left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.CodVendedor=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1
	 end
	
	


---------------- Grupal Director y Desarrollo de Equipos Director

	else if(@idPlan=4 or @idPlan=5 or @idPlan=11 or @idPlan=12)
	 begin		
	 
	 if(@idPlan=4 or @idPlan=5)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=11 or @idPlan=12 )
	begin 
	set @tipoOfi=2 -- CanalEspecializado
	
	end
	 
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 

	 insert into  BON_LiquidacionBonificacionesGrupales

		Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
			Select 
				0 as Contrato,
				@idBonificacion as BonificacionID,
				@idPlan as PlanID,
				blv.CodZona,
				blv.CodOficina,
				ases.VendCodigo,
				ases.VendIdeNro,
				bbt.VentasTotales,
			    res.PermanenciaDiferidaOficina as permanenciaDiferida,
				res.PermanenciaTotalOficina as permanenciaTotal,
				case 
				 when res.PermanenciaDirector=0 
				 then			 
				0
				when 
				 @idPlan=5 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				when 
				 @idPlan=11 and TotalCumplimientoPresupuestoXoficina<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
				 then
				 0
				else
				cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int) 
				end 
				as ValorRealBono, 
				 blv.MesLiquidacion,
				blv.AñoLiquidacion,
				ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
				isnull(aus.Ausentismos,0) as Ausentismos,
				@Observacion as Observacion,
				@usuario as UsuarioAct,
				GETDATE() as FechaActual,
				ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
				from BON_Asesores as ases
				inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
				inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
				inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
				inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactbs
				inner join BON_Presupuesto as pre on (pre.CodigoOficina=ases.OficCodigo)
				left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
				Inner join [BON_Resultados-1] as res on (res.codOficina=ases.OficCodigo)
			
				where 
				TipoOficina=@tipoOfi
				and ases.VendCodigo=pre.CodigoDirector
				and pre.Periodo=blv.MesLiquidacion
				and pre.Ano=blv.AñoLiquidacion
				and ases.VendCodigo not in
				(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
			) as T1 
			   left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1

	 end


	 
------------Especial Director
	else if (@idPlan=6 or  @idPlan=17)
	begin

	if(@idPlan=6)
	begin 
	
	set @tipoOfi=1 -- Tradicional
	
	end

	else if(@idPlan=17)
	begin 
	
	set @tipoOfi=2 -- CanalEspecializado
	
	end



	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
	 insert into  BON_LiquidacionBonificacionesGrupales
			Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
		
		Select 
		0 as Contrato,
		@idBonificacion as BonificacionID,
		@idPlan as PlanID,
		blv.CodZona,
		blv.CodOficina,
		ases.VendCodigo,
		ases.VendIdeNro,
		bbt.VentasTotales,
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,
		case
		when res.PermanenciaDirector=0
		then
		0
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales<pre.Presupuesto	
		then
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales*(Select Valor from [BON_Parametros-1] where id= 28)/100
		when 
		res.PorcentajeSinCeremoniaXoficina>(Select Valor from [BON_Parametros-1] where id=27)  
		and bbt.VentasTotales>=pre.Presupuesto
		then
		(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*pre.Presupuesto)+(cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(bbt.VentasTotales-pre.Presupuesto)*(Select Valor from [BON_Parametros-1] where id= 28)/100)
		else 
		cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*bbt.VentasTotales 
		end as ValorRealBono,
		 blv.MesLiquidacion,
		 blv.AñoLiquidacion,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and TipoOficina=@tipoOfi
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=blv.MesLiquidacion
		and pre.Ano=blv.AñoLiquidacion
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		) as T1 
		left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1
	 end

	 
------------Comision Director
	else if (@idPlan=16)
	begin

	Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		 
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
		res.PermanenciaDiferidaOficina as permanenciaDiferida,
		res.PermanenciaTotalOficina as permanenciaTotal,		
		bes.ValorBono/30*cast(ast.DiasLaborados as numeric)/100*res.TotalPlanesComisionXoficina ----
		
		--bes.ValorBono*bbt.VentasTotales 
		as ValorRealBono,
		blv.MesLiquidacion,
		blv.AñoLiquidacion,
		ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
		isnull(aus.Ausentismos,0) as Ausentismos,
		@Observacion as Observacion,
		@usuario as UsuarioAct,
		GETDATE() as FechaActual,
		ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
		
		from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

		where 
		ases.VendTipoVen=1 --Director 
		and ases.VendCodigo=pre.CodigoDirector
		and pre.Periodo=blv.MesLiquidacion
		and pre.Ano=blv.AñoLiquidacion
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		and ases.VendCodigo not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales_Final as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
		
		) as T1 where T1.rn=1 
	 end
	 
	 
----------------- Desarrollo de Equipos Gerente
	 else if (@idPlan=7)
	 begin	 
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 
		
		insert into  BON_LiquidacionBonificacionesGrupales
					Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	
					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 blv.CodZona,
					 blv.CodOficina,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case  
					 when
					 res.PermanenciaGerente=0 or res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and res.TotalVentasAprobadasXzona <pxz.Presupuesto	
					 then
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(bes.ValorBono as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					 blv.MesLiquidacion,
					 blv.AñoLiquidacion,
					 ast.DiasLaborados-ISNULL(aus.Ausentismos,0) as diasAsistidos,
					 isnull(aus.Ausentismos,0) as Ausentismos,
					 @Observacion as Observacion,
					 @usuario as UsuarioAct,
					 GETDATE() as FechaActual,
					 ROW_NUMBER() over (PARTITION by ases.vendCodigo  order by ases.vendcodigo) as 'rn'	  
					 from BON_Asesores as ases
					 inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
					 inner join [BON_BonificacionEspecial-1] as bes  on(bes.ID=@idBonificacion)
					 inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodZona=bbt.Codigo) 
					 inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el Gerente este en kactus
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=bbt.Codigo)  --Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join [BON_Resultados-1] as res on (res.codZona=bbt.Codigo)
					 inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)

					 where 
					 ases.VendTipoVen='4' --Gerente
					 and ases.VendCodigo=pre.CodigoGerente
					 and pre.Periodo=@periodo
					and pre.Ano=@ano
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
				left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1

	 end


	 ----Bono 9 Retos
	 	 else if (@idPlan=8)
	 begin	 
		
		Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 


		Insert into  BON_LiquidacionBonificacionesGrupales


	Select T1.Contrato,BonificacionID,PlanID,T1.CodigoZona,T1.CodigoGerente,T1.VendCodigo,T1.VendIdeNro,T1.VentasTotales,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorRealBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,T1.Periodo,T1.Ano,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (

					 

					 Select 
					 0 as Contrato,
					 @idBonificacion as BonificacionID,
					 @idPlan as PlanID,
					 ret.CodigoZona,
					 ret.CodigoGerente,
					 ases.VendCodigo,
					 ases.VendIdeNro,
					 bbt.VentasTotales,
					 res.PermanenciaDiferidaZona as permanenciaDiferida,
					 res.PermanenciaTotalZona as permanenciaTotal,
					 case 
					 when
					 res.PermanenciaGerente=0
					 then
					 0
					 when 
					 res.TotalCumplimientoPresupuestoXzona<=(Select Valor from [BON_Parametros-1] where Id=25)-- Cuota minima de Cumplimiento
					 then
					 0
					 when 
					 res.PorcentajeSinCeremoniaXzona>(Select Valor from [BON_Parametros-1] where id=27)  and bbt.VentasTotales <pxz.Presupuesto	
					 then
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)*(Select Valor from [BON_Parametros-1] where id= 28)/100
					 else 
					 cast(round(cast(ret.ValorBonificacion as numeric)/30*cast(ast.DiasLaborados as numeric),0,0) as int)	
					 end as ValorRealBono,
					
					 ret.Periodo,
					 ret.Ano,
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
					 inner join [BON_Resultados-1] as res on (res.codZona=ret.CodigoZona)--Valida el porcentaje de participacion de la ceremonia de sueños
					 inner join BON_PresupuestoXzona as pxz on (pxz.CodZona=ret.CodigoZona)
					 left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
					 where 
					 ases.VendCodigo=ret.CodigoGerente --Gerente
					 and ret.Periodo=@periodo
					 and ret.Ano=@ano
					 and IdBonificacion=@idBonificacion
					 and ases.VendCodigo not in 
						(  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib
						 where lib.idBonificacion=@idBonificacion and lib.IdPLan=@idPlan and lib.Periodo=@periodo and lib.Año=@ano)
						) as T1 
					left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and lbf.Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorRealBono
	  and T1.rn=1

	 end

	 
	-------------------- Grupal Asesor Participantes en Ceremonia
	else if(@idPlan=14 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.CodVendedor,T1.Cedula,T1.metaAlcanzada,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 blv.CodVendedor,
	 res.Cedula,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 isnull(cph.InsdCumPerTotal,100) as permanenciaDiferida,
	 isnull(cph.FinalCumPerTotal,100) as permanenciaTotal,
	 case 
	 when blv.Permanencia=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 res.DiasAsistidos as diasAsistidos,
	 isnull(res.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by blv.codVendedor  order by blv.contrato) as 'rn'
	 from [BON_Resultados-1] as res
	 inner join  [BON_Liquidacion_Ventas-1] as blv on (blv.CodVendedor=res.codVend)
	  inner join BON_VentasTotales as bbt on (blv.CodVendedor=bbt.Codigo) -- Tabla de calculos temporales que viene del Sp Anterior
	  left join  SCO_CumplimientoPersistencia_Hist as cph on (cph.CodAsesor=res.codVend and cph.FecActualiza>=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=6)) and cph.FecActualiza<=dateadd(M,1,(select valor from [BON_Parametros-1] where Id=7)))
 where 
	 blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1
	   left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.CodVendedor=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1


	 end

	 	-------------------- Grupal Director Participantes en Ceremonia
	else if(@idPlan=15 )
	 begin

	
	  Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan 	 	 

	 insert into BON_LiquidacionBonificacionesGrupales

	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.metaAlcanzada,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 res.TotalParticipantesCeremoniaXoficina as metaAlcanzada,
	 res.PermanenciaDiferidaOficina as permanenciaDiferida,
	 res.PermanenciaTotalOficina as permanenciaTotal,
	 case 
	 when res.PermanenciaDirector=1 
	 then bbt.VentasTotales
	 else 0
	 end as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.OficCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodOficina=bbt.Codigo) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codOficina=blv.CodOficina) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodigoOficina=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoDirector 
  and pre.Periodo=blv.MesLiquidacion
  and pre.Ano=blv.AñoLiquidacion
 and ases.VendTipoVen=1 --Director 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1
	  left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1


	 end

	
	 	-------------------- Grupal Gerente cumplimiento permanencia
	else if(@idPlan=18)
	 begin
	 	 
    Exec [BON_CalcularVentasTotales-1] @idBonificacion, @idPlan

	 insert into BON_LiquidacionBonificacionesGrupales
	 
	
	 	Select T1.Contrato,BonificacionID,PlanID,codZona,codOficina,T1.VendCodigo,T1.VendIdeNro,T1.metaAlcanzada,T1.permanenciaDiferida
	,T1.permanenciaTotal,T1.ValorBono-ISNULL(lbf.ValorBono,0) as BonoRecuperado,MesLiquidacion,AñoLiquidacion,T1.diasAsistidos,T1.Ausentismos,
	T1.Observacion,UsuarioAct,FechaActual,T1.rn from (
	 Select 
	 0 as Contrato,
	 @idBonificacion as BonificacionID,
	 @idPlan as PlanID,
	 blv.CodZona,
	 blv.CodOficina,
	 ases.VendCodigo,
	 ases.VendIdeNro,
	 bbt.VentasTotales as metaAlcanzada,
	 res.PermanenciaDiferidaZona as permanenciaDiferida,
	 res.PermanenciaTotalZona as permanenciaTotal,
	 bes.ValorBono as ValorBono,
	 blv.MesLiquidacion,
	 blv.AñoLiquidacion,
	 ast.DiasLaborados-isnull(aus.Ausentismos,0) as diasAsistidos,
	 isnull(aus.Ausentismos,0) as Ausentismos,
	 @Observacion as Observacion,
	 @usuario as UsuarioAct,
	 GETDATE() as FechaActual,
	 ROW_NUMBER() over (PARTITION by ases.VendCodigo  order by ases.VendCodigo) as 'rn'
	 from BON_Asesores as ases
		inner join BON_VentasTotales as bbt on (ases.RegiCodigo=bbt.Codigo)
		inner join [BON_Liquidacion_Ventas-1] as blv on (blv.CodZona=bbt.Codigo)
		inner join [BON_BonificacionEspecial-1] as bes on (bes.ID=@idBonificacion) 
		inner join BON_AsistenciaTotal as ast on  (ast.Cedula=ases.VendIdeNro) -- Valida que el director este en kactus
		inner join [BON_Resultados-1] as res on (res.codZona=blv.CodZona) --Valida el porcentaje de participacion de la ceremonia de sueños
		inner join BON_Presupuesto as pre on (pre.CodZona=bbt.Codigo)
		left join BON_Ausentismos as aus on (aus.Cedula=ases.VendIdeNro)
	 

 where 
  ases.VendCodigo=pre.CodigoGerente 
  and pre.Periodo=@periodo
  and pre.Ano=@ano
 and ases.VendTipoVen=4 --Gerente 
	and blv.CodVendedor not in (  Select lib.CodigoVendedor from BON_LiquidacionBonificacionesGrupales as lib where lib.IdPLan=@idPlan and lib.idBonificacion=@idBonificacion and lib.Periodo=@periodo and lib.Año=@ano)
	   ) as T1 
	   left join BON_LiquidacionBonificacionesGrupales_Final   as lbf on(t1.VendCodigo=lbf.CodigoVendedor and Periodo=@periodo and Año=@ano and IdPlan=@idPlan and IdBonificacion=@idBonificacion)
	  where lbf.ValorBono!=t1.ValorBono
	  and T1.rn=1

	   End
	   
	/*	declare @idBonificacion int =309,
 @idPlan int =8,
@usuario varchar(20)='cm',
@Observacion varchar(max)='',
@periodo int=2,
@ano int=2020 */
	return @@rowcount
END
