using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Consultas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public abstract class BonificacionEspecialLN
    {
    protected  String ProcedimientoConsulta; 
    protected String ProcedimientoActualiza;
    protected String ProcedimientoElimina;
    protected String ProcedimientoInserta;



    public abstract IList<BonificacionEspecialEN> ConsultarBonificacionEspecialLN();


    public abstract string ActualizarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad);


    public abstract string EliminarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad);


    public abstract string InsertarBonificacionEspecialLN(BonificacionEspecialEN ObjEntidad);

    }
}
