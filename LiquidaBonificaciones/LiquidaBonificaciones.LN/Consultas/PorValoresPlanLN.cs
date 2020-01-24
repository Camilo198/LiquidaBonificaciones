using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Consultas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public class PorValoresPlanLN : BonificacionEspecialLN
    {

       public PorValoresPlanLN()
       {
      this.ProcedimientoConsulta= "BON_ConsultaBonificacionEspecial_VP";
      this.ProcedimientoActualiza = "BON_ActBonificacionEspecial_VP";
    this.ProcedimientoElimina= "BON_BorrarBonificacionEspecial_VP";
   this.ProcedimientoInserta= "BON_CrearBonificacionEspecial_VP";
       }

      public override IList<BonificacionEspecialEN> ConsultarBonificacionEspecialLN()
      {

          IList<BonificacionEspecialEN> lista = new BonificacionEspecialAD().ConsultarBonificacionEspecialAD(ProcedimientoConsulta);
          return lista;
      }

      public override string ActualizarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new BonificacionEspecialAD().ActualizarBonificacionEspecial(ObjEntidad, ProcedimientoActualiza);
      }

      public override string EliminarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new BonificacionEspecialAD().EliminarBonificacionEspecial(ObjEntidad, ProcedimientoElimina);
      }

      public override string InsertarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad)
      {
          String Actualiza = String.Empty;
          return Actualiza = new BonificacionEspecialAD().InsertarBonificacionEspacial(ObjEntidad, ProcedimientoInserta);
      }

    }
}
