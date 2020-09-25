using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;

namespace LiquidacionBonificaciones.Modulos.Proceso
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    //Carga de inicio
                    
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }

        }

 

        protected void btnInformes_Click(object sender, EventArgs e)
        {
            Response.Redirect(ConfigurationManager.AppSettings["Reportes"]);
        }
    }
}