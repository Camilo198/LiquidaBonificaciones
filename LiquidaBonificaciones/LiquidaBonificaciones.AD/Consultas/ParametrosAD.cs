using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidaBonificaciones.AD.Consultas
{
    public class ParametrosAD
    {

        WcfData wsc = new WcfData();

        public IList<Parametros> ConsultaParametro(Parametros ObjEntidad, string Procedimiento)
        {
            List<Parametros> listParametro = new List<Parametros>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[1, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pTipo;
                Param[0, 1, 0] = "@Tipo";
                Param[0, 2, 0] = "varchar(50)";

                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Parametros objParametros = new Parametros();
                        Valida = lista[i];

                        objParametros.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.pParametro = Valida[1, 1].ToString();
                        objParametros.pValor = Valida[2, 1].ToString();
                        objParametros.pAplican = "0";
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

        public IList<Parametros> ConsultaParametroGnrls(string Procedimiento)
        {
            List<Parametros> listParametro = new List<Parametros>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[0, 0, 0];

                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Parametros objParametros = new Parametros();
                        Valida = lista[i];

                        objParametros.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.pTipo = Valida[1, 1].ToString();
                        objParametros.pParametro = Valida[2, 1].ToString();
                        objParametros.pValor = Valida[3, 1].ToString();
                        objParametros.pUsuActualiza = Valida[4, 1].ToString();
                        objParametros.pFecActualiza = Valida[5, 1].ToString();
                        objParametros.pObservaciones = Valida[6, 1].ToString();
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

        public string Actualizar(Parametros ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[3, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pId.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.pValor;
                Param[1, 1, 0] = "@Valor";
                Param[1, 2, 0] = "varchar(50)";

                Param[2, 0, 0] = ObjEntidad.pUsuActualiza;
                Param[2, 1, 0] = "@UsuActualiza";
                Param[2, 2, 0] = "varchar(20)";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public string GuardarHistorico(string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[0, 0, 0];
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public IList<Parametros> ConsultaParametroId(Parametros ObjEntidad, string Procedimiento)
        {
            List<Parametros> listParametro = new List<Parametros>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[2, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pId.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.pValor;
                Param[1, 1, 0] = "@Valor";
                Param[1, 2, 0] = "varchar(50)";

                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Parametros objParametros = new Parametros();
                        Valida = lista[i];

                        objParametros.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.pTipo = Valida[1, 1].ToString();
                        objParametros.pParametro = Valida[2, 1].ToString();
                        objParametros.pValor = Valida[3, 1].ToString();
                        objParametros.pUsuActualiza = Valida[4, 1].ToString();
                        objParametros.pFecActualiza = Valida[5, 1].ToString();
                        objParametros.pObservaciones = Valida[6, 1].ToString();
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
