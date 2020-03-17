using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.AD.Consultas
{
    public class VentasAD
    {
        WcfData wsc = new WcfData();

        public string CargarVentas(VentasEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[3, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pFechaInicio;
                Param[0, 1, 0] = "@FecDesde";
                Param[0, 2, 0] = "datetime";

                Param[1, 0, 0] = ObjEntidad.pFechaFin;
                Param[1, 1, 0] = "@FecHasta";
                Param[1, 2, 0] = "datetime";

                Param[2, 0, 0] = ObjEntidad.pUsuarioActualiza;
                Param[2, 1, 0] = "@Usuario";
                Param[2, 2, 0] = "varchar(50)";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public string AplicarReglas(VentasEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[2, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pIdTabla;
                Param[0, 1, 0] = "@IdTabla";
                Param[0, 2, 0] = "varchar(2)";

                Param[1, 0, 0] = ObjEntidad.pCeremonia;
                Param[1, 1, 0] = "@Ceremonia";
                Param[1, 2, 0] = "varchar(20)";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public string ActualizaCampos(string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[0, 0, 0];

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }
        public string ValidarReglas(string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[0, 0, 0];


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }
    }
}
