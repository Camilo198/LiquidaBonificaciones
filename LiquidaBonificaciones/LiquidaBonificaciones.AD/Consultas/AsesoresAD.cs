using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiquidaBonificaciones.AD.Servicios;
using LiquidaBonificaciones.EN.Tablas;

namespace LiquidaBonificaciones.AD.Consultas
{
  public  class AsesoresAD
    {

      WcfData wsc = new WcfData();

        public IList<AsesoresEN> ConsultarAsesoresSicoAD()
        {
            List<AsesoresEN> listParametro = new List<AsesoresEN>();
            List<string[,]> lista = new List<string[,]>();

            try
            {
                string[, ,] Param = new string[0, 0, 0]; // solo cuando el procedimiento almacenado tiene parametros


                String sentenciaSicoSQL = "SELECT VEND.VendCodigo, VEND.VendTipoVen, OFIC.OficCodigo, VEND.VendIdeNro, OFIC.OficNombre, VEND.VendFecIng, VEND.VendFecRet, VEND.VendTipoAse, VEND.VendMail FROM  VEND, OFIC WHERE VEND.VendCodOfi = OFIC.OficCodigo";
                String keyODBC = "SICO";
                String tipoConsulta = "sql";
                String tipoConexion = "ODBC";          
                lista = wsc.LlenarLista(Param, sentenciaSicoSQL, keyODBC, tipoConsulta, tipoConexion);
                
                string[,] Valida;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        AsesoresEN objParametros = new AsesoresEN();
                        Valida = lista[i];

                        objParametros.pVendCodigo = Convert.ToInt32(Valida[0, 1].ToString());
                        objParametros.pVendTipoVen= Convert.ToInt32(Valida[1, 1].ToString());
                        objParametros.pOficCodigo = Convert.ToInt32(Valida[2, 1]);
                        objParametros.pVendIdeNro = Valida[3, 1];
                        objParametros.pOficNombre = Valida[4, 1];
                        objParametros.pVendFecIng = Convert.ToDateTime(wsc.fechaJulianaToGregoriana(Convert.ToInt64(Valida[5, 1])).ToString());
                        objParametros.pVendFecRet = Convert.ToDateTime(wsc.fechaJulianaToGregoriana(Convert.ToInt64(Valida[6, 1])).ToString());
                        objParametros.pVendTipoAse = Valida[7, 1];
                        objParametros.pVendMail = Valida[8, 1].ToString();
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


        public string InsertarAsesoresSQL(AsesoresEN ObjEntidad, string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[9, 3, 1];

                Param[0, 0, 0] = ObjEntidad.pVendCodigo.ToString();
                Param[0, 1, 0] = "@codigoVendedor";
                Param[0, 2, 0] = "int";

                Param[1, 0, 0] = ObjEntidad.pVendTipoVen.ToString();
                Param[1, 1, 0] = "@tipoVenta";
                Param[1, 2, 0] = "int";

                Param[2, 0, 0] = ObjEntidad.pOficCodigo.ToString();
                Param[2, 1, 0] = "@codigoOficina";
                Param[2, 2, 0] = "int";

                Param[3, 0, 0] = ObjEntidad.pVendIdeNro;
                Param[3, 1, 0] = "@idVendedor";
                Param[3, 2, 0] = "varchar(50)";

                Param[4, 0, 0] = ObjEntidad.pOficNombre;
                Param[4, 1, 0] = "@nombreOficina";
                Param[4, 2, 0] = "varchar(250)";

                Param[5, 0, 0] = ObjEntidad.pVendFecIng.ToString();
                Param[5, 1, 0] = "@fechaIngreso";
                Param[5, 2, 0] = "datetime";

                Param[6, 0, 0] = ObjEntidad.pVendFecRet.ToString();
                Param[6, 1, 0] = "@fechaRetiro";
                Param[6, 2, 0] = "datetime";

                Param[7, 0, 0] = ObjEntidad.pVendTipoAse;
                Param[7, 1, 0] = "@tipoAsesor";
                Param[7, 2, 0] = "varchar(10)";

                Param[8, 0, 0] = ObjEntidad.pVendMail;
                Param[8, 1, 0] = "@Email";
                Param[8, 2, 0] = "varchar(100)";
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string EliminarAsesores(string Procedimiento)
        {
            try
            {
                string[, ,] Param = new string[0, 0, 0];
                return wsc.Ejecutar(Param, Procedimiento, "SQLBoni");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

    }
}
