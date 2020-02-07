using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    [Serializable()]
    public class PerfilEN
    {
        public Int32? pId { get; set; }
        public String pPerfil { get; set; }
        public DateTime pFecActualiza { get; set; }
        public String pUsuActualiza { get; set; }
    }
}
