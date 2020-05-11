using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
   public class CrmAD
    {
       WcfData wsc = new WcfData();
        public string InsertarCierreCRM(string Procedimiento,CrmEN ObjEntidad)
        {
            try
            {
                string[, ,] Param = new string[1, 3, 1];


                Param[0, 0, 0] = ObjEntidad.Usuario.ToString();
                Param[0, 1, 0] = "@usuario";
                Param[0, 2, 0] = "varchar(50)";
                

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public IList<CrmEN> ConsultarCierreCRM(string Procedimiento)
        {
            List<CrmEN> listParametro = new List<CrmEN>();
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
                        CrmEN objParametros = new CrmEN();
                        Valida = lista[i];

                        objParametros.FechaActualiza= Convert.ToDateTime(Valida[0, 1].ToString());

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
