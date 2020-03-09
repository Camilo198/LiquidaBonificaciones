using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public class PresupuestoLN
    {
       public IList<PresupuestoEN> ConsultarPresupuestoLN(String ProcedimientoConsulta, PresupuestoEN preEn)
       {

           IList<PresupuestoEN> lista = new PresupuestoAD().ConsultarPresupuestosAD(ProcedimientoConsulta,preEn);
           return lista;
       }

       public IList<PresupuestoEN> ConsultarPresupuestoXoficinaLN(String ProcedimientoConsulta, PresupuestoEN preEn)
       {

           IList<PresupuestoEN> lista = new PresupuestoAD().ConsultarPresupuestosXoficinaAD(ProcedimientoConsulta, preEn);
           return lista;
       }

       public IList<PresupuestoEN> ConsultarAnosPresupuestoLN(String ProcedimientoConsulta)
       {

           IList<PresupuestoEN> lista = new PresupuestoAD().ConsultarAnosPresupuestosAD(ProcedimientoConsulta);
           return lista;
       }


       public IList<PresupuestoEN> ConsultarPeriodosPresupuestoXanoLN(string SP_ConsultaPeriodosPresupuestoXano, PresupuestoEN preEn)
       {
           IList<PresupuestoEN> lista = new PresupuestoAD().ConsultarPeriodosPresupuestosXanoAD(SP_ConsultaPeriodosPresupuestoXano,preEn);
           return lista;
       }

       public string ActualizarPresupuestoLN(PresupuestoEN ObjEntidad, String ProcedimientoActualiza)
       {
           String Actualiza = String.Empty;
           return Actualiza = new PresupuestoAD().ActualizarPresupuestoAD(ObjEntidad, ProcedimientoActualiza);
       }

       public string EliminarPresupuestoLN(PresupuestoEN ObjEntidad , String ProcedimientoElimina)
       {
           String Actualiza = String.Empty;
           return Actualiza = new PresupuestoAD().EliminarPresupuestoAD(ObjEntidad, ProcedimientoElimina);
       }

       public string InsertarPresupuestoLN(PresupuestoEN ObjEntidad, String ProcedimientoInserta)
       {
           String Actualiza = String.Empty;
           return Actualiza = new PresupuestoAD().InsertarPresupuestoAD(ObjEntidad, ProcedimientoInserta);
       }
    }
}
