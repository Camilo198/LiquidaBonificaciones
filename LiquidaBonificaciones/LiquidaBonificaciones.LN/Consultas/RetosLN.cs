using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
  public  class RetosLN
    {

      public IList<RetosEN> ConsultarRetosXidPlanLN(String ProcedimientoConsulta, RetosEN objEntidad)
      {

          IList<RetosEN> lista = new RetosAD().ConsultarRetosXidPlanAD(ProcedimientoConsulta, objEntidad);
          return lista;
      }

        public IList<RetosEN> ConsultarRetosLN(String ProcedimientoConsulta, RetosEN preEn)
        {

            IList<RetosEN> lista = new RetosAD().ConsultarRetosAD(ProcedimientoConsulta, preEn);
            return lista;
        }

        public IList<RetosEN> ConsultarRetosXllaveLN(String ProcedimientoConsulta, RetosEN preEn)
        {

            IList<RetosEN> lista = new RetosAD().ConsultarRetosXllaveAD(ProcedimientoConsulta, preEn);
            return lista;
        }

        public IList<RetosEN> ConsultarAnosRetosLN(String ProcedimientoConsulta)
        {

            IList<RetosEN> lista = new RetosAD().ConsultarAnosRetosAD(ProcedimientoConsulta);
            return lista;
        }


        public IList<RetosEN> ConsultarPeriodosRetosXanoLN(string SP_ConsultaPeriodosRetosXano, RetosEN preEn)
        {
            IList<RetosEN> lista = new RetosAD().ConsultarPeriodosRetosXanoAD(SP_ConsultaPeriodosRetosXano, preEn);
            return lista;
        }

        public string ActualizarRetosLN(RetosEN ObjEntidad, String ProcedimientoActualiza)
        {
            String Actualiza = String.Empty;
            return Actualiza = new RetosAD().ActualizarRetoAD(ObjEntidad, ProcedimientoActualiza);
        }

        public string EliminarRetosLN(RetosEN ObjEntidad, String ProcedimientoElimina)
        {
            String Actualiza = String.Empty;
            return Actualiza = new RetosAD().EliminarRetoAD(ObjEntidad, ProcedimientoElimina);
        }

        public string InsertarRetosLN(RetosEN ObjEntidad, String ProcedimientoInserta)
        {
            String Actualiza = String.Empty;
            return Actualiza = new RetosAD().InsertarRetoAD(ObjEntidad, ProcedimientoInserta);
        }
    }
}
