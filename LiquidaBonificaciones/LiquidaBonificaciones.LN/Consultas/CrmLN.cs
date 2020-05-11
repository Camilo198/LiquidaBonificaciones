using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
  public  class CrmLN
    {

      private String ProcedimientoInserta = "BON_CargarCierreCRM";
      private String ProcedimientoConsultaFecha = "BON_ConsultarFechaCierreCRM";

      public string cargarCierreCRM(CrmEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new CrmAD().InsertarCierreCRM( ProcedimientoInserta,ObjEntidad);
      }

      public IList<CrmEN> ConsultaFechaCierreCrm()
      {
          IList<CrmEN> lista = new CrmAD().ConsultarCierreCRM(ProcedimientoConsultaFecha);
          return lista;
      }
    }
}
