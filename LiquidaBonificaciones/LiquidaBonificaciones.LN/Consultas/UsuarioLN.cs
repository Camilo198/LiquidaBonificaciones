using LiquidaBonificaciones.AD.Consultas;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.LN.Consultas
{
    public class UsuarioLN
    {
        public IList<UsuarioEN> ConsultaUsuario(UsuarioEN ObjUsuario)
        {
            IList<UsuarioEN> lista = new UsuarioAD().ConsultaUsuario(ObjUsuario);
            return lista;
        }

        public IList<UsuarioEN> ConsultaUsuarioChevy(string procedimiento)
        {
            IList<UsuarioEN> lista = new UsuarioAD().UsuarioChevy(procedimiento);
            return lista;
        }

        public IList<UsuarioEN> ConsultaTodosUsuario(string procedimiento)
        {
            IList<UsuarioEN> lista = new UsuarioAD().ConsultaTodos(procedimiento);
            return lista;
        }

        public string Ejecutar(UsuarioEN ObjEntidad, string Procedimiento)
        {
            String Result = String.Empty;
            return Result = new UsuarioAD().GuardarActualizarEliminar(ObjEntidad, Procedimiento);
        }

    }
}
