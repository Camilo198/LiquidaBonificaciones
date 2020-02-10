using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
  public  class PlanDeBonificacionLN
    {
      public IList<PlanDeBonificacionEN> ConsultarPlanBonificacionEspecialXidLN(String ProcedimientoConsulta,PlanDeBonificacionEN planBoniObj)
      {

          IList<PlanDeBonificacionEN> lista = new PlanDeBonificacionAD().ConsultarPlanBonificacionXidAD(ProcedimientoConsulta, planBoniObj);
          return lista;
      }

      public IList<PlanDeBonificacionEN> ConsultarPlanesBonificacionEspecialLN(String ProcedimientoConsulta)
      {

          IList<PlanDeBonificacionEN> lista = new PlanDeBonificacionAD().ConsultarPlanesBonificacion(ProcedimientoConsulta);
          return lista;
      }

      public string ActualizarPlanBonificacionEspecialLN(PlanDeBonificacionEN ObjEntidad, String ProcedimientoActualiza)
      {
          String Actualiza = String.Empty;
          return Actualiza = new PlanDeBonificacionAD().ActualizarPlanBonificacion(ObjEntidad, ProcedimientoActualiza);
      }



    }

}
