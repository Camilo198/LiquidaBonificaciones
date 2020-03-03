using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
  public  class RetosEN
    {
   
        public int ID { get; set; }
        public String Nombre { get; set; }
        public int codigoZona { get; set; }
        public int RetoEnVentas { get; set; }
        public int periodo { get; set; }
        public int ano { get; set; }
        public int codigoGerente { get; set; }
        public DateTime fechaInicioReto { get; set; }
        public DateTime fechaFinReto { get; set; }
        public double valorBono { get; set; }
        public DateTime fechaActualiza { get; set; }
        public String usuarioActualiza { get; set; }
        public int pIdPlanBonificacion { get; set; }
    }
}
