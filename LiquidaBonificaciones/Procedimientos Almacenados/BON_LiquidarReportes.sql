USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_LiquidarReportes]    Script Date: 07/04/2020 2:06:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_LiquidarReportes] 
	-- Add the parameters for the stored procedure here
	 @usuario varchar(50),
	 @periodo int,
	 @año int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

delete from BON_TotalBonificaciones
insert into  BON_TotalBonificaciones
select  distinct CodVendedor,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,MesLiquidacion,AñoLiquidacion,@Usuario,GETDATE() from BON_Liquidacion_Ventas
union select  distinct CodigoDirector,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@periodo,@año,@Usuario,GETDATE() from BON_Presupuesto
union select  distinct CodigoGerente,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@periodo,@año,@Usuario,GETDATE() from BON_Presupuesto

----Asesores Tradicionales
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=1
group by CodigoVendedor


update tob set tob.Bonificacion1=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=2
group by CodigoVendedor


update tob set tob.Bonificacion2=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=3
group by CodigoVendedor


update tob set tob.Bonificacion3=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

----Asesores Canal Especializado
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificaciones
where IdPlan=9
group by CodigoVendedor


update tob set tob.Bonificacion9=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=10
group by CodigoVendedor


update tob set tob.Bonificacion10=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

-----Directores Tradicionales
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=4
group by CodigoVendedor


update tob set tob.Bonificacion4=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=5
group by CodigoVendedor


update tob set tob.Bonificacion5=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=6
group by CodigoVendedor


update tob set tob.Bonificacion6=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=14
group by CodigoVendedor


update tob set tob.Bonificacion14=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


-----Directores Canal Especializado
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=12
group by CodigoVendedor


update tob set tob.Bonificacion12=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=11
group by CodigoVendedor


update tob set tob.Bonificacion11=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=17
group by CodigoVendedor


update tob set tob.Bonificacion17=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=15
group by CodigoVendedor


update tob set tob.Bonificacion15=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)



----Gerente
delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto1'
group by CodigoVendedor


update tob set tob.Reto1=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)



delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto2'
group by CodigoVendedor

update tob set tob.Reto2=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto3'
group by CodigoVendedor

update tob set tob.Reto3=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto4'
group by CodigoVendedor

update tob set tob.Reto4=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto5'
group by CodigoVendedor

update tob set tob.Reto5=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto6'
group by CodigoVendedor

update tob set tob.Reto6=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto7'
group by CodigoVendedor

update tob set tob.Reto7=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto8'
group by CodigoVendedor

update tob set tob.Reto8=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 and Observacion ='Reto9'
group by CodigoVendedor

update tob set tob.Reto9=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=8 
group by CodigoVendedor

update tob set tob.Bonificacion8=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)


delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=7
group by CodigoVendedor

update tob set tob.Bonificacion7=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

delete from BON_VentasTotales
insert into BON_VentasTotales
select CodigoVendedor,SUM(ValorBono) from BON_LiquidacionBonificacionesGrupales
where IdPlan=18
group by CodigoVendedor

update tob set tob.Bonificacion18=vet.VentasTotales from BON_TotalBonificaciones as tob
inner join BON_VentasTotales as vet on (vet.Codigo=tob.Codvendedor)

END
