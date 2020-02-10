using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
 public   class PlanDeBonificacionAD
    {
        WcfData wsc = new WcfData();

        //Retorna en una lista los parametros de la bonificacion Especial.
        public IList<PlanDeBonificacionEN> ConsultarPlanBonificacionXidAD(string Procedimiento, PlanDeBonificacionEN PlanObj)
        {
            List<PlanDeBonificacionEN> listParametro = new List<PlanDeBonificacionEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[1, 3, 1]; // solo cuando el procedimiento almacenado tiene parametros
                Param[0, 0, 0] = PlanObj.ID.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";


                lista = wsc.LlenarLista(Param, Procedimiento, "SQLBoni", "SP", "Sql");
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        PlanDeBonificacionEN objParametros = new PlanDeBonificacionEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.Nombre = Valida[1, 1].ToString();
                        objParametros.idRol = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.estado = Convert.ToBoolean(Valida[3, 1]);
                        objParametros.Descripcion = Valida[4, 1];
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


        public IList<PlanDeBonificacionEN> ConsultarPlanesBonificacion(string Procedimiento)
        {
            List<PlanDeBonificacionEN> listParametro = new List<PlanDeBonificacionEN>();
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
                        PlanDeBonificacionEN objParametros = new PlanDeBonificacionEN();
                        Valida = lista[i];

                        objParametros.ID = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.Nombre = Valida[1, 1].ToString();
                        objParametros.idRol = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.estado = Convert.ToBoolean(Valida[3, 1]);
                        objParametros.Descripcion = Valida[4, 1];
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

        public string ActualizarPlanBonificacion(PlanDeBonificacionEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[3, 3, 1];


                Param[0, 0, 0] = ObjEntidad.ID.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.estado.ToString();
                Param[1, 1, 0] = "@Estado";
                Param[1, 2, 0] = "bit";

                Param[2, 0, 0] = ObjEntidad.pUsuActualiza.ToString();
                Param[2, 1, 0] = "@usuarioActualiza";
                Param[2, 2, 0] = "Varchar(50)";



                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
