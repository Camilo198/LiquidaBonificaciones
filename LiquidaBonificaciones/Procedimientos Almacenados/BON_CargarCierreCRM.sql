USE [Bonificacion_desarrollo]
GO
/****** Object:  StoredProcedure [dbo].[BON_CargarCierreCRM]    Script Date: 11/05/2020 10:14:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BON_CargarCierreCRM]
	-- Add the parameters for the stored procedure here
	@usuario varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 declare @query as varchar (max)	
	    declare @ServidorPerfeccionamiento varchar(100)
    declare @BaseDatosPerfeccionamiento varchar(100)
    select @ServidorPerfeccionamiento = Servidor, @BaseDatosPerfeccionamiento = BaseDatos from [dbo].[SCO_ServidoresBasesDatos] where IDServidoresBasesDatos=4 --CRMProspectos
  			SET @query = 'Insert [BON_CierreCRM] 
		SELECT distinct
		 chc.ID as ''Contrato''
			,ventaperfeccionada as ''Perfeccionamiento''
			,(select Valor from BON_Parametros where Id =9) as ''Periodo''
			,(select Valor from BON_Parametros where Id =10) as ''Año''
			,GETDATE() as FechaAct
			,'''+@usuario+''' as ''Usuario''
		 FROM [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[ch_contratosleads] as chc 
			 left join [' + @ServidorPerfeccionamiento +'].'+ @BaseDatosPerfeccionamiento + '.[dbo].[documents] as doc on (chc.id=doc.document_name)
			 where 
             ventaperfeccionada = 1			  
			 and doc.deleted = 0
			 and chc.ID not in (Select contrato from BON_CierreCRM where 
			 Periodo =(select Valor from BON_Parametros where Id =9)
			 and Ano=(select Valor from BON_Parametros where Id =10)
			 )
			 '
			 EXEC (@query)
		
			 

--	select (@query)
  RETURN @@RowCount	
END
