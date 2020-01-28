using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.AD.Consultas
{
    public class UsuarioAD
    {

        WcfData wsc = new WcfData();

        public IList<UsuarioEN> ConsultaUsuario(UsuarioEN ObjUsuario)
        {
            List<UsuarioEN> listaUsuario = new List<UsuarioEN>();
            List<string[,]> lista = new List<string[,]>();
            
            try
            {    
                string[, ,] Param = new string[1, 3, 1];

                Param[0, 0, 0] = ObjUsuario.pUsuario;
                Param[0, 1, 0] = "@Usuario";
                Param[0, 2, 0] = "varchar(50)";

                lista = wsc.LlenarLista(Param, "BON_ConsultaUsuario", "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    UsuarioEN objUsuario = new UsuarioEN();
                    Valida = lista[0];
   
                    objUsuario.pId = Convert.ToInt32(Valida[0, 1].ToString());
                    objUsuario.pUsuario = Valida[1, 1].ToString();
                    objUsuario.pIdPerfil = Convert.ToInt32(Valida[2, 1].ToString());
                    objUsuario.pHabilita = Convert.ToBoolean(Valida[3, 1].ToString());
                    listaUsuario.Add(objUsuario);
                }

                return listaUsuario;
            }
            catch (Exception)
            {
                return listaUsuario;
            }
        }

        public IList<UsuarioEN> UsuarioChevy(string procedimiento)
        {
            List<UsuarioEN> listaUsuario = new List<UsuarioEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[0, 0, 0];

                lista = wsc.LlenarLista(Param, procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        UsuarioEN objUsuario = new UsuarioEN();
                        Valida = lista[i];
                        objUsuario.pUsuario = Valida[0, 1].ToString();
                        listaUsuario.Add(objUsuario);
                    }

                }

                return listaUsuario;
            }
            catch (Exception)
            {
                return listaUsuario;
            }
        }

        public IList<UsuarioEN> ConsultaTodos(string procedimiento)
        {
            List<UsuarioEN> listaUsuario = new List<UsuarioEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[0, 0, 0];

                lista = wsc.LlenarLista(Param, procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count ; i++)
                    {
                        UsuarioEN objUsuario = new UsuarioEN();
                        Valida = lista[i];

                        objUsuario.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objUsuario.pUsuario = Valida[1, 1].ToString();
                        objUsuario.pIdPerfil = Convert.ToInt32(Valida[2, 1].ToString());
                        objUsuario.pPerfil = Valida[3, 1].ToString();
                        objUsuario.pHabilita = Convert.ToBoolean(Valida[4, 1].ToString());
                        listaUsuario.Add(objUsuario);
                    }
                }

                return listaUsuario;
            }
            catch (Exception)
            {
                return listaUsuario;
            }
        }

        public string GuardarActualizarEliminar(UsuarioEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[4, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pId.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.pUsuario;
                Param[1, 1, 0] = "@Usuario";
                Param[1, 2, 0] = "varchar(50)";

                Param[2, 0, 0] = ObjEntidad.pIdPerfil.ToString();
                Param[2, 1, 0] = "@IdPerfil";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = Convert.ToInt32(ObjEntidad.pHabilita == true ? 1 : 0).ToString();
                Param[3, 1, 0] = "@Habilita";
                Param[3, 2, 0] = "int";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }

    }
}
