using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Consultas;

namespace LiquidaBonificaciones.LN.Consultas
{
  public  class AsesoresLN
    {

      private String ProcedimientoInserta = "BON_CrearAsesor_SQL";
      private String ProcedimientoElimina = "BON_BorarAsesores_SQL";
      private string ProcedimientoCargaAsistencia = "BON_CargarAsistencia";

      public IList<AsesoresEN> ConsultarAsesoresSicolLN()
      {
          IList<AsesoresEN> lista = new AsesoresAD().ConsultarAsesoresSicoAD();
          return lista;
      }

      public  string InsertarAsoresSqlLN(AsesoresEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new AsesoresAD().InsertarAsesoresSQL(ObjEntidad, ProcedimientoInserta);
      }

      public  string EliminarAsesoresSqlLN()
      {
          String Actualiza = String.Empty;
          return Actualiza = new AsesoresAD().EliminarAsesores(ProcedimientoElimina);
      }

      public string cargarAsistencia(AsesoresEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new AsesoresAD().cargarAsistencia(ObjEntidad, ProcedimientoCargaAsistencia);
      }

    }
}
