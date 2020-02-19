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
                UsuarioEN objUsuario = new UsuarioEN();
                Session["usuario"] = "cristian.munoz";
                if (Session["usuario"] == null)
                    objUsuario.pUsuario = Request.QueryString[0].ToString();
                else
                    objUsuario.pUsuario = Session["usuario"].ToString();

                IList<UsuarioEN> lista = new UsuarioLN().ConsultaUsuario(objUsuario);

                if (lista.Count > 0)
                {
                    UsuarioEN objUsuarioCon = new UsuarioEN();
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
                    ParametrosEN ObjPara = new ParametrosEN();
                    ObjPara.pTipo = "Regla";
                    IList<ParametrosEN> DatosParametros = new ParametrosLN().Consulta(ObjPara, "BON_ConsultaParametros");

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
                    ParametrosEN ObjParaFec = new ParametrosEN();
                    ObjParaFec.pTipo = "Fecha";
                    IList<ParametrosEN> DatosParametrosFecha = new ParametrosLN().Consulta(ObjParaFec, "BON_ConsultaParametros");

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
                    ParametrosEN ObjParaAsam = new ParametrosEN();
                    ObjParaAsam.pTipo = "Ceremonia";
                    IList<ParametrosEN> DatosParametrosCeremonia = new ParametrosLN().Consulta(ObjParaAsam, "BON_ConsultaParametros");

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
                    ParametrosEN ObjParaEstadoLiqui = new ParametrosEN();
                    ObjParaEstadoLiqui.pTipo = "Estado";
                    IList<ParametrosEN> DatosParametrosEstadoLiqui = new ParametrosLN().Consulta(ObjParaEstadoLiqui, "BON_ConsultaParametros");

                    if (DatosParametrosEstadoLiqui.Count > 0)
                    {
                        this.txbEstado.Text = DatosParametrosEstadoLiqui[0].pValor;
                        if (DatosParametrosEstadoLiqui[0].pValor == "Cerrado")
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

                    #region PERIODO LIQUIDACION
                    ParametrosEN ObjParaFechaLiqui = new ParametrosEN();
                    ObjParaFechaLiqui.pTipo = "Liquidacion";
                    IList<ParametrosEN> DatosParametrosFechaLiqui = new ParametrosLN().Consulta(ObjParaFechaLiqui, "BON_ConsultaParametros");

                    if (DatosParametrosFechaLiqui.Count > 0)
                    {
                  
                        this.txbPeriodo.Text = DatosParametrosFechaLiqui[0].pValor;
                        this.txbano.Text = DatosParametrosFechaLiqui[1].pValor;
                        if (DatosParametrosFechaLiqui[0].pValor == "Cerrado")
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
                VentasEN ObjVentas = new VentasEN();

                ObjVentas.pFechaFin = this.txbFechaFin.Text;
                ObjVentas.pFechaInicio = this.txbFechaInicio.Text;
                ObjVentas.pUsuarioActualiza = Session["usuario"].ToString();

                String Consulta = new VentasLN().CargarVentas(ObjVentas, "BON_CargarVentas");

                if (Consulta.Substring(0, 1) != "0")
                {
       
                    this.lblNVentas.Text = Consulta.ToString();
                    VentasEN ObjReglas = new VentasEN();
                    ObjReglas.pCeremonia = this.txbCeremonia.Text.Substring(6, 4) + this.txbCeremonia.Text.Substring(3, 2);
                    int ContadorReglas = 0;
                    foreach (GridViewRow dtgItem in this.gvParametros.Rows)
                    {
                        String Actualiza = String.Empty;

                        if (dtgItem.Cells[2].Text.Equals("Si"))
                        {
                            ContadorReglas++;
                            ObjReglas.pIdTabla = dtgItem.Cells[0].Text;
                            dtgItem.Cells[3].Text = new VentasLN().AplicarReglas(ObjReglas, "BON_ContarBases");
                            if (dtgItem.Cells[3].Text == "0" && dtgItem.Cells[0].Text=="21" ) {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.sinPersistencia + "');</script>", false);
                            }
                            if (dtgItem.Cells[3].Text == "0" && dtgItem.Cells[0].Text == "3")
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.sinCeremonia + "');</script>", false);
                            }
                        }
                    }
                    
                    string resultActCampos = new VentasLN().ActualizaCampos("BON_ActualizarCampos");
                    ObjReglas.pIdTabla = (ContadorReglas-1).ToString();// Se le resta 1 ya que no se tiene en cuenta la asistencia de Kactus en la suma de reglas
                   this.TextVentasValidas.Text= new VentasLN().ValidarReglas(ObjReglas, "BON_CalculaReglas");
                   this.TextVentasValidas.Enabled = false;

                    if (resultActCampos.Substring(0, 1) != "0")
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);    
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.sinVentas + "');</script>", false);
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
                ParametrosEN ObjPara = new ParametrosEN();
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
                    ParametrosEN ObjParaLiqui = new ParametrosEN();
                    ObjParaLiqui.pTipo = "Estado";
                    IList<ParametrosEN> DatosParametrosLiqui = new ParametrosLN().Consulta(ObjParaLiqui, "BON_ConsultaParametros");

                    if (DatosParametrosLiqui.Count > 0)
                    {
                        this.txbEstado.Text = DatosParametrosLiqui[0].pValor;
                        this.pnlProcesos.Enabled = false;

                        String GuardarHistorico = String.Empty;
                        GuardarHistorico = new ParametrosLN().GuardarHist("BON_GuardarHistoricoParametros");

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
            PlanDeBonificacionLN pbln= new PlanDeBonificacionLN();
            IList<PlanDeBonificacionEN> listaPlanes = pbln.ConsultarPlanesBonificacionEspecialLN("BON_ConsultaPlanesBonificacion");

            for (int i = 0; i < listaPlanes.Count;i++ )
            {
                if (listaPlanes[i].estado == true) {
                    BonificacionEspecialLN beln = new BonificacionEspecialLN();
                    BonificacionEspecialEN benPb = new BonificacionEspecialEN();
                    benPb.pIdPlanBonificacion = listaPlanes[i].ID;
                    IList<BonificacionEspecialEN> listaBonificaciones = beln.ConsultarBonificacionEspecialXidPlanLN("BON_ConsultaBonificacionEspecialXidPlan", benPb);
                    for (int j = 0; j < listaBonificaciones.Count; j++)
                    {
                        if (listaBonificaciones[j].pEstado == true)
                        {
                            int idPlan = listaPlanes[i].ID;
                            int id = listaBonificaciones[j].pId;
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                            BonificacionEspecialEN ben = new BonificacionEspecialEN();
                            ben.pId = listaBonificaciones[j].pId;
                            ben.pIdPlanBonificacion = listaPlanes[i].ID;
                            ben.pUsuActualiza = Session["usuario"].ToString();
                            ben.pDescripcionBono = "";
                            ben.pPlanesMinimos = Convert.ToInt32(txbPeriodo.Text);
                            ben.pPlanesMaximos = Convert.ToInt32(txbano.Text);
                            String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion");
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                        }
                    }
                   
                }
  
            }
            
         
        }

        protected void btnSubirAsesores_Click(object sender, EventArgs e)
        {
            AsesoresLN aseln = new AsesoresLN();
            try
            {
               Int32 retornoElim=Convert.ToInt32(aseln.EliminarAsesoresSqlLN());//limpia la tabla de asesores de SQL
               
                IList<AsesoresEN> listaAsesores = aseln.ConsultarAsesoresSicolLN();
                if (listaAsesores.Count > 0)
                {
                   for (int i = 0; i < listaAsesores.Count; i++)
                    {
                        AsesoresEN asen = listaAsesores[i];
                      int retin=  Convert.ToInt32(aseln.InsertarAsoresSqlLN(asen));
                    }
                    AsesoresEN objAsesor = new AsesoresEN();
                    objAsesor.pAsistenciaFin = Convert.ToDateTime(this.txbFechaFin.Text);
                objAsesor.pAsistenciaInicio = Convert.ToDateTime(this.txbFechaInicio.Text);
               int retorno=Convert.ToInt32(aseln.cargarAsistencia(objAsesor)); //Carga la asistencia de los asesores en kactus
                    
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.asesoresOK + "');</script>", false);
                }
                else {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" +Mensajes.sinAsesores + "');</script>", false);
                }
            }
            catch(Exception){
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError+ "');</script>", false);
            }
                
        }

        protected void gvParametros_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}