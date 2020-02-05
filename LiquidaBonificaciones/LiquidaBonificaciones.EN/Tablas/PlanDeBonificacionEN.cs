using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
  public  class PlanDeBonificacionEN
    {
     public int ID { get; set; }
     public String Nombre { get; set; }
     public int idRol { get; set; }
     public Boolean estado { get; set; }
     public String Descripcion { get; set; }
    }
}
