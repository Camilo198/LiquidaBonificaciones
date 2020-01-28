using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.LN.Consultas
{
    public class PerfilLN
    {
        public IList<PerfilEN> ConsultaPerfiles(string procedimiento)
        {
            IList<PerfilEN> lista = new PerfilAD().Perfiles(procedimiento);
            return lista;
        }
    }
}
