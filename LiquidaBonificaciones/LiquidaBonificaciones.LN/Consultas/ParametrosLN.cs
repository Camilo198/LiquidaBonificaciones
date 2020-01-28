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
        public IList<ParametrosEN> Consulta(ParametrosEN ObjEntidad, string Procedimiento)
        {
            IList<ParametrosEN> listParametro = new ParametrosAD().ConsultaParametro(ObjEntidad, Procedimiento);
            return listParametro;
        }

        public IList<ParametrosEN> ConsultaPara(string Procedimiento)
        {
            IList<ParametrosEN> lista = new ParametrosAD().ConsultaParametroGnrls(Procedimiento);
            return lista;
        }

        public string ActualizarParametros(ParametrosEN ObjEntidad, string Procedimiento)
        {
            String Actualiza = String.Empty;
            return Actualiza = new ParametrosAD().Actualizar(ObjEntidad, Procedimiento);
        }

        public string GuardarHist(string Procedimiento)
        {
            String Guardar = String.Empty;
            return Guardar = new ParametrosAD().GuardarHistorico(Procedimiento);
        }

        public IList<ParametrosEN> ConsultaParametroIdTipo(ParametrosEN ObjEntidad, string Procedimiento)
        {
            IList<ParametrosEN> lista = new ParametrosAD().ConsultaParametroId(ObjEntidad,Procedimiento);
            return lista;
        }
    }
}
