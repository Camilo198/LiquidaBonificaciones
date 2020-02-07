using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    [Serializable()]
  public  class BonificacionEspecialEN
    {
        public Int32 pId { get; set; }
        public String pDescripcionBono { get; set; }
        public Double pPlanesMinimos { get; set; }
        public Double pPlanesMaximos { get; set; }
        public Double pValorBono { get; set; }
        public Boolean pEstado { get; set; }
        public DateTime pFecActualiza { get; set; }
        public String pUsuActualiza { get; set; }
        public int pIdPlanBonificacion { get; set; }
        
    }
}
