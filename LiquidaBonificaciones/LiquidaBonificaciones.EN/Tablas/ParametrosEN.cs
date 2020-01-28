using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    [Serializable()]
    public class ParametrosEN
    {
        public Int32? pId { get; set; }
        public String pTipo { get; set; }
        public String pParametro { get; set; }
        public String pValor { get; set; }
        public String pUsuActualiza { get; set; }
        public String pFecActualiza { get; set; }
        public String pObservaciones { get; set; }

        public String pAplican { get; set; }
    }
}
