using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.LN.Consultas
{
    public class VentasLN
    {
        public string CargarVentas(Ventas ObjEntidad, string Procedimiento)
        {
            String Consulta = String.Empty;
            return Consulta = new VentasAD().CargarVentas(ObjEntidad, Procedimiento);
        }

        public string Reglas(Ventas ObjEntidad, string Procedimiento)
        {
            String Actualiza = String.Empty;
            return Actualiza = new VentasAD().Aplicarreglas(ObjEntidad, Procedimiento);
        }

        public string ActualizaCampos(string Procedimiento)
        {
            String Result = String.Empty;
            return Result = new VentasAD().ActualizaCampos(Procedimiento);
        
        }
    }
}
