using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
  public  class PresupuestoEN
    {
     public int ID { get; set; }
     public String Nombre { get; set; }
     public int codigoOficina { get; set; }
     public int presupuesto { get; set; }
     public int periodo { get; set; }
     public int ano { get; set; }
     public DateTime fechaActualiza { get; set; }
     public String usuarioActualiza { get; set; }
     public int codigoZona { get; set; }
     public int codigoDirector { get; set; }
     public int codigoGerente { get; set; }
     public int retoSonadoresDia { get; set; }
     public int retoExtraSonadoresDia { get; set; }
     public double bonoAsesorSonadoresDia { get; set; }
     public double bonoAsesorExtraSonadoresDia { get; set; }
     public double bonoDirectorSonadoresDia { get; set; }
     public double bonoDirectorExtraSonadoresDia { get; set; }
     public int pIdBonificacion { get; set; }
     public int pIdPlanBonificacion { get; set; }
    }
}
