using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using SpreadsheetLight;

namespace LiquidacionBonificaciones.Modulos.Proceso
{
    public partial class Liquidacion : System.Web.UI.Page
    {

        private String SP_InsertaVentasOutSourcing = "BON_CrearVentaOutSourcing";
        private String SP_EliminaVentasOutSourcing = "BON_EliminaVentasOutSourcing";
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager _scriptMan = ScriptManager.GetCurrent(this);
            _scriptMan.AsyncPostBackTimeout = 36000;
            try
            {
                UsuarioEN objUsuario = new UsuarioEN();
              // Session["usuario"] = "cristian.munoz";
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

                    #region FECHA CRM
                    CrmLN consultaFechaCRn =new  CrmLN();
                    IList<CrmEN> listaFechaCRM = consultaFechaCRn.ConsultaFechaCierreCrm();
                    if (listaFechaCRM.Count > 0)
                    {
                        t1CierreCRM.Text = listaFechaCRM[0].FechaActualiza.ToString();
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
                    ObjReglas = new VentasEN();
                    ObjReglas.pIdTabla = Convert.ToString(ContadorReglas);

                    string resultActCampos = new VentasLN().ActualizaCampos("BON_ActualizarCampos");
                   this.TextVentasValidas.Text= new VentasLN().ValidarReglas(ObjReglas,"BON_CalculaReglas");
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
            liquidacionNormalPlanes();
         //  liquidacionRecuperacionPermanenciaPlanes();
          // liquidacionRetroactiva_1Planes();
          // liquidacionRetroactiva_2Planes();
        }

 
        private void liquidacionRecuperacionPermanenciaPlanes()
        {
            PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
            pbln.InicializarResultadosLN("BON_IniciarResultados_RecuPerma");

            IList<PlanDeBonificacionEN> listaPlanesBonificaciones = pbln.ConsultarPlanesBonificacionEspecialLN("BON_ConsultaPlanesBonificacion");

            for (int i = 0; i < listaPlanesBonificaciones.Count; i++)
            {
                if (listaPlanesBonificaciones[i].estado == true)
                {
                    BonificacionEspecialLN beln = new BonificacionEspecialLN();
                    BonificacionEspecialEN benPb = new BonificacionEspecialEN();
                    benPb.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                    IList<BonificacionEspecialEN> listaBonificaciones = beln.ConsultarBonificacionEspecialXidPlanLN("BON_ConsultaBonificacionEspecialXidPlan_Recu", benPb);
                    if (benPb.pIdPlanBonificacion == 8)
                    {
                    /*    
                     * RetosLN retln = new RetosLN();

                        RetosEN retEn = new RetosEN();
                        retEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                        retEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                        retEn.ano = Convert.ToInt32(this.txbano.Text);
                        IList<RetosEN> listaRetos = retln.ConsultarRetosXidPlanLN("BON_ConsultaRetosXidPlan", retEn);
                        for (int j = 0; j < listaRetos.Count; j++)
                        {


                            int idPlan = listaPlanesBonificaciones[i].ID;
                            int id = listaRetos[j].ID;
                            //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                            BonificacionEspecialEN ben = new BonificacionEspecialEN();
                            ben.pId = listaRetos[j].ID;
                            ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                            ben.pUsuActualiza = Session["usuario"].ToString();
                            ben.pDescripcionBono = "";
                            ben.pPlanesMinimos = Convert.ToInt32(txbPeriodo.Text);
                            ben.pPlanesMaximos = Convert.ToInt32(txbano.Text);
                            String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion");
                            //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                        }
                        */
                    }
                    else if (benPb.pIdPlanBonificacion == 14 || benPb.pIdPlanBonificacion == 15)
                    {
                        PresupuestoLN preln = new PresupuestoLN();

                        PresupuestoEN preEn = new PresupuestoEN();
                        preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                        preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                        preEn.ano = Convert.ToInt32(this.txbano.Text);
                        if (preEn.periodo == 1)
                        {
                            preEn.periodo = 12;
                            preEn.ano = preEn.ano - 1;
                        }
                        else {
                            preEn.periodo=preEn.periodo - 1;
                        }

                        IList<PresupuestoEN> listaPresupuesto = preln.ConsultarPresupuestoLN("BON_ConsultaPresupuesto", preEn);
                        for (int j = 0; j < listaPresupuesto.Count; j++)
                        {


                            int idPlan = listaPlanesBonificaciones[i].ID;
                            int id = listaPresupuesto[j].pIdBonificacion;
                            //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                            BonificacionEspecialEN ben = new BonificacionEspecialEN();
                            ben.pId = id;
                            ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                            ben.pUsuActualiza = Session["usuario"].ToString();
                            ben.pDescripcionBono = "Recuperacion X Permanencia Periodo"+preEn.ano+"-"+preEn.periodo;
                            ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                            ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                            String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion_RecuPerma");
                            //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                        }

                    }

                    else
                    {
                        PresupuestoEN preEn = new PresupuestoEN();
                        preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                        preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                        preEn.ano = Convert.ToInt32(this.txbano.Text);
                        if (preEn.periodo == 1)
                        {
                            preEn.periodo = 12;
                            preEn.ano = preEn.ano - 1;
                        }
                        else
                        {
                            preEn.periodo = preEn.periodo - 1;
                        }

                        for (int j = 0; j < listaBonificaciones.Count; j++)
                        {
                            if (listaBonificaciones[j].pEstado == true)
                            {
                                int idPlan = listaPlanesBonificaciones[i].ID;
                                int id = listaBonificaciones[j].pId;
                                //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                                BonificacionEspecialEN ben = new BonificacionEspecialEN();
                                ben.pId = listaBonificaciones[j].pId;
                                ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                                ben.pUsuActualiza = Session["usuario"].ToString();
                                ben.pDescripcionBono = "Recuperacion X Permanencia Periodo" + preEn.ano + "-" + preEn.periodo;
                                ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                                ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                                String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion_RecuPerma");
                                // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                            }
                        }
                    }
                }

            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);


        }



 private void liquidacionNormalPlanes(){
                    PlanDeBonificacionLN pbln= new PlanDeBonificacionLN();
                    pbln.InicializarResultadosLN("BON_IniciarResultados");  

                    IList<PlanDeBonificacionEN> listaPlanesBonificaciones = pbln.ConsultarPlanesBonificacionEspecialLN("BON_ConsultaPlanesBonificacion"); 

            for (int i = 0; i < listaPlanesBonificaciones.Count;i++ )
            {
                if (listaPlanesBonificaciones[i].estado == true) {
                    BonificacionEspecialLN beln = new BonificacionEspecialLN();
                    BonificacionEspecialEN benPb = new BonificacionEspecialEN();                    
                    benPb.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                    IList<BonificacionEspecialEN> listaBonificaciones = beln.ConsultarBonificacionEspecialXidPlanLN("BON_ConsultaBonificacionEspecialXidPlan", benPb);
                    if (benPb.pIdPlanBonificacion == 8)
                    {
                        RetosLN retln = new RetosLN();

                        RetosEN retEn = new RetosEN();
                        retEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                        retEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                        retEn.ano = Convert.ToInt32(this.txbano.Text);
                        IList<RetosEN> listaRetos = retln.ConsultarRetosXidPlanLN("BON_ConsultaRetosXidPlan", retEn);
                        for (int j = 0; j < listaRetos.Count; j++)
                        {
                          
                          
                                int idPlan = listaPlanesBonificaciones[i].ID;
                                int id = listaRetos[j].ID;
                             //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                                BonificacionEspecialEN ben = new BonificacionEspecialEN();
                                ben.pId = listaRetos[j].ID;
                                ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                                ben.pUsuActualiza = Session["usuario"].ToString();
                                ben.pDescripcionBono = "";
                                ben.pPlanesMinimos = Convert.ToInt32(txbPeriodo.Text);
                                ben.pPlanesMaximos = Convert.ToInt32(txbano.Text);
                                String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion");
                              //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                          
                        }

                    }
                    else if (benPb.pIdPlanBonificacion == 14 || benPb.pIdPlanBonificacion == 15)
                    {
                        PresupuestoLN preln = new PresupuestoLN();

                        PresupuestoEN preEn = new PresupuestoEN();
                        preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                        preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                        preEn.ano = Convert.ToInt32(this.txbano.Text);

                        IList<PresupuestoEN> listaPresupuesto = preln.ConsultarPresupuestoLN("BON_ConsultaPresupuesto", preEn);
                        for (int j = 0; j < listaPresupuesto.Count; j++)
                        {


                            int idPlan = listaPlanesBonificaciones[i].ID;
                            int id = listaPresupuesto[j].pIdBonificacion;
                         //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                            BonificacionEspecialEN ben = new BonificacionEspecialEN();
                            ben.pId = id;
                            ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                            ben.pUsuActualiza = Session["usuario"].ToString();
                            ben.pDescripcionBono = "";
                            ben.pPlanesMinimos = Convert.ToInt32(txbPeriodo.Text);
                            ben.pPlanesMaximos = Convert.ToInt32(txbano.Text);
                            String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion");
                         //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                        }

                    }

                    else
                    {
                        for (int j = 0; j < listaBonificaciones.Count; j++)
                        {
                            if (listaBonificaciones[j].pEstado == true)
                            {
                                int idPlan = listaPlanesBonificaciones[i].ID;
                                int id = listaBonificaciones[j].pId;
                             //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                                BonificacionEspecialEN ben = new BonificacionEspecialEN();
                                ben.pId = listaBonificaciones[j].pId;
                                ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                                ben.pUsuActualiza = Session["usuario"].ToString();
                                ben.pDescripcionBono = "";
                                ben.pPlanesMinimos = Convert.ToInt32(txbPeriodo.Text);
                                ben.pPlanesMaximos = Convert.ToInt32(txbano.Text);
                                String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion");
                               // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                            }
                        }
                    }
                }
  
            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);
            
         
        }


 private void liquidacionRetroactiva_1Planes()
 {
     PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
     pbln.InicializarResultadosLN("BON_IniciarResultados-1");//"BON_IniciarResultados"

     IList<PlanDeBonificacionEN> listaPlanesBonificaciones = pbln.ConsultarPlanesBonificacionEspecialLN("BON_ConsultaPlanesBonificacion");

     for (int i = 0; i < listaPlanesBonificaciones.Count; i++)
     {
         if (listaPlanesBonificaciones[i].estado == true)
         {
             BonificacionEspecialLN beln = new BonificacionEspecialLN();
             BonificacionEspecialEN benPb = new BonificacionEspecialEN();
             benPb.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;

             IList<BonificacionEspecialEN> listaBonificaciones = beln.ConsultarBonificacionEspecialXidPlanLN("BON_ConsultaBonificacionEspecialXidPlan-1", benPb);
             if (benPb.pIdPlanBonificacion == 8)
             {
                 RetosLN retln = new RetosLN();

                 RetosEN retEn = new RetosEN();        
               

                 retEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 retEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 retEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (retEn.periodo == 1)
                 {
                     retEn.periodo = 12;
                     retEn.ano = retEn.ano - 1;
                 }
                 else
                 {
                     retEn.periodo = retEn.periodo - 1;
                 }

                 IList<RetosEN> listaRetos = retln.ConsultarRetosXidPlanLN("BON_ConsultaRetosXidPlan", retEn);
                 for (int j = 0; j < listaRetos.Count; j++)
                 {


                     int idPlan = listaPlanesBonificaciones[i].ID;
                     int id = listaRetos[j].ID;
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                     BonificacionEspecialEN ben = new BonificacionEspecialEN();
                     ben.pId = listaRetos[j].ID;
                     ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                     ben.pUsuActualiza = Session["usuario"].ToString();
                     ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + retEn.ano + "-" + retEn.periodo;
                     ben.pPlanesMinimos = Convert.ToInt32(retEn.periodo);
                     ben.pPlanesMaximos = Convert.ToInt32(retEn.ano);
                     String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-1");
                     //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                 }

             }
             else if (benPb.pIdPlanBonificacion == 14 || benPb.pIdPlanBonificacion == 15)
             {
                 PresupuestoLN preln = new PresupuestoLN();

                 PresupuestoEN preEn = new PresupuestoEN();
                 preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 preEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (preEn.periodo == 1)
                 {
                     preEn.periodo = 12;
                     preEn.ano = preEn.ano - 1;
                 }
                 else
                 {
                     preEn.periodo = preEn.periodo - 1;
                 }

                 IList<PresupuestoEN> listaPresupuesto = preln.ConsultarPresupuestoLN("BON_ConsultaPresupuesto", preEn);
                 for (int j = 0; j < listaPresupuesto.Count; j++)
                 {


                     int idPlan = listaPlanesBonificaciones[i].ID;
                     int id = listaPresupuesto[j].pIdBonificacion;
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                     BonificacionEspecialEN ben = new BonificacionEspecialEN();
                     ben.pId = id;
                     ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                     ben.pUsuActualiza = Session["usuario"].ToString();
                     ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + preEn.ano + "-" + preEn.periodo;
                     ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                     ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                     String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-1");
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                 }

             }

             else
             {
                 PresupuestoEN preEn = new PresupuestoEN();
                 preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 preEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (preEn.periodo == 1)
                 {
                     preEn.periodo = 12;
                     preEn.ano = preEn.ano - 1;
                 }
                 else
                 {
                     preEn.periodo = preEn.periodo - 1;
                 }
                 for (int j = 0; j < listaBonificaciones.Count; j++)
                 {
                     if (listaBonificaciones[j].pEstado == true)
                     {
                         int idPlan = listaPlanesBonificaciones[i].ID;
                         int id = listaBonificaciones[j].pId;
                         //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                         BonificacionEspecialEN ben = new BonificacionEspecialEN();
                         ben.pId = listaBonificaciones[j].pId;
                         ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                         ben.pUsuActualiza = Session["usuario"].ToString();
                         ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + preEn.ano + "-" + preEn.periodo;
                         ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                         ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                         String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-1");
                         // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                     }
                 }
             }
         }

     }

     ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);


 }

 private void liquidacionRetroactiva_2Planes()
 {
     PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
     pbln.InicializarResultadosLN("BON_IniciarResultados-2");//"BON_IniciarResultados"

     IList<PlanDeBonificacionEN> listaPlanesBonificaciones = pbln.ConsultarPlanesBonificacionEspecialLN("BON_ConsultaPlanesBonificacion");

     for (int i = 0; i < listaPlanesBonificaciones.Count; i++)
     {
         if (listaPlanesBonificaciones[i].estado == true)
         {
             BonificacionEspecialLN beln = new BonificacionEspecialLN();
             BonificacionEspecialEN benPb = new BonificacionEspecialEN();
             benPb.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;

             IList<BonificacionEspecialEN> listaBonificaciones = beln.ConsultarBonificacionEspecialXidPlanLN("BON_ConsultaBonificacionEspecialXidPlan-2", benPb);
             if (benPb.pIdPlanBonificacion == 8)
             {
                 RetosLN retln = new RetosLN();

                 RetosEN retEn = new RetosEN();


                 retEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 retEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 retEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (retEn.periodo == 2)
                 {
                     retEn.periodo = 12;
                     retEn.ano = retEn.ano - 1;
                 }
                 else if (retEn.periodo == 1) {
                     retEn.periodo = 11;
                     retEn.ano = retEn.ano - 1;
                 }
                 else
                 {
                     retEn.periodo = retEn.periodo - 2;
                 }

                 IList<RetosEN> listaRetos = retln.ConsultarRetosXidPlanLN("BON_ConsultaRetosXidPlan", retEn);
                 for (int j = 0; j < listaRetos.Count; j++)
                 {


                     int idPlan = listaPlanesBonificaciones[i].ID;
                     int id = listaRetos[j].ID;
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                     BonificacionEspecialEN ben = new BonificacionEspecialEN();
                     ben.pId = listaRetos[j].ID;
                     ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                     ben.pUsuActualiza = Session["usuario"].ToString();
                     ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + retEn.ano + "-" + retEn.periodo;
                     ben.pPlanesMinimos = Convert.ToInt32(retEn.periodo);
                     ben.pPlanesMaximos = Convert.ToInt32(retEn.ano);
                     String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-2");
                     //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                 }

             }
             else if (benPb.pIdPlanBonificacion == 14 || benPb.pIdPlanBonificacion == 15)
             {
                 PresupuestoLN preln = new PresupuestoLN();

                 PresupuestoEN preEn = new PresupuestoEN();
                 preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 preEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (preEn.periodo == 2)
                 {
                     preEn.periodo = 12;
                     preEn.ano = preEn.ano - 1;
                 }
                 else if (preEn.periodo == 1)
                 {
                     preEn.periodo = 11;
                     preEn.ano = preEn.ano - 1;
                 }
                 else
                 {
                     preEn.periodo = preEn.periodo - 2;
                 }

                 IList<PresupuestoEN> listaPresupuesto = preln.ConsultarPresupuestoLN("BON_ConsultaPresupuesto", preEn);
                 for (int j = 0; j < listaPresupuesto.Count; j++)
                 {


                     int idPlan = listaPlanesBonificaciones[i].ID;
                     int id = listaPresupuesto[j].pIdBonificacion;
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                     BonificacionEspecialEN ben = new BonificacionEspecialEN();
                     ben.pId = id;
                     ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                     ben.pUsuActualiza = Session["usuario"].ToString();
                     ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + preEn.ano + "-" + preEn.periodo;
                    ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                    ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                     String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-2");
                     //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);

                 }

             }

             else
             {
                 PresupuestoEN preEn = new PresupuestoEN();
                 preEn.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                 preEn.periodo = Convert.ToInt32(this.txbPeriodo.Text);
                 preEn.ano = Convert.ToInt32(this.txbano.Text);
                 if (preEn.periodo == 2)
                 {
                     preEn.periodo = 12;
                     preEn.ano = preEn.ano - 1;
                 }
                 else if (preEn.periodo == 1)
                 {
                     preEn.periodo = 11;
                     preEn.ano = preEn.ano - 1;
                 }
                 else
                 {
                     preEn.periodo = preEn.periodo - 2;
                 }
                 for (int j = 0; j < listaBonificaciones.Count; j++)
                 {
                     if (listaBonificaciones[j].pEstado == true)
                     {
                         int idPlan = listaPlanesBonificaciones[i].ID;
                         int id = listaBonificaciones[j].pId;
                         //   ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + id + "Bon" + idPlan + "Plan" + "');</script>", false);

                         BonificacionEspecialEN ben = new BonificacionEspecialEN();
                         ben.pId = listaBonificaciones[j].pId;
                         ben.pIdPlanBonificacion = listaPlanesBonificaciones[i].ID;
                         ben.pUsuActualiza = Session["usuario"].ToString();
                         ben.pDescripcionBono = "Recuperacion Retroactiva Periodo" + preEn.ano + "-" + preEn.periodo;
                         ben.pPlanesMinimos = Convert.ToInt32(preEn.periodo);
                         ben.pPlanesMaximos = Convert.ToInt32(preEn.ano);
                         String Result = beln.LiquidarBonificacionEspecial(ben, "BON_LiquidarPlanesBonificacion-2");

                         // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Result + "');</script>", false);
                     }
                 }
             }
         }

     }

     ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);


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

        protected void btnCargarCierre_Click(object sender, EventArgs e)
        {
            CrmLN cierreCrmln = new CrmLN();
            CrmEN cierreCrmEn = new CrmEN();
            cierreCrmEn.Usuario = Session["usuario"].ToString();
            try
            {  
                    int retin = Convert.ToInt32(cierreCrmln.cargarCierreCRM(cierreCrmEn));

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.CierreCRM + retin +" Registros" + "');</script>", false);
                

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            try
            {
                PamVentaOutLN ventaOutLn = new PamVentaOutLN();
                String resultClear = ventaOutLn.EliminarVentasOut(SP_EliminaVentasOutSourcing);
                if (Path.GetExtension(FileUploadControl.FileName) == ".xlsx" || Path.GetExtension(FileUploadControl.FileName) == ".xls")
                {
                    if (this.FileUploadControl.HasFile)
                    {
                        try
                        {
                            SLDocument sl = new SLDocument(FileUploadControl.PostedFile.InputStream);
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            //   FileUploadControl.SaveAs(Server.MapPath("~/") + filename); Guarda el archivo en una ruta

                            if (sl.GetCellValueAsString(1, 1) != null && sl.GetCellValueAsString(1, 1) != "")
                            {
                                String LogErrores = "";
                                
                                for (int i = 2; sl.GetCellValueAsString(i, 1) != null && sl.GetCellValueAsString(i, 1) != ""; i++)
                                {
                                    String ret = sl.GetCellValueAsString(i, 1);
                                    PamVentasOutEN ventaOutEn = new PamVentasOutEN();
                                    ventaOutEn.Cupo = sl.GetCellValueAsString(i, 1);
                                    ventaOutEn.Afiliado = sl.GetCellValueAsString(i, 2);
                                    ventaOutEn.Contrato = sl.GetCellValueAsString(i, 3);
                                    ventaOutEn.CodOficina = Convert.ToInt32(sl.GetCellValueAsString(i, 4));
                                    ventaOutEn.Oficina = sl.GetCellValueAsString(i, 5);
                                    ventaOutEn.FechaVenta = sl.GetCellValueAsDateTime(i, 6);
                                    ventaOutEn.ValorPlan = Convert.ToDouble(sl.GetCellValueAsString(i, 7));
                                    ventaOutEn.CodVendedor = Convert.ToInt32(sl.GetCellValueAsString(i, 8));
                                    ventaOutEn.IdeVendedor = Convert.ToDouble(sl.GetCellValueAsString(i, 9));
                                    ventaOutEn.nombreVendedor = sl.GetCellValueAsString(i, 10);
                                    ventaOutEn.Tipo = sl.GetCellValueAsString(i, 11);
                                    ventaOutEn.PorcentajeInscripcion = Convert.ToDouble(sl.GetCellValueAsString(i, 12));
                                    ventaOutEn.ValorInscripcionSinIva = Convert.ToDouble(sl.GetCellValueAsString(i, 13));
                                    ventaOutEn.ValorPagoParcial = Convert.ToDouble(sl.GetCellValueAsString(i, 14));
                                    ventaOutEn.AlturaDiferida = sl.GetCellValueAsString(i, 15);
                                    ventaOutEn.TipoContrato = sl.GetCellValueAsString(i, 16);
                                    ventaOutEn.EstadoCupo = sl.GetCellValueAsString(i, 17);
                                    ventaOutEn.CarroAgil = sl.GetCellValueAsString(i, 18);                                    
                                    ventaOutEn.MarcaDiferida = sl.GetCellValueAsString(i, 19);
                                    ventaOutEn.CodigoDirector = Convert.ToInt32(sl.GetCellValueAsString(i, 20));
                                    ventaOutEn.IdeDirector = Convert.ToDouble(sl.GetCellValueAsString(i, 21));
                                    ventaOutEn.NombreDirector = sl.GetCellValueAsString(i, 22);
                                    ventaOutEn.ValorIvaInscripcion = Convert.ToDouble(sl.GetCellValueAsString(i, 23));
                                    ventaOutEn.ValorTotaInscripcionConIva = Convert.ToDouble(sl.GetCellValueAsString(i, 24));
                                    ventaOutEn.MarcaExcl = sl.GetCellValueAsString(i, 25);
                                    ventaOutEn.LineaProducto = sl.GetCellValueAsString(i, 26);
                                    ventaOutEn.UsuarioActualiza = Session["usuario"].ToString();
                                    String result = ventaOutLn.InsertarVentaOutLN(ventaOutEn, SP_InsertaVentasOutSourcing);
                                    if (result == "0")
                                    {
                                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorProceso + "');</script>", false);

                                    }
                                    else if (result != "1")
                                    {
                                        if (result.Length >= 155)
                                        {
                                            LogErrores += result.Substring(155, 47) + "</br>";
                                        }
                                        else
                                        {

                                            LogErrores += result + "</br>";
                                        }
                                    }

                                }
                                if (LogErrores != "")
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.clavesDuplicadas + "');</script>", false);

                                    Label8.Visible = true;
                                    Label8.Text = LogErrores;

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ArchivoUpOk + "');" + "  window.location.href='/Modulos/Proceso/Liquidacion.aspx'</script>", false);

                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.archivoVacio + "');" + "  window.location.href='/Modulos/Proceso/Liquidacion.aspx'</script>", false);


                            }




                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ArchivoUpFail + "');</script>", false);

                        }
                    }
                    else { ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.sinArchivo + "');</script>", false); }
                }
                else { ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.soloExcel + "');</script>", false); }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.archivoMax + "');</script>", false);
            }
        }
    }
}