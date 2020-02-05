using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Consultas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public  class BonificacionEspecialLN
    {


    public  IList<BonificacionEspecialEN> ConsultarBonificacionEspecialLN(String ProcedimientoConsulta, BonificacionEspecialEN objEntidad)
    {

        IList<BonificacionEspecialEN> lista = new BonificacionEspecialAD().ConsultarBonificacionEspecialAD(ProcedimientoConsulta,objEntidad);
        return lista;
    }

    public  string ActualizarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad, String ProcedimientoActualiza)
    {
        String Actualiza = String.Empty;
        return Actualiza = new BonificacionEspecialAD().ActualizarBonificacionEspecial(ObjEntidad, ProcedimientoActualiza);
    }

    public  string EliminarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad, String ProcedimientoElimina)
    {
        String Actualiza = String.Empty;
        return Actualiza = new BonificacionEspecialAD().EliminarBonificacionEspecial(ObjEntidad, ProcedimientoElimina);
    }

    public  string InsertarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad, String ProcedimientoInserta)
    {
        String Actualiza = String.Empty;
        return Actualiza = new BonificacionEspecialAD().InsertarBonificacionEspacial(ObjEntidad, ProcedimientoInserta);
    }

    }
}
