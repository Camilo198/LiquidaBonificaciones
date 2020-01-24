using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LiquidacionBonificaciones.Modulos.Proceso
{
    public partial class Liquidacion : System.Web.UI.Page
    {
   
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Usuario objUsuario = new Usuario();
                Session["usuario"] = "cristian.munoz";
                if (Session["usuario"] == null)
                    objUsuario.pUsuario = Request.QueryString[0].ToString();
                else
                    objUsuario.pUsuario = Session["usuario"].ToString();

                IList<Usuario> lista = new UsuarioLN().ConsultaUsuario(objUsuario);

                if (lista.Count > 0)
                {
                    Usuario objUsuarioCon = new Usuario();
                    objUsuarioCon = lista[0];

                    Session["usuario"] = objUsuarioCon.pUsuario;
                    Session["perfil"] = objUsuarioCon.pIdPerfil;
                }

                if ((Session["perfil"].ToString()!= "3"))
                {
                    Response.Redirect("~/Modulos/MenuPrincipal.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/Modulos/Administracion/MenuPrincipal.aspx");
            }


            if ((Session["perfil"] == null) || (Session["usuario"] == null))
            {
                Response.Redirect("~/Modulos/Administracion/MenuPrincipal.aspx");
            }

            if (!IsPostBack)
            {
                try
                {
                    #region VALIDACIONES
                    Parametros ObjPara = new Parametros();
                    ObjPara.pTipo = "Regla";
                    IList<Parametros> DatosParametros = new ParametrosLN().Consulta(ObjPara, "BON_ConsultaParametros");

                    if (DatosParametros.Count > 0)
                    {
                      this.gvParametros.DataSource = DatosParametros;
                      this.gvParametros.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                    }

                    #endregion

                    #region FECHA LIQUIDACIÓN
                    Parametros ObjParaFec = new Parametros();
                    ObjParaFec.pTipo = "Fecha";
                    IList<Parametros> DatosParametrosFecha = new ParametrosLN().Consulta(ObjParaFec, "BON_ConsultaParametros");

                    if (DatosParametrosFecha.Count > 0)
                    {
                         this.txbFechaInicio.Text = DatosParametrosFecha[0].pValor;
                         this.txbFechaFin.Text = DatosParametrosFecha[1].pValor;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                    }
                    #endregion

                    #region CEREMONIA
                    Parametros ObjParaAsam = new Parametros();
                    ObjParaAsam.pTipo = "Ceremonia";
                    IList<Parametros> DatosParametrosCeremonia = new ParametrosLN().Consulta(ObjParaAsam, "BON_ConsultaParametros");

                    if (DatosParametrosCeremonia.Count > 0)
                    {
                        this.txbCeremonia.Text = DatosParametrosCeremonia[0].pValor;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                    }
                    #endregion

                    #region ESTADO LIQUIDACION
                    Parametros ObjParaLiqui = new Parametros();
                    ObjParaLiqui.pTipo = "Estado";
                    IList<Parametros> DatosParametrosLiqui = new ParametrosLN().Consulta(ObjParaLiqui, "BON_ConsultaParametros");

                    if (DatosParametrosLiqui.Count > 0)
                    {
                        this.txbEstado.Text = DatosParametrosLiqui[0].pValor;
                        if (DatosParametrosLiqui[0].pValor == "Cerrado")
                        {
                            this.pnlProcesos.Enabled = false;
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.LiquidacionCerrada + "');</script>", false);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                    }
                    #endregion
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }
        }

        protected void imgBtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Modulos/Proceso/Liquidacion.aspx");
        }

        protected void btnSubirVentas_Click(object sender, EventArgs e)
        {
            try
            {
                Ventas ObjVentas = new Ventas();

                ObjVentas.pFechaFin = this.txbFechaFin.Text;
                ObjVentas.pFechaInicio = this.txbFechaInicio.Text;
                ObjVentas.pUsuarioActualiza = Session["usuario"].ToString();

                String Consulta = new VentasLN().CargarVentas(ObjVentas, "BON_CargarVentas");

                if (Consulta.Substring(0, 1) != "0")
                {
       
                    this.lblNVentas.Text = Consulta.ToString();
                    Ventas ObjReglas = new Ventas();
                    ObjReglas.pCeremonia = this.txbCeremonia.Text.Substring(6, 4) + this.txbCeremonia.Text.Substring(3, 2);

                    foreach (GridViewRow dtgItem in this.gvParametros.Rows)
                    {
                        String Actualiza = String.Empty;

                        if (dtgItem.Cells[2].Text.Equals("Si"))
                        {
                            ObjReglas.pIdTabla = dtgItem.Cells[0].Text;
                            dtgItem.Cells[3].Text = new VentasLN().Reglas(ObjReglas, "BON_ContarBases");
                        }
                    }

                    string result = new VentasLN().ActualizaCampos("BON_ActualizarCampos");

                    if (result.Substring(0, 1) != "0")
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);    
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
            }
        }

        protected void btnConfirmaLiquida_Click(object sender, EventArgs e)
        {
            try
            {
                Parametros ObjPara = new Parametros();
                String Actualiza = String.Empty;

                ObjPara.pId = 11;
                ObjPara.pValor ="Cerrado";
                ObjPara.pUsuActualiza = Session["usuario"].ToString();

                Actualiza = new ParametrosLN().ActualizarParametros(ObjPara, "BON_ActParametroGeneral");

                if (Actualiza.Substring(0, 1) == "0")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
                else
                {
                    #region ESTADO LIQUIDACION
                    Parametros ObjParaLiqui = new Parametros();
                    ObjParaLiqui.pTipo = "Estado";
                    IList<Parametros> DatosParametrosLiqui = new ParametrosLN().Consulta(ObjParaLiqui, "BON_ConsultaParametros");

                    if (DatosParametrosLiqui.Count > 0)
                    {
                        this.txbEstado.Text = DatosParametrosLiqui[0].pValor;
                        this.pnlProcesos.Enabled = false;

                        String GuardarHistorico = String.Empty;
                        GuardarHistorico = new ParametrosLN().GuardarHist("BON_GuardarHistorico");

                        if (GuardarHistorico.Substring(0,1) == "0")
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorHistorico + "');</script>", false);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                    }
                    #endregion

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);    
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
            }
        }

        protected void btnLiquidar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubirAsesores_Click(object sender, EventArgs e)
        {

        }

        protected void gvParametros_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}