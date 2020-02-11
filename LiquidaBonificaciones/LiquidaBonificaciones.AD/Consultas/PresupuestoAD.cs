using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
   public class PresupuestoAD
    {
        WcfData wsc = new WcfData();

        //Retorna en una lista los parametros de la bonificacion Especial.
        public IList<PresupuestoEN> ConsultarPresupuestosAD(string Procedimiento, PresupuestoEN objPresupuesto)
        {
            List<PresupuestoEN> listParametro = new List<PresupuestoEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[2, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros
                Param[0, 0, 0] = objPresupuesto.ano.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";
                
                Param[1, 0, 0] = objPresupuesto.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "Int";
                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        PresupuestoEN objParametros = new PresupuestoEN();
                        Valida = lista[i];

                        objParametros.codigoOficina = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.presupuesto = Convert.ToInt32(Valida[1, 1].ToString());
                        objParametros.periodo = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.ano = Convert.ToInt32(Valida[3, 1].ToString());
                        objParametros.fechaActualiza = Convert.ToDateTime(Valida[4, 1].ToString());
                        objParametros.usuarioActualiza = Valida[5, 1];
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


        public IList<PresupuestoEN> ConsultarAnosPresupuestosAD(string Procedimiento)
        {
            List<PresupuestoEN> listParametro = new List<PresupuestoEN>();
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
                        PresupuestoEN objParametros = new PresupuestoEN();
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

        public IList<PresupuestoEN> ConsultarPeriodosPresupuestosXanoAD(string Procedimiento, PresupuestoEN objPresupuesto)
        {
            List<PresupuestoEN> listParametro = new List<PresupuestoEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[1, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros

                Param[0, 0, 0] = objPresupuesto.ID.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";


                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        PresupuestoEN objParametros = new PresupuestoEN();
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

        public string ActualizarPresupuestoAD(PresupuestoEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[5, 3, 1];


                Param[0, 0, 0] = ObjEntidad.codigoOficina.ToString();
                Param[0, 1, 0] = "@codOficina";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.presupuesto.ToString();
                Param[1, 1, 0] = "@Presupuesto";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.periodo.ToString();
                Param[2, 1, 0] = "@periodo";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.ano.ToString();
                Param[3, 1, 0] = "@ano";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.usuarioActualiza.ToString();
                Param[4, 1, 0] = "@usuarioactualiza";
                Param[4, 2, 0] = "varchar(50)";


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string EliminarPresupuestoAD(PresupuestoEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[3, 3, 1];
                Param[0, 0, 0] = ObjEntidad.codigoOficina.ToString();
                Param[0, 1, 0] = "@CodOficina";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.ano.ToString();
                Param[2, 1, 0] = "@Ano";
                Param[2, 2, 0] = "int";
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string InsertarPresupuestoAD(PresupuestoEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[5, 3, 1];


                Param[0, 0, 0] = ObjEntidad.codigoOficina.ToString();
                Param[0, 1, 0] = "@codOficina";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.presupuesto.ToString();
                Param[1, 1, 0] = "@Presupuesto";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.periodo.ToString();
                Param[2, 1, 0] = "@periodo";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.ano.ToString();
                Param[3, 1, 0] = "@ano";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.usuarioActualiza.ToString();
                Param[4, 1, 0] = "@usuarioactualiza";
                Param[4, 2, 0] = "varchar(50)";


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }


    }


}
