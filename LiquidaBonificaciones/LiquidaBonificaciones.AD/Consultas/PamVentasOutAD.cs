using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
  public  class PamVentasOutAD
    {
      WcfData wsc = new WcfData();
      public string InsertarVentaOutAD(PamVentasOutEN ObjEntidad, string Procedimiento)
      {
          try
          {
              string[, ,] Param = new string[27, 3, 1];


              Param[0, 0, 0] = ObjEntidad.Cupo.ToString();
              Param[0, 1, 0] = "@Cupo";
              Param[0, 2, 0] = "Varchar (50)";

              Param[1, 0, 0] = ObjEntidad.Afiliado.ToString();
              Param[1, 1, 0] = "@Afiliado";
              Param[1, 2, 0] = "Varchar (50)";

              Param[2, 0, 0] = ObjEntidad.Contrato.ToString();
              Param[2, 1, 0] = "@Contrato";
              Param[2, 2, 0] = "Varchar (50)";

              Param[3, 0, 0] = ObjEntidad.CodOficina.ToString();
              Param[3, 1, 0] = "@CodOficina";
              Param[3, 2, 0] = "int";

              Param[4, 0, 0] = ObjEntidad.Oficina.ToString();
              Param[4, 1, 0] = "@Oficina";
              Param[4, 2, 0] = "varchar(50)";

              Param[5, 0, 0] = ObjEntidad.FechaVenta.ToString();
              Param[5, 1, 0] = "@FechaVenta";
              Param[5, 2, 0] = "datetime";

              Param[6, 0, 0] = ObjEntidad.ValorPlan.ToString();
              Param[6, 1, 0] = "@ValorPlan";
              Param[6, 2, 0] = "numeric";

              Param[7, 0, 0] = ObjEntidad.CodVendedor.ToString();
              Param[7, 1, 0] = "@CodVendedor";
              Param[7, 2, 0] = "int";

              Param[8, 0, 0] = ObjEntidad.IdeVendedor.ToString();
              Param[8, 1, 0] = "@IdeVendedor";
              Param[8, 2, 0] = "numeric";

              Param[9, 0, 0] = ObjEntidad.nombreVendedor.ToString();
              Param[9, 1, 0] = "@nombreVendedor";
              Param[9, 2, 0] = "varchar (50)";

              Param[10, 0, 0] = ObjEntidad.Tipo.ToString();
              Param[10, 1, 0] = "@Tipo";
              Param[10, 2, 0] = "varchar (50)";

              Param[11, 0, 0] = ObjEntidad.PorcentajeInscripcion.ToString();
              Param[11, 1, 0] = "@PorcentajeInscripcion";
              Param[11, 2, 0] = "numeric";

              Param[12, 0, 0] = ObjEntidad.ValorInscripcionSinIva.ToString();
              Param[12, 1, 0] = "@ValorInscripcionSinIva";
              Param[12, 2, 0] = "numeric";

              Param[13, 0, 0] = ObjEntidad.ValorPagoParcial.ToString();
              Param[13, 1, 0] = "@ValorPagoParcial";
              Param[13, 2, 0] = "numeric";
              
              Param[14, 0, 0] = ObjEntidad.AlturaDiferida.ToString();
              Param[14, 1, 0] = "@AlturaDiferida";
              Param[14, 2, 0] = "varchar (50)";

              Param[15, 0, 0] = ObjEntidad.TipoContrato.ToString();
              Param[15, 1, 0] = "@TipoContrato";
              Param[15, 2, 0] = "varchar (50)";

              Param[16, 0, 0] = ObjEntidad.CarroAgil.ToString();
              Param[16, 1, 0] = "@CarroAgil";
              Param[16, 2, 0] = "varchar (50)";

              Param[17, 0, 0] = ObjEntidad.MarcaDiferida.ToString();
              Param[17, 1, 0] = "@MarcaDiferida";
              Param[17, 2, 0] = "varchar (50)";

              Param[18, 0, 0] = ObjEntidad.CodigoDirector.ToString();
              Param[18, 1, 0] = "@CodigoDirector";
              Param[18, 2, 0] = "int";

              Param[19, 0, 0] = ObjEntidad.IdeDirector.ToString();
              Param[19, 1, 0] = "@IdDirector";
              Param[19, 2, 0] = "numeric";

              Param[20, 0, 0] = ObjEntidad.NombreDirector.ToString();
              Param[20, 1, 0] = "@NombreDirector";
              Param[20, 2, 0] = "varchar (50)";

              Param[21, 0, 0] = ObjEntidad.ValorIvaInscripcion.ToString();
              Param[21, 1, 0] = "@ValorIvaInscripcion";
              Param[21, 2, 0] = "numeric";

              Param[22, 0, 0] = ObjEntidad.ValorTotaInscripcionConIva.ToString();
              Param[22, 1, 0] = "@ValorTotaInscripcionConIva";
              Param[22, 2, 0] = "numeric";

              Param[23, 0, 0] = ObjEntidad.MarcaExcl.ToString();
              Param[23, 1, 0] = "@MarcaExcl";
              Param[23, 2, 0] = "varchar (50)";
              
              Param[24, 0, 0] = ObjEntidad.LineaProducto.ToString();
              Param[24, 1, 0] = "@LineaProducito";
              Param[24, 2, 0] = "varchar (50)";

              Param[25, 0, 0] = ObjEntidad.UsuarioActualiza.ToString();
              Param[25, 1, 0] = "@UsuarioActualiza";
              Param[25, 2, 0] = "varchar (50)";

              Param[26, 0, 0] = ObjEntidad.EstadoCupo.ToString();
              Param[26, 1, 0] = "@EstadoCupo";
              Param[26, 2, 0] = "varchar (10)";


              



              return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
          }
          catch (Exception ex)
          {
              return ex.Message;
          }

      }


      public string EliminarVentasOutAD(string Procedimiento)
      {
          try
          {
              string[, ,] Param = new string[0, 0, 0];


             return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
          }
          catch (Exception ex)
          {
              return ex.Message;
          }
      }
    }
}
