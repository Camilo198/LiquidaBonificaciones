using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
   public class PerfilComercialAD
    {
           WcfData wsc = new WcfData();

        //Retorna en una lista los parametros de la bonificacion Especial.
                  public IList<PerfilComercialEN> ConsultarPerfilesComercialesAD(string Procedimiento)
        {
            List<PerfilComercialEN> listParametro = new List<PerfilComercialEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[0, 0, 0]; // solo cuando el procedimiento almacenado tiene parametros


                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        PerfilComercialEN objParametros = new PerfilComercialEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.Nombre = Valida[1, 1].ToString();
                        listParametro.Add(objParametros);
                    }
                }

                return listParametro;
            }
            catch (Exception)
            {
                return listParametro;
            }
        }

    }
}
