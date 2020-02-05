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
      public IList<PlanDeBonificacionEN> ConsultarPlanBonificacionEspecialLN(String ProcedimientoConsulta,AsesoresEN AsesorObj)
      {

          IList<PlanDeBonificacionEN> lista = new PlanDeBonificacionAD().ConsultarPlanBonificacionAD(ProcedimientoConsulta,AsesorObj);
          return lista;
      }
    }
}
