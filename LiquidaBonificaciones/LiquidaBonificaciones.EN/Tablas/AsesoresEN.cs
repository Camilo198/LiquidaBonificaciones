using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    public class AsesoresEN
    {
        public Int32? pId { get; set; }
        public Int32? pVendCodigo { get; set; }
        public Int64? pVendIdeNro { get; set; }
        public Int32? pRegiCodigo { get; set; }
        public String pRegiNombre { get; set; }
        public Int32? pOficCodigo { get; set; }
        public String pOficNombre { get; set; }
        public Int32? pVendTipoVen { get; set; } 
        public DateTime pVendFecIng { get; set; }
        public DateTime pVendFecRet { get; set; }
        public DateTime pAsistenciaInicio { get; set; }
        public DateTime pAsistenciaFin { get; set; }
        public String pVendTipoAse { get; set; }
        public String pVendMail { get; set; }
    }
}
