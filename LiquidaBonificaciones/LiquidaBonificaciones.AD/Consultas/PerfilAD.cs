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

        public IList<PerfilEN> Perfiles(string procedimiento)
        {
            List<PerfilEN> listaPerfil = new List<PerfilEN>();
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
                        PerfilEN objPerfil = new PerfilEN();
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
