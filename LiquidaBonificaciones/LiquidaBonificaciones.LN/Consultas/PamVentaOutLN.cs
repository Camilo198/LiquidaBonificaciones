using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
  public  class PamVentaOutLN
    {
      public string InsertarVentaOutLN(PamVentasOutEN ObjEntidad, String ProcedimientoInserta)
      {
          String Actualiza = String.Empty;
          return Actualiza = new PamVentasOutAD().InsertarVentaOutAD(ObjEntidad, ProcedimientoInserta);
      }

      public string EliminarVentasOut(String ProcedimientoElimina)
      {
          String Actualiza = String.Empty;
          return Actualiza = new PamVentasOutAD().EliminarVentasOutAD(ProcedimientoElimina);
      }
     
    }
}
