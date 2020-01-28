using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiquidaBonificaciones.EN.Tablas;
using System.Data;
using LiquidaBonificaciones.LN.Consultas;
using LiquidacionBonificaciones.Codigo;

namespace LiquidacionBonificaciones.Modulos.Administracion
{
    public partial class AdminUsuario : System.Web.UI.Page
    {
        private Int32 IdUsuario
        {
            get
            {
                int valor = 0;
                if (ViewState["pUsuario"] != null)
                    valor = Convert.ToInt32(ViewState["pUsuario"]);
                return valor;
            }

            set
            {
                ViewState["pUsuario"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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

                    Session["IdUsuario"] = objUsuarioCon.pId;
                    Session["usuario"] = objUsuarioCon.pUsuario;
                    Session["perfil"] = objUsuarioCon.pIdPerfil;
                }


                if ((Session["perfil"].ToString() != "1"))
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
                this.ddlUsuarioChevy.DataSource = new UsuarioLN().ConsultaUsuarioChevy("BON_ConsultaUsuarioChevy");
                this.ddlUsuarioChevy.DataTextField = "pUsuario";
                this.ddlUsuarioChevy.DataValueField = "pUsuario";
                this.ddlUsuarioChevy.DataBind();
                UtilidadesWeb.agregarSeleccioneDDL(this.ddlUsuarioChevy);

                this.ddlPerfil.DataSource = new PerfilLN().ConsultaPerfiles("BON_ConsultaPerfiles");
                this.ddlPerfil.DataTextField = "pPerfil";
                this.ddlPerfil.DataValueField = "pId";
                this.ddlPerfil.DataBind();
                UtilidadesWeb.agregarSeleccioneDDL(this.ddlPerfil);

                this.gvUsuario.DataSource = new UsuarioLN().ConsultaTodosUsuario("BON_ConsultaTodosUsuario");
                this.gvUsuario.DataBind();
            }
        }

        protected void imgBtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Modulos/Administracion/AdminUsuario.aspx");
        }

        protected void imgBtnGuardar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                UsuarioEN objUsuario = new UsuarioEN();
                UsuarioLN objConsultaUsuario = new UsuarioLN();

                String Result = String.Empty;

                if (IdUsuario == 0)
                {
                    objUsuario.pId = 0;
                    objUsuario.pUsuario = this.ddlUsuarioChevy.SelectedValue;
                    objUsuario.pIdPerfil = Convert.ToInt32(this.ddlPerfil.SelectedValue);
                    objUsuario.pHabilita = this.chbHabilita.Checked;

                    Result = new UsuarioLN().Ejecutar(objUsuario, "BON_CrearUsuario");

                    if (Result.Substring(0,1) != "0")
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.Exitoso + "');</script>", false);
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorProceso + "');</script>", false);
                }
                else
                {
                    objUsuario.pId = IdUsuario;
                    objUsuario.pIdPerfil = Convert.ToInt32(this.ddlPerfil.SelectedValue);
                    objUsuario.pHabilita = this.chbHabilita.Checked;
                    objUsuario.pUsuario = this.ddlUsuarioChevy.SelectedValue;

                    Result = new UsuarioLN().Ejecutar(objUsuario, "BON_ActualizarUsuario");

                    if (Result.Substring(0, 1) != "0")
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.UsuarioActualizado + "');</script>", false);
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorProceso + "');</script>", false);
                }

                limpiar();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message.Replace("'", "").Replace("\n", "").Replace("\r", "") + "');</script>", false);
            }
        }

        protected void gvUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                String Elimina = String.Empty;
                if (e.CommandName.Equals("Editar"))
                {
                    this.IdUsuario = Convert.ToInt32(HttpUtility.HtmlDecode(gvUsuario.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text.Trim()));
                    this.ddlUsuarioChevy.SelectedValue = HttpUtility.HtmlDecode(gvUsuario.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text.Trim());
                    this.ddlPerfil.SelectedValue = HttpUtility.HtmlDecode(gvUsuario.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text.Trim());
                    this.chbHabilita.Checked = ((CheckBox)this.gvUsuario.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].Controls[0]).Checked;
                }
                else if (e.CommandName.Equals("Eliminar"))
                {
                    UsuarioEN objUsuario = new UsuarioEN();
                    objUsuario.pId = Convert.ToInt32(HttpUtility.HtmlDecode(gvUsuario.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text.Trim()));
                    objUsuario.pIdPerfil = 0;
                    objUsuario.pHabilita = this.chbHabilita.Checked;
                    objUsuario.pUsuario = this.ddlUsuarioChevy.SelectedValue;

                    if (Convert.ToString(objUsuario.pId) == Session["IdUsuario"].ToString())
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.EliminarMismoUsuario + "');</script>", false);
                        return;
                    }

                    Elimina = new UsuarioLN().Ejecutar(objUsuario, "BON_BorrarUsuario");

                    if (Elimina.Substring(0,1) != "0")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.BorrarUsuario + "');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorProceso + "');</script>", false);
                    }
                    limpiar();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message.Replace("'", "").Replace("\n", "").Replace("\r", "") + "');</script>", false);
            }
        }

        /// <summary>
        /// Limpia los campos de la pantalla y carga el gridview
        /// </summary>
        public void limpiar()
        {
            this.ddlUsuarioChevy.SelectedIndex = this.ddlPerfil.SelectedIndex = 0;
            this.chbHabilita.Checked = false;
            this.gvUsuario.DataSource = new UsuarioLN().ConsultaTodosUsuario("BON_ConsultaTodosUsuario");
            this.gvUsuario.DataBind();
        }
    }
}