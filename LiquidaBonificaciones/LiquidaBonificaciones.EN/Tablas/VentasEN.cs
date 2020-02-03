using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.EN.Tablas
{
    [Serializable()]
    public class VentasEN
    {
        public String pNomZona { get; set; }
        public String pNomOficina { get; set; }
        public String pCargoVendedor { get; set; }
        public Int32? pCodVendedor { get; set; }
        public String pNomVendedor { get; set; }
        public String pTipoAsesor { get; set; }
        public Int32? pContrato { get; set; }
        public String pNomCliente { get; set; }
        public String pTipoVenta { get; set; }
        public String pLineaPlan { get; set; }
        public String pConvenio { get; set; }
        public String pValorPlan { get; set; }
        public String pInscripcion { get; set; }
        public String pFechaPago { get; set; }
        public String pFechaSuscribe { get; set; }
        public String pFechaIngreso { get; set; }
        public String pNombrePlan { get; set; }
        public Int32? pPlazo { get; set; }
        public String pAyuraAsesor { get; set; }
        public String pAyuraDirector { get; set; }
        public String pValidaPlan { get; set; }
        public Int32? pVenta { get; set; }
        public Int32? pLlamadaBV { get; set; }
        public Int32? pAsamblea { get; set; }
        public Int32? pEstadoSICO { get; set; }
        public Int32? pProspecto { get; set; }
        public Int32? pAsistencia { get; set; }
        public String pFecActualizacion { get; set; }
        public String pUsuarioActualiza { get; set; }

        public String pFechaInicio { get; set; }
        public String pFechaFin { get; set; }
        public String pIdTabla { get; set; }
        public String pCeremonia { get; set; }

        public String pEstado { get; set; }

    }
}
