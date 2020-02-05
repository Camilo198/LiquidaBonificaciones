using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.LN.Consultas
{
   public class PerfilComercialLN
    {
       public IList<PerfilComercialEN> ConsultarPerfilesComercialesLN(String ProcedimientoConsulta)
       {

           IList<PerfilComercialEN> lista = new PerfilComercialAD().ConsultarPerfilesComercialesAD(ProcedimientoConsulta);
           return lista;
       }

    }
}
