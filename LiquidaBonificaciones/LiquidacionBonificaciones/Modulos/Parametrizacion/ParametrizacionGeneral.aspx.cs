using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LiquidacionBonificaciones.Modulos.Parametrizacion
{
    public partial class ParametrizacionGeneral : System.Web.UI.Page
    {
        GridViewRow dgi;
        TextBox TexValor;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               // Session["usuario"] = "Nicolas.Larrota";
              // Session["usuario"] = "cristian.munoz";
                UsuarioEN objUsuario = new UsuarioEN();

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


                if ((Session["perfil"].ToString() != "3"))
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
                    ConsultaParametros();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }
        }

        protected void imgBtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Modulos/Proceso/Parametrizacion.aspx");
        }

        protected void imgBtnGuardar_Click(object sender, ImageClickEventArgs e)
        {

            int repetido = 0;
            ParametrosEN ObjPara = new ParametrosEN();

            try
            {
                if (this.lblEstadoParametro.Text == "Cerrado")
                {
                    for (int i = 0; i < GvParametros.Rows.Count; i++)
                    {
                        dgi = GvParametros.Rows[i];
                        TexValor = (TextBox)dgi.FindControl("TxtValor");

                        ObjPara.pId = Convert.ToInt32(GvParametros.Rows[i].Cells[0].Text);
                        ObjPara.pValor = this.TexValor.Text;
                        ObjPara.pUsuActualiza = Session["usuario"].ToString();

                        if (ConfigurationManager.AppSettings["Codigos"].ToString().Contains("," + Convert.ToInt32(ObjPara.pId) + ","))
                        {
                            IList<ParametrosEN> lista = new ParametrosLN().ConsultaParametroIdTipo(ObjPara, "BON_ConsultaParametrosId");

                            if (lista.Count > 0)
                            {
                                repetido++;
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametroIgual + Conversiones.FormateoCampos.FormatoHTML(GvParametros.Rows[i].Cells[2].Text) + "');</script>", false);
                            }
                        }
                    }

                    if (repetido == 0)
                    {
                        GuardarParametros();
                    }
                }
                else
                {
                    GuardarParametros();
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
            }
        }

        protected void BtnCancelar_Click(object sender, ImageClickEventArgs e)
        {
            ConsultaParametros();
        }

        private void ConsultaParametros()
        {
            IList<ParametrosEN> DatosParametros = new ParametrosLN().ConsultaPara("BON_ConsultaParametrosGnrls");

            if (DatosParametros.Count > 0)
            {

               //Carga la tabla de parametros al GridView
                this.GvParametros.DataSource = DatosParametros;
                this.GvParametros.DataBind();

                #region ESTADO LIQUIDACION
                ParametrosEN ObjParaLiqui = new ParametrosEN();
                ObjParaLiqui.pTipo = "Estado";
                IList<ParametrosEN> DatosParametrosLiqui = new ParametrosLN().Consulta(ObjParaLiqui, "BON_ConsultaParametros");

                if (DatosParametrosLiqui.Count > 0)
                {
                    this.lblEstadoParametro.Text = DatosParametrosLiqui[0].pValor;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
                }
                #endregion
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosNo + "');</script>", false);
            }
        }

        private void GuardarParametros()
        {
            int controlaguardar = 0;
            String Actualiza = String.Empty;
            ParametrosEN ObjPara = new ParametrosEN();

            for (int i = 0; i < GvParametros.Rows.Count; i++)
            {
                dgi = GvParametros.Rows[i];
                TexValor = (TextBox)dgi.FindControl("TxtValor");

                ObjPara.pId = Convert.ToInt32(GvParametros.Rows[i].Cells[0].Text);
                ObjPara.pValor = this.TexValor.Text;
                ObjPara.pUsuActualiza = Session["usuario"].ToString();

                Actualiza = new ParametrosLN().ActualizarParametros(ObjPara, "BON_ActParametroGeneral");

                if (Actualiza.Substring(0, 1) == "0")
                {
                    controlaguardar++;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorId + GvParametros.Rows[i].Cells[2].Text + "');</script>", false);
                }
            }

            ObjPara.pId = 11;
            ObjPara.pValor = "Abierto";
            ObjPara.pUsuActualiza = Session["usuario"].ToString();

            Actualiza = new ParametrosLN().ActualizarParametros(ObjPara, "BON_ActParametroGeneral");

            if (Actualiza.Substring(0, 1) == "0")
            {
                controlaguardar++;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorId + "Estado Liquidación" + "');</script>", false);
            }


            if (controlaguardar == 0)
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);

            ConsultaParametros();
        }

    }
}