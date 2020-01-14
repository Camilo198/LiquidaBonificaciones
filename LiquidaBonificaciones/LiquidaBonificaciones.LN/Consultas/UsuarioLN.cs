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
        public IList<Usuario> ConsultaUsuario(Usuario ObjUsuario)
        {
            IList<Usuario> lista = new UsuarioAD().ConsultaUsuario(ObjUsuario);
            return lista;
        }

        public IList<Usuario> ConsultaUsuarioChevy(string procedimiento)
        {
            IList<Usuario> lista = new UsuarioAD().UsuarioChevy(procedimiento);
            return lista;
        }

        public IList<Usuario> ConsultaTodosUsuario(string procedimiento)
        {
            IList<Usuario> lista = new UsuarioAD().ConsultaTodos(procedimiento);
            return lista;
        }

        public string Ejecutar(Usuario ObjEntidad, string Procedimiento)
        {
            String Result = String.Empty;
            return Result = new UsuarioAD().GuardarActualizarEliminar(ObjEntidad, Procedimiento);
        }

    }
}
