using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;

namespace LiquidacionBonificaciones.Modulos.Parametrizacion
{
    public partial class BonificacionEspecial : System.Web.UI.Page
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
                    cargarGridViewBeCantidadPlanes();
                    cargarGridViewBeValorPLan();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }
        }


        /// <summary>
        //MEtodo para cargar los datos al GridView
        /// </summary>
        private int cargarGridViewBeCantidadPlanes()
        {
            GridView gr = this.GridViewBeCantidadPlanes;
            BonificacionEspecialLN beln = new PorCantidadPlanesLN();
            IList<BonificacionEspecialEN> DatosParametros = beln.ConsultarBonificacionEspecialLN();
            

            if (DatosParametros.Count > 0)
            {
                //Carga la tabla de parametros al GridView
                gr.DataSource = DatosParametros;
                gr.DataBind();

            }
            else
            {
                BonificacionEspecialEN be = new BonificacionEspecialEN();
                //gr.Columns[8].Visible = false; Ocular una columna
                DatosParametros.Add(be);
                gr.DataSource = DatosParametros;
                gr.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinParametros + " Por Cantidad Planes" + "');</script>", false);
            }
            return DatosParametros.Count;
        }

        protected void GridViewBeCantidadPlanes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = e.RowIndex;
            GridView gr = this.GridViewBeCantidadPlanes;
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            be.pId = Convert.ToInt32(l1ID.Text);
            BonificacionEspecialLN beln = new PorCantidadPlanesLN();

            try
            {
                String retorno = beln.EliminarBonificacionEspecialLN(be);
                int reg = Convert.ToInt32(retorno);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Elimino " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridViewBeCantidadPlanes();//Refresca el gridview
            }
            catch(Exception ex){
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message + "');</script>", false);
            }
        }

        protected void GridViewBeCantidadPlanes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gr = this.GridViewBeCantidadPlanes;
            if (e.CommandName == "Insert")
            {
                BonificacionEspecialEN be = new BonificacionEspecialEN();
                BonificacionEspecialLN beln = new PorCantidadPlanesLN(); ;
                TextBox t5Fdes = (TextBox)gr.FooterRow.FindControl("TextBox5");
                TextBox t6Fpmin = (TextBox)gr.FooterRow.FindControl("TextBox6");
                TextBox t7Fpmax = (TextBox)gr.FooterRow.FindControl("TextBox7");
                TextBox t8Fvbon = (TextBox)gr.FooterRow.FindControl("TextBox8");
                CheckBox c2Fapl = (CheckBox)gr.FooterRow.FindControl("CheckBox2");


                try
                {
                    be.pDescripcionBono = t5Fdes.Text;
                    be.pPlanesMinimos = Convert.ToInt32(t6Fpmin.Text);
                    be.pPlanesMaximos = Convert.ToInt32(t7Fpmax.Text);
                    be.pValorBono = t8Fvbon.Text;
                    be.pAplica = Convert.ToBoolean(c2Fapl.Checked);
                    be.pUsuActualiza = Session["Usuario"].ToString();
                    String retorno = beln.InsertarBonificacionEspecialLN(be);
                    int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Agrego " + reg + " Registro Correctamente" + "');</script>", false);

                    gr.ShowFooter = false; //Oculta El Footer
                this.cargarGridViewBeCantidadPlanes();//Refresca el gridview
            }
                catch(FormatException){
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
                }
            }
        }

        protected void GridViewBeCantidadPlanes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView gr = this.GridViewBeCantidadPlanes;
            gr.EditIndex = e.NewEditIndex; //Activa el modo edicion

            this.cargarGridViewBeCantidadPlanes();
        }

        protected void GridViewBeCantidadPlanes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //CApturar Controles
            int id = e.RowIndex; //iterador de la fila
            GridView gr = this.GridViewBeCantidadPlanes;
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            TextBox t1Des = (TextBox)gr.Rows[id].FindControl("Textbox1"); //Sirve para Templates
            TextBox t2pmin = (TextBox)gr.Rows[id].FindControl("Textbox2");
            TextBox t3pmax = (TextBox)gr.Rows[id].FindControl("Textbox3");
            TextBox t4vbon = (TextBox)gr.Rows[id].FindControl("Textbox4");
            CheckBox c1apl = (CheckBox)gr.Rows[id].FindControl("CheckBox1");
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            BonificacionEspecialLN beln = new PorCantidadPlanesLN();
            try
            {
                be.pId = Convert.ToInt32(l1ID.Text);
                be.pDescripcionBono = t1Des.Text;
                be.pPlanesMinimos = Convert.ToInt32(t2pmin.Text);
                be.pPlanesMaximos = Convert.ToInt32(t3pmax.Text);
                be.pValorBono = t4vbon.Text;
                be.pAplica = Convert.ToBoolean(c1apl.Checked);
                be.pUsuActualiza = Session["Usuario"].ToString();
                string retorno = beln.ActualizarBonificacionEspecialLN(be);
                int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Actualizo " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridViewBeCantidadPlanes();//Refresca el gridview

            }
            catch (FormatException) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" +Mensajes.ParametrosInvalidos + "');</script>", false);
            }


        }



        protected void GridViewBeCantidadPlanes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView gr = this.GridViewBeCantidadPlanes;
            gr.ShowFooter = false; //oculta el footer si esta visible
            gr.EditIndex = -1; //Devuelve al modo sin edicion            
            this.cargarGridViewBeCantidadPlanes();//Refresca el gridview
        }


        protected void ImgBtnAddCantidadPlanes_Click(object sender, ImageClickEventArgs e)
        {
            GridView gr = this.GridViewBeCantidadPlanes;
            gr.ShowFooter = true;//muestra el Footer del Gridview
            cargarGridViewBeCantidadPlanes();//Refresca el gridview
            
        }


        //metodos del Grid View Por valor del plan---------------------------------------------------------------------------------------------------------------------

        /// <summary>
        //MEtodo para cargar los datos al GridView
        /// </summary>
        private int cargarGridViewBeValorPLan()
        {
            GridView gr = this.GridViewBeValorPLan;
            BonificacionEspecialLN beln = new PorValoresPlanLN();
            IList<BonificacionEspecialEN> DatosParametros = beln.ConsultarBonificacionEspecialLN();
           

            if (DatosParametros.Count > 0)
            {
                //Carga la tabla de parametros al GridView
                gr.DataSource = DatosParametros;
                gr.DataBind();

            }
            else
            {
                BonificacionEspecialEN be = new BonificacionEspecialEN();
                DatosParametros.Add(be);
                gr.DataSource = DatosParametros;
                gr.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinParametros+ " Por Valor Plan" + "');</script>", false);
            }
            return DatosParametros.Count;
        }

        protected void GridViewBeValorPLan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = e.RowIndex;
            GridView gr = this.GridViewBeValorPLan;
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            be.pId = Convert.ToInt32(l1ID.Text);
            BonificacionEspecialLN beln = new PorValoresPlanLN();

            try
            {
                String retorno = beln.EliminarBonificacionEspecialLN(be);
                int reg = Convert.ToInt32(retorno);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Elimino " + reg + " Registro Correctamente" + "');</script>", false);

                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridViewBeValorPLan();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message + "');</script>", false);
            }
        }

        protected void GridViewBeValorPLan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gr = this.GridViewBeValorPLan;
            if (e.CommandName == "Insert")
            {
                BonificacionEspecialEN be = new BonificacionEspecialEN();
                BonificacionEspecialLN beln = new PorValoresPlanLN(); ;
                TextBox t5Fdes = (TextBox)gr.FooterRow.FindControl("TextBox5");
                TextBox t6Fpmin = (TextBox)gr.FooterRow.FindControl("TextBox6");
                TextBox t7Fpmax = (TextBox)gr.FooterRow.FindControl("TextBox7");
                TextBox t8Fvbon = (TextBox)gr.FooterRow.FindControl("TextBox8");
                CheckBox c2Fapl = (CheckBox)gr.FooterRow.FindControl("CheckBox2");

                
                try
                {
                    be.pDescripcionBono = t5Fdes.Text;
                    be.pPlanesMinimos = Convert.ToInt32(t6Fpmin.Text);
                    be.pPlanesMaximos = Convert.ToInt32(t7Fpmax.Text);
                    be.pValorBono = t8Fvbon.Text;
                    be.pAplica = Convert.ToBoolean(c2Fapl.Checked);
                    be.pUsuActualiza = Session["Usuario"].ToString();                    
                    String retorno = beln.InsertarBonificacionEspecialLN(be);
                    int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Agrego " + reg + " Registro Correctamente" + "');</script>", false);

                   gr.ShowFooter = false; //Oculta El Footer
                    this.cargarGridViewBeValorPLan();//Refresca el gridview
                }
                catch (FormatException)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
                }
            }
        }

        protected void GridViewBeValorPLan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView gr = this.GridViewBeValorPLan;
            gr.EditIndex = e.NewEditIndex; //Activa el modo edicion

            this.cargarGridViewBeValorPLan();
        }

        protected void GridViewBeValorPLan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //CApturar Controles
            int id = e.RowIndex; //iterador de la fila
            GridView gr = this.GridViewBeValorPLan;
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            TextBox t1Des = (TextBox)gr.Rows[id].FindControl("Textbox1"); //Sirve para Templates
            TextBox t2pmin = (TextBox)gr.Rows[id].FindControl("Textbox2");
            TextBox t3pmax = (TextBox)gr.Rows[id].FindControl("Textbox3");
            TextBox t4vbon = (TextBox)gr.Rows[id].FindControl("Textbox4");
            CheckBox c1apl = (CheckBox)gr.Rows[id].FindControl("CheckBox1");
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            BonificacionEspecialLN beln = new PorValoresPlanLN();
            try
            {
                be.pId = Convert.ToInt32(l1ID.Text);
                be.pDescripcionBono = t1Des.Text;
                be.pPlanesMinimos = Convert.ToInt32(t2pmin.Text);
                be.pPlanesMaximos = Convert.ToInt32(t3pmax.Text);
                be.pValorBono = t4vbon.Text;
                be.pAplica = Convert.ToBoolean(c1apl.Checked);
                be.pUsuActualiza = Session["Usuario"].ToString();
                string retorno = beln.ActualizarBonificacionEspecialLN(be);
                int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Actualizo " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridViewBeValorPLan();//Refresca el gridview

            }
            catch (FormatException)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
            }


        }


        protected void GridViewBeValorPLan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView gr = this.GridViewBeValorPLan;
            gr.ShowFooter = false; //oculta el footer si esta visible
            gr.EditIndex = -1; //Devuelve al modo sin edicion            
            this.cargarGridViewBeValorPLan();//Refresca el gridview
        }

        protected void ImgBtnAddValorPLan_Click(object sender, ImageClickEventArgs e)
        {
            GridView gr = this.GridViewBeValorPLan;
            gr.ShowFooter = true;//muestra el Footer del Gridview
            cargarGridViewBeValorPLan();//Refresca el gridview



        }



  



    




        



    }
}