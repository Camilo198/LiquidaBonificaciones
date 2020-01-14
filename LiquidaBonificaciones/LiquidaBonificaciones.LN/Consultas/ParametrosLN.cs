using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.LN.Consultas
{
    public class ParametrosLN
    {
        public IList<Parametros> Consulta(Parametros ObjEntidad, string Procedimiento)
        {
            IList<Parametros> listParametro = new ParametrosAD().ConsultaParametro(ObjEntidad, Procedimiento);
            return listParametro;
        }

        public IList<Parametros> ConsultaPara(string Procedimiento)
        {
            IList<Parametros> lista = new ParametrosAD().ConsultaParametroGnrls(Procedimiento);
            return lista;
        }

        public string ActualizarParametros(Parametros ObjEntidad, string Procedimiento)
        {
            String Actualiza = String.Empty;
            return Actualiza = new ParametrosAD().Actualizar(ObjEntidad, Procedimiento);
        }

        public string GuardarHist(string Procedimiento)
        {
            String Guardar = String.Empty;
            return Guardar = new ParametrosAD().GuardarHistorico(Procedimiento);
        }

        public IList<Parametros> ConsultaParametroIdTipo(Parametros ObjEntidad, string Procedimiento)
        {
            IList<Parametros> lista = new ParametrosAD().ConsultaParametroId(ObjEntidad,Procedimiento);
            return lista;
        }
    }
}
