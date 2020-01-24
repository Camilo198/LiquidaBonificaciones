using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Consultas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public class PorCantidadPlanesLN : BonificacionEspecialLN
    {

      public PorCantidadPlanesLN (){
       this.ProcedimientoConsulta= "BON_ConsultaBonificacionEspecial_CP";
      this.ProcedimientoActualiza = "BON_ActBonificacionEspecial_CP";
    this.ProcedimientoElimina= "BON_BorrarBonificacionEspecial_CP";
   this.ProcedimientoInserta= "BON_CrearBonificacionEspecial_CP";
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
