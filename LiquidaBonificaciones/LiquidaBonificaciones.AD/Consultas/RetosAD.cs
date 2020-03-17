using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
 public  class RetosAD
    {
        WcfData wsc = new WcfData();

        public IList<RetosEN> ConsultarRetosXidPlanAD(string Procedimiento, RetosEN objEntidad)
        {
            List<RetosEN> listParametro = new List<RetosEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[1, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros


                Param[0, 0, 0] = objEntidad.pIdPlanBonificacion.ToString();
                Param[0, 1, 0] = "@IdPlanBonificacion";
                Param[0, 2, 0] = "int";


                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        RetosEN objParametros = new RetosEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.codigoZona = Convert.ToInt32(Valida[1, 1].ToString());
                        objParametros.RetoEnVentas = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.periodo = Convert.ToInt32(Valida[3, 1].ToString());
                        objParametros.ano = Convert.ToInt32(Valida[4, 1].ToString());
                        objParametros.codigoGerente = Convert.ToInt32(Valida[5, 1]);
                        objParametros.fechaInicioReto = Convert.ToDateTime(Valida[6, 1].ToString());
                        objParametros.fechaFinReto = Convert.ToDateTime(Valida[7, 1].ToString());
                        objParametros.valorBono = Convert.ToInt32(Valida[8, 1].ToString());
                        objParametros.numeroReto = Convert.ToInt32(Valida[16, 1].ToString());
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

        //Retorna en una lista los parametros de los Retos.
        public IList<RetosEN> ConsultarRetosAD(string Procedimiento, RetosEN objReto)
        {
            List<RetosEN> listParametro = new List<RetosEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[2, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros
                Param[0, 0, 0] = objReto.ano.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";

                Param[1, 0, 0] = objReto.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "Int";
                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        RetosEN objParametros = new RetosEN();
                        Valida = lista[i];

                        objParametros.codigoZona = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.RetoEnVentas = Convert.ToInt32(Valida[1, 1].ToString());
                        objParametros.periodo = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.ano = Convert.ToInt32(Valida[3, 1].ToString());
                        objParametros.codigoGerente = Convert.ToInt32(Valida[4, 1].ToString());
                        objParametros.fechaInicioReto = Convert.ToDateTime(Valida[5, 1].ToString());
                        objParametros.fechaFinReto = Convert.ToDateTime(Valida[6, 1].ToString());
                        objParametros.valorBono = Convert.ToDouble(Valida[7, 1].ToString());
                        objParametros.fechaActualiza = Convert.ToDateTime(Valida[8, 1].ToString());
                        objParametros.usuarioActualiza = Valida[9, 1];
                        objParametros.numeroReto = Convert.ToInt32(Valida[10, 1].ToString());
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

        public IList<RetosEN> ConsultarRetosXllaveAD(string Procedimiento, RetosEN objReto)
        {
            List<RetosEN> listParametro = new List<RetosEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[,,] Param = new string[5, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros
                Param[0, 0, 0] = objReto.ano.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";

                Param[1, 0, 0] = objReto.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "Int";

                Param[2, 0, 0] = objReto.codigoGerente.ToString();
                Param[2, 1, 0] = "@CodigoGerente";
                Param[2, 2, 0] = "Int";

                Param[3, 0, 0] = objReto.fechaInicioReto.ToString();
                Param[3, 1, 0] = "@FechaIni";
                Param[3, 2, 0] = "datetime";

                Param[4, 0, 0] = objReto.fechaFinReto.ToString();
                Param[4, 1, 0] = "@FechaFin";
                Param[4, 2, 0] = "datetime";
                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        RetosEN objParametros = new RetosEN();
                        Valida = lista[i];

                        objParametros.codigoZona = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.RetoEnVentas = Convert.ToInt32(Valida[1, 1].ToString());
                        objParametros.periodo = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.ano = Convert.ToInt32(Valida[3, 1].ToString());
                        objParametros.codigoGerente = Convert.ToInt32(Valida[4, 1].ToString());
                        objParametros.fechaInicioReto = Convert.ToDateTime(Valida[5, 1].ToString());
                        objParametros.fechaFinReto = Convert.ToDateTime(Valida[6, 1].ToString());
                        objParametros.valorBono = Convert.ToDouble(Valida[7, 1].ToString());
                        objParametros.fechaActualiza = Convert.ToDateTime(Valida[8, 1].ToString());
                        objParametros.usuarioActualiza = Valida[9, 1];
                        objParametros.numeroReto= Convert.ToInt32(Valida[10, 1].ToString());
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


        public IList<RetosEN> ConsultarAnosRetosAD(string Procedimiento)
        {
            List<RetosEN> listParametro = new List<RetosEN>();
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
                        RetosEN objParametros = new RetosEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.Nombre = Valida[0, 1];

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

        public IList<RetosEN> ConsultarPeriodosRetosXanoAD(string Procedimiento, RetosEN objReto)
        {
            List<RetosEN> listParametro = new List<RetosEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[1, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros

                Param[0, 0, 0] = objReto.ID.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";


                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        RetosEN objParametros = new RetosEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.Nombre = Valida[0, 1].ToString();
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

        public string ActualizarRetoAD(RetosEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[9, 3, 1];


                Param[0, 0, 0] = ObjEntidad.codigoZona.ToString();
                Param[0, 1, 0] = "@codZona";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.RetoEnVentas.ToString();
                Param[1, 1, 0] = "@RetoEnVentas";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.periodo.ToString();
                Param[2, 1, 0] = "@periodo";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.ano.ToString();
                Param[3, 1, 0] = "@ano";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.codigoGerente.ToString();
                Param[4, 1, 0] = "@codGerente";
                Param[4, 2, 0] = "int";

                Param[5, 0, 0] = ObjEntidad.fechaInicioReto.ToString();
                Param[5, 1, 0] = "@fechaInicioReto";
                Param[5, 2, 0] = "datetime";

                Param[6, 0, 0] = ObjEntidad.fechaFinReto.ToString();
                Param[6, 1, 0] = "@fechaFinReto";
                Param[6, 2, 0] = "datetime";

                Param[7, 0, 0] = ObjEntidad.valorBono.ToString();
                Param[7, 1, 0] = "@valorBono";
                Param[7, 2, 0] = "numeric";

                Param[8, 0, 0] = ObjEntidad.usuarioActualiza.ToString();
                Param[8, 1, 0] = "@usuarioactualiza";
                Param[8, 2, 0] = "varchar(50)";


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string EliminarRetoAD(RetosEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[5, 3, 1];
                Param[0, 0, 0] = ObjEntidad.codigoGerente.ToString();
                Param[0, 1, 0] = "@CodGerente";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.ano.ToString();
                Param[2, 1, 0] = "@Ano";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.fechaInicioReto.ToString();
                Param[3, 1, 0] = "@fechaInicioReto";
                Param[3, 2, 0] = "datetime";

                Param[4, 0, 0] = ObjEntidad.fechaFinReto.ToString();
                Param[4, 1, 0] = "@fechaFinReto";
                Param[4, 2, 0] = "datetime";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string InsertarRetoAD(RetosEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[10, 3, 1];


                Param[0, 0, 0] = ObjEntidad.codigoZona.ToString();
                Param[0, 1, 0] = "@codZona";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.RetoEnVentas.ToString();
                Param[1, 1, 0] = "@RetoEnVentas";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.periodo.ToString();
                Param[2, 1, 0] = "@periodo";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.ano.ToString();
                Param[3, 1, 0] = "@ano";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.codigoGerente.ToString();
                Param[4, 1, 0] = "@codGerente";
                Param[4, 2, 0] = "int";

                Param[5, 0, 0] = ObjEntidad.fechaInicioReto.ToString();
                Param[5, 1, 0] = "@fechaInicioReto";
                Param[5, 2, 0] = "datetime";

                Param[6, 0, 0] = ObjEntidad.fechaFinReto.ToString();
                Param[6, 1, 0] = "@fechaFinReto";
                Param[6, 2, 0] = "datetime";

                Param[7, 0, 0] = ObjEntidad.valorBono.ToString();
                Param[7, 1, 0] = "@valorBono";
                Param[7, 2, 0] = "numeric";

                Param[8, 0, 0] = ObjEntidad.usuarioActualiza.ToString();
                Param[8, 1, 0] = "@usuarioactualiza";
                Param[8, 2, 0] = "varchar(50)";

                Param[9, 0, 0] = ObjEntidad.numeroReto.ToString();
                Param[9, 1, 0] = "@numeroReto";
                Param[9, 2, 0] = "int";


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
    }
}
