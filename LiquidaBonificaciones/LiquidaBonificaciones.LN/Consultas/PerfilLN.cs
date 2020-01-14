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
        public IList<Perfil> ConsultaPerfiles(string procedimiento)
        {
            IList<Perfil> lista = new PerfilAD().Perfiles(procedimiento);
            return lista;
        }
    }
}
