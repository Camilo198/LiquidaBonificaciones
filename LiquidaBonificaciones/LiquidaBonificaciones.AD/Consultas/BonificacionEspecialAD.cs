using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.AD.Servicios;

namespace LiquidaBonificaciones.AD.Consultas
{
  public  class BonificacionEspecialAD
    {
      WcfData wsc = new WcfData();

      //Retorna en una lista los parametros de la bonificacion Especial.
        public IList<BonificacionEspecialEN> ConsultarBonificacionEspecialAD(string Procedimiento)
        {
            List<BonificacionEspecialEN> listParametro = new List<BonificacionEspecialEN>();
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
                        BonificacionEspecialEN objParametros = new BonificacionEspecialEN();
                        Valida = lista[i];

                        objParametros.pId = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.pDescripcionBono = Valida[1, 1].ToString();
                        objParametros.pPlanesMinimos = Convert.ToInt32(Valida[2, 1].ToString());
                        objParametros.pPlanesMaximos = Convert.ToInt32(Valida[3, 1].ToString());
                        objParametros.pValorBono = Valida[4, 1].ToString();
                        objParametros.pAplica = Convert.ToBoolean(Valida[5, 1]);
                        objParametros.pFecActualiza = Convert.ToDateTime(Valida[6, 1].ToString());
                        objParametros.pUsuActualiza = Valida[7, 1].ToString();
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


        public string ActualizarBonificacionEspecial(BonificacionEspecialEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[7, 3, 1];


                Param[0, 0, 0] = ObjEntidad.pId.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.pDescripcionBono;
                Param[1, 1, 0] = "@descripcion";
                Param[1, 2, 0] = "varchar(50)";

                Param[2, 0, 0] = ObjEntidad.pPlanesMinimos.ToString();
                Param[2, 1, 0] = "@planesMinimos";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.pPlanesMaximos.ToString();
                Param[3, 1, 0] = "@planesMaximos";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.pValorBono;
                Param[4, 1, 0] = "@valorBono";
                Param[4, 2, 0] = "int";

                Param[5, 0, 0] = ObjEntidad.pAplica.ToString();
                Param[5, 1, 0] = "@Aplica";
                Param[5, 2, 0] = "bit";

                Param[6, 0, 0] = ObjEntidad.pUsuActualiza;
                Param[6, 1, 0] = "@usuarioactualiza";
                Param[6, 2, 0] = "varchar(50)";

                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string EliminarBonificacionEspecial(BonificacionEspecialEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[1, 3, 1];
                Param[0, 0, 0] = ObjEntidad.pId.ToString();
                Param[0, 1, 0] = "@Id";
                Param[0, 2, 0] = "int";
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string InsertarBonificacionEspacial(BonificacionEspecialEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[6, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pDescripcionBono;
                Param[0, 1, 0] = "@descripcion";
                Param[0, 2, 0] = "varchar(50)";

                Param[1, 0, 0] = ObjEntidad.pPlanesMinimos.ToString();
                Param[1, 1, 0] = "@planesMinimos";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.pPlanesMaximos.ToString();
                Param[2, 1, 0] = "@planesMaximos";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.pValorBono;
                Param[3, 1, 0] = "@valorBono";
                Param[3, 2, 0] = "int";

                Param[4, 0, 0] = ObjEntidad.pAplica.ToString();
                Param[4, 1, 0] = "@Aplica";
                Param[4, 2, 0] = "bit";

                Param[5, 0, 0] = ObjEntidad.pUsuActualiza;
                Param[5, 1, 0] = "@usuarioactualiza";
                Param[5, 2, 0] = "varchar(50)";
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
