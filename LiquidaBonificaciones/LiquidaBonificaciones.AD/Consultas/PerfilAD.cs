using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.AD.Consultas
{
    public class PerfilAD
    {

        WcfData wsc = new WcfData();

        public IList<Perfil> Perfiles(string procedimiento)
        {
            List<Perfil> listaPerfil = new List<Perfil>();
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
                        Perfil objPerfil = new Perfil();
                        Valida = lista[i];
                        objPerfil.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objPerfil.pPerfil = Valida[1, 1].ToString();
                        listaPerfil.Add(objPerfil);
                    }
                }

                return listaPerfil;
            }
            catch (Exception)
            {
                return listaPerfil;
            }
        }
    }
}
