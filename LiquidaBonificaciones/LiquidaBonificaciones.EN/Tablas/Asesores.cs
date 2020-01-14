using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    public class Asesores
    {
        public Int32? pId { get; set; }
        public Int32? pVendCodigo { get; set; }
        public Int32? pVendTipoVen { get; set; }
        public Int32? pOficCodigo { get; set; }
        public String pVendIdeNro { get; set; }
        public String pOficNombre { get; set; }
        public Int32? pVendFecIng { get; set; }
        public Int32? pVendFecRet { get; set; }
        public String pVendTipoAse { get; set; }
        public String pVendMail { get; set; }
    }
}
