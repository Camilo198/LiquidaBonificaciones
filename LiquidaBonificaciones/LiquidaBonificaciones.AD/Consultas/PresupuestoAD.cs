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
                        objParametros.codigoZona = Convert.ToInt32(Valida[6, 1].ToString());
                        objParametros.codigoDirector = Convert.ToInt32(Valida[7, 1].ToString());
                        objParametros.codigoGerente = Convert.ToInt32(Valida[8, 1].ToString());
                        objParametros.retoSonadoresDia = Convert.ToInt32(Valida[9, 1].ToString());
                        objParametros.retoExtraSonadoresDia= Convert.ToInt32(Valida[10, 1].ToString());
                        objParametros.bonoAsesorSonadoresDia = Convert.ToInt32(Valida[11, 1].ToString());
                        objParametros.bonoAsesorExtraSonadoresDia = Convert.ToInt32(Valida[12, 1].ToString());
                        objParametros.bonoDirectorSonadoresDia = Convert.ToInt32(Valida[13, 1].ToString());
                        objParametros.bonoDirectorExtraSonadoresDia = Convert.ToInt32(Valida[14, 1].ToString());
                        objParametros.pIdBonificacion = Convert.ToInt32(Valida[15, 1].ToString());
                        objParametros.pIdPlanBonificacion = Convert.ToInt32(Valida[16, 1].ToString());
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

        //Retorna en una lista los parametros de la bonificacion Especial.
        public IList<PresupuestoEN> ConsultarPresupuestosXoficinaAD(string Procedimiento, PresupuestoEN objPresupuesto)
        {
            List<PresupuestoEN> listParametro = new List<PresupuestoEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {

                string[, ,] Param = new string[3, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros
                Param[0, 0, 0] = objPresupuesto.ano.ToString();
                Param[0, 1, 0] = "@Ano";
                Param[0, 2, 0] = "Int";

                Param[1, 0, 0] = objPresupuesto.periodo.ToString();
                Param[1, 1, 0] = "@Periodo";
                Param[1, 2, 0] = "Int";

                Param[2, 0, 0] = objPresupuesto.codigoOficina.ToString();
                Param[2, 1, 0] = "@Oficina";
                Param[2, 2, 0] = "Int";
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
                        objParametros.codigoZona = Convert.ToInt32(Valida[6, 1].ToString());
                        objParametros.codigoDirector = Convert.ToInt32(Valida[7, 1].ToString());
                        objParametros.codigoGerente = Convert.ToInt32(Valida[8, 1].ToString());
                        objParametros.retoSonadoresDia = Convert.ToInt32(Valida[9, 1].ToString());
                        objParametros.retoExtraSonadoresDia = Convert.ToInt32(Valida[10, 1].ToString());
                        objParametros.bonoAsesorSonadoresDia = Convert.ToInt32(Valida[11, 1].ToString());
                        objParametros.bonoAsesorExtraSonadoresDia = Convert.ToInt32(Valida[12, 1].ToString());
                        objParametros.bonoDirectorSonadoresDia = Convert.ToInt32(Valida[13, 1].ToString());
                        objParametros.bonoDirectorExtraSonadoresDia = Convert.ToInt32(Valida[14, 1].ToString());
                        objParametros.pIdBonificacion = Convert.ToInt32(Valida[15, 1].ToString());
                        objParametros.pIdPlanBonificacion = Convert.ToInt32(Valida[16, 1].ToString());
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
                string[, ,] Param = new string[14, 3, 1];


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

                Param[5, 0, 0] = ObjEntidad.codigoZona.ToString();
                Param[5, 1, 0] = "@codZona";
                Param[5, 2, 0] = "int";

                Param[6, 0, 0] = ObjEntidad.codigoDirector.ToString();
                Param[6, 1, 0] = "@codDirector";
                Param[6, 2, 0] = "int";

                Param[7, 0, 0] = ObjEntidad.codigoGerente.ToString();
                Param[7, 1, 0] = "@codGerente";
                Param[7, 2, 0] = "int";

                Param[8, 0, 0] = ObjEntidad.retoSonadoresDia.ToString();
                Param[8, 1, 0] = "@retoSonadores";
                Param[8, 2, 0] = "int";

                Param[9, 0, 0] = ObjEntidad.retoExtraSonadoresDia.ToString();
                Param[9, 1, 0] = "@retoExtraSonadores";
                Param[9, 2, 0] = "int";

                Param[10, 0, 0] = ObjEntidad.bonoAsesorSonadoresDia.ToString();
                Param[10, 1, 0] = "@bonoAsesorSonadores";
                Param[10, 2, 0] = "numeric";

                Param[11, 0, 0] = ObjEntidad.bonoAsesorExtraSonadoresDia.ToString();
                Param[11, 1, 0] = "@bonoAsesorExtraSonadores";
                Param[11, 2, 0] = "numeric";

                Param[12, 0, 0] = ObjEntidad.bonoDirectorSonadoresDia.ToString();
                Param[12, 1, 0] = "@bonoDirectoSonadores";
                Param[12, 2, 0] = "numeric";

                Param[13, 0, 0] = ObjEntidad.bonoDirectorExtraSonadoresDia.ToString();
                Param[13, 1, 0] = "@bonoDirectorExtraSonadores";
                Param[13, 2, 0] = "numeric";

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
                string[, ,] Param = new string[14, 3, 1];


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

                Param[5, 0, 0] = ObjEntidad.codigoZona.ToString();
                Param[5, 1, 0] = "@codZona";
                Param[5, 2, 0] = "int";

                Param[6, 0, 0] = ObjEntidad.codigoGerente.ToString();
                Param[6, 1, 0] = "@codGerente";
                Param[6, 2, 0] = "int";

                Param[7, 0, 0] = ObjEntidad.codigoDirector.ToString();
                Param[7, 1, 0] = "@codDirector";
                Param[7, 2, 0] = "int";

                Param[8, 0, 0] = ObjEntidad.retoSonadoresDia.ToString();
                Param[8, 1, 0] = "@retoSonadores";
                Param[8, 2, 0] = "int";

                Param[9, 0, 0] = ObjEntidad.retoExtraSonadoresDia.ToString();
                Param[9, 1, 0] = "@retoExtraSonadores";
                Param[9, 2, 0] = "int";

                Param[10, 0, 0] = ObjEntidad.bonoAsesorSonadoresDia.ToString();
                Param[10, 1, 0] = "@bonoAsesorSonadores";
                Param[10, 2, 0] = "numeric";

                Param[11, 0, 0] = ObjEntidad.bonoAsesorExtraSonadoresDia.ToString();
                Param[11, 1, 0] = "@bonoAsesorExtraSonadores";
                Param[11, 2, 0] = "numeric";

                Param[12, 0, 0] = ObjEntidad.bonoDirectorSonadoresDia.ToString();
                Param[12, 1, 0] = "@bonoDirectoSonadores";
                Param[12, 2, 0] = "numeric";

                Param[13, 0, 0] = ObjEntidad.bonoDirectorExtraSonadoresDia.ToString();
                Param[13, 1, 0] = "@bonoDirectorExtraSonadores";
                Param[13, 2, 0] = "numeric";


                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }


    }


}
