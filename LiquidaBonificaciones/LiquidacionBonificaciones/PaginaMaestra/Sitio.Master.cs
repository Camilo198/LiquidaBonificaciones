using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LiquidacionBonificaciones.PaginaMaestra
{
    public partial class Sitio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.lbUsuario.Text = Session["Usuario"].ToString();

            }
            catch (Exception ex) {
                this.lbUsuario.Text = ex.ToString();
            }

        }


    }
}