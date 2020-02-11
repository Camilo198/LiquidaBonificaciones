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
    public partial class Presupuesto : System.Web.UI.Page
    {

        //Procedimientos almacenados que interactuan con el Gridview
        private String SP_ConsultaPresupuestoXanoPeriodo = "BON_ConsultaPresupuesto";
        private String Sp_EliminaBonificacion = "BON_BorrarPresupuesto";
        private String SP_InsertaBonificacion = "BON_CrearPresupuesto";
        private String SP_ActualizaBonificacion = "BON_ActPresupuesto";

        //Procedimientos almacenados que interactuan con los Combos
        private String SP_ConsultaPeriodosPresupuestoXano = "BON_ConsultaPeriodosPresupuestosXano";
        private String SP_ConsultaAnosPresupuesto = "BON_ConsultaAnosPresupuestos";
        
        
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

                    cargarComboAnosPresupuesto();
                    resetearPantalla();

                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ProcesoError + "');</script>", false);
                }
            }
        }

        // Reinicia Los Valores de la Pantalla
        private void resetearPantalla()
        {
            Session["Obj_Periodo"] = "";
            Session["Obj_Ano"] = "";
            TextBoxIdPlan.Text = "";
            LabelDescipcionPlan.Text = "";
            this.GridViewPresupuesto.DataSource = "";
            GridViewPresupuesto.DataBind();



        }


        //Entrega la bonificacion seleccionada
        protected void ListPeriodos_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxIdPlan.Text = ListPeriodos.Text;
            Session["Obj_Periodo"] = ListPeriodos.Text; //Se envia el resultado del Combo a sesion para que funcione en los otros eventos del GridView
            //Carga los grid view con informacion
            this.GridViewPresupuesto.ShowFooter = false; //oculta el footer si esta visible
            this.GridViewPresupuesto.EditIndex = -1; //Devuelve al modo sin edicion 
            PresupuestoLN preLn = new PresupuestoLN();
            PresupuestoEN preEn = new PresupuestoEN();
            preEn.periodo = Convert.ToInt32(Session["Obj_Periodo"].ToString());
            preEn.ano = Convert.ToInt32(Session["Obj_Ano"].ToString());
            IList<PresupuestoEN> lista = preLn.ConsultarPresupuestoLN(SP_ConsultaPresupuestoXanoPeriodo, preEn);
            try
            {
                if (lista.Count > 0)
                {
                    this.LabelDescipcionPlan.Text = "Presupuesto: "+lista[0].ano.ToString()+"-"+lista[0].periodo;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionSeleccion + "');</script>", false);
                    LabelDescipcionPlan.Text = "";
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionInvalida + "');</script>", false);
            }
            cargarGridviewPresupuesto(SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
        }
        //Entrega el rol seleccionado y carga la lista de bonificaciones con este rol
        protected void ListAnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            resetearPantalla();
            cargarComboPeriodosPresupuesto(ListAnos.Text);
            Session["Obj_Ano"] = ListAnos.Text;
        }





        // Carga los combos con informacion
        private void cargarComboAnosPresupuesto()
        {
            PresupuestoLN preln = new PresupuestoLN();
            List<Object> listPc = preln.ConsultarAnosPresupuestoLN(SP_ConsultaAnosPresupuesto).Cast<Object>().ToList();
            cargarComboGenerico(listPc, this.ListAnos);

        }
        // Carga los combos con informacion
        private void cargarComboPeriodosPresupuesto(String ano)
        {
            PresupuestoLN preLn = new PresupuestoLN();
            PresupuestoEN preEn = new PresupuestoEN();
            preEn.ID = Convert.ToInt32(ano);
           List<Object> listPre = preLn.ConsultarPeriodosPresupuestoXanoLN(SP_ConsultaPeriodosPresupuestoXano, preEn).Cast<Object>().ToList();
            cargarComboGenerico(listPre, this.ListPeriodos);
        }

        // Metodo que permite cargar combos
        private int cargarComboGenerico(IList<Object> lista, DropDownList combo)
        {

            IList<Object> datos = lista;

            if (datos.Count > 0)
            {

                combo.DataSource = datos;
                combo.DataTextField = "Nombre";
                combo.DataValueField = "ID";
                combo.DataBind(); // Se aplica el Data Bing para que se cargue la informacion en el comboBox
                combo.Items.Insert(0, new ListItem("Seleccione", "0"));
            }
            else
            {
                combo.DataSource = "";
                combo.DataBind();
                combo.Items.Insert(0, new ListItem("Sin Informacion", "0"));

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinInformacionDB + "');</script>", false);

            }
            return datos.Count;
        }



        /// <summary>
        //MEtodos para Modificar la informacion de los Eventos de GridView
        // Recibe como paramnetro un procedimiento almacenado que trae la consulta de los datos
        //Recibe como parametro un gridview el cual proyectara la consulta del procedimiento anterior
        //Recibe como parametro un String que trae el plan de Bonificacion del procedimiento Almacenado
        /// </summary>
        /// 

        private int cargarGridviewPresupuesto(String SP_Consulta, GridView gr, String Periodo, String Ano)
        {
            PresupuestoLN preLn = new PresupuestoLN();
            PresupuestoEN preEn = new PresupuestoEN();
            preEn.periodo = Convert.ToInt32(Periodo);
            preEn.ano = Convert.ToInt32(Ano);
            IList<PresupuestoEN> DatosParametros = preLn.ConsultarPresupuestoLN(SP_Consulta, preEn);
            if (DatosParametros.Count > 0)
            {
                //Carga la tabla de parametros al GridView
                gr.DataSource = DatosParametros;
                gr.DataBind();

                //---Edicion de Heater del grid view

            }
            else
            {
                //gr.Columns[8].Visible = false; Ocular una columna
                PresupuestoEN be = new PresupuestoEN();
                DatosParametros.Add(be);
                gr.DataSource = DatosParametros;
                gr.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinParametros + " Por Cantidad Planes" + "');</script>", false);
            }


            return DatosParametros.Count;
        }


        private void ElminarFila(String SP_Elimina, String SP_Consulta, GridView gr, GridViewDeleteEventArgs e, String Periodo, String Ano)
        {
            int id = e.RowIndex;
            Label l1CodOfic = (Label)gr.Rows[id].FindControl("Label0");
            Label l2Periodo = (Label)gr.Rows[id].FindControl("Label2");
            Label l3ano = (Label)gr.Rows[id].FindControl("Label3"); 
            PresupuestoEN preEn = new PresupuestoEN();
            preEn.codigoOficina = Convert.ToInt32(l1CodOfic.Text);
            preEn.periodo = Convert.ToInt32(l2Periodo.Text);
            preEn.ano = Convert.ToInt32(l3ano.Text);
            PresupuestoLN preLn = new PresupuestoLN();

            try
            {
                String retorno = preLn.EliminarPresupuestoLN(preEn, SP_Elimina);
                int reg = Convert.ToInt32(retorno);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Elimino " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewPresupuesto(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message + "');</script>", false);
            }

        }

        private void InsertarFila(String SP_Inserta, String SP_Consulta, GridView gr, GridViewCommandEventArgs e, String Periodo, String Ano)
        {

            if (e.CommandName == "Insert")
            {
                PresupuestoEN preEN = new PresupuestoEN();
                PresupuestoLN preLn = new PresupuestoLN();
                TextBox t4FcodOfic = (TextBox)gr.FooterRow.FindControl("TextBox4");
                TextBox t5Fpresupuesto = (TextBox)gr.FooterRow.FindControl("TextBox5");
                TextBox t6FPeriodo = (TextBox)gr.FooterRow.FindControl("TextBox6");
                TextBox t7Fano = (TextBox)gr.FooterRow.FindControl("TextBox7");

                try
                {
                    preEN.codigoOficina = Convert.ToInt32(t4FcodOfic.Text);
                    preEN.presupuesto = Convert.ToInt32(t5Fpresupuesto.Text);
                    preEN.periodo = Convert.ToInt32(t6FPeriodo.Text);
                    preEN.ano = Convert.ToInt32(t7Fano.Text);
                    preEN.usuarioActualiza = Session["Usuario"].ToString();
                    String retorno = preLn.InsertarPresupuestoLN(preEN, SP_Inserta);
                    int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Agrego " + reg + " Registro Correctamente" + "');</script>", false);

                    gr.ShowFooter = false; //Oculta El Footer
                    this.cargarGridviewPresupuesto(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
                }
            }
        }

        private void EditarFila(String SP_Consulta, GridView gr, GridViewEditEventArgs e, String Periodo, String Ano)
        {

            gr.EditIndex = e.NewEditIndex; //Activa el modo edicion
            this.cargarGridviewPresupuesto(SP_Consulta, gr, Periodo, Ano);
        }

        private void ActualizaFila(String SP_Actualiza, String SP_Consulta, GridView gr, GridViewUpdateEventArgs e, String Periodo, String Ano)
        {
            //CApturar Controles

            int id = e.RowIndex; //iterador de la fil
            /*Label l1CodOfic = (Label)gr.Rows[id].FindControl("Label0");
            Label l2Periodo = (Label)gr.Rows[id].FindControl("Label2");
            Label l3ano = (Label)gr.Rows[id].FindControl("Label3");*/ 
            Label l1CodOfic = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            TextBox t1Presupuesto = (TextBox)gr.Rows[id].FindControl("Textbox1"); //Sirve para Templates
            Label l2Periodo = (Label)gr.Rows[id].FindControl("Label2");
            Label l3ano = (Label)gr.Rows[id].FindControl("Label3");

            PresupuestoEN preEn = new PresupuestoEN();
            PresupuestoLN beln = new PresupuestoLN();
            try
            {
                preEn.codigoOficina = Convert.ToInt32(l1CodOfic.Text);
                preEn.presupuesto = Convert.ToInt32(t1Presupuesto.Text);
                preEn.periodo = Convert.ToInt32(l2Periodo.Text);
                preEn.ano = Convert.ToInt32(l3ano.Text);
                preEn.usuarioActualiza = Session["Usuario"].ToString();
                string retorno = beln.ActualizarPresupuestoLN(preEn, SP_Actualiza);
                int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Actualizo " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewPresupuesto(SP_Consulta, gr,  Periodo,  Ano);//Refresca el gridview

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
            }
        }

        private void CancelarEdicionFila(String SP_Consulta, GridView gr, GridViewCancelEditEventArgs e, String Periodo, String Ano)
        {
            gr.ShowFooter = false; //oculta el footer si esta visible
            gr.EditIndex = -1; //Devuelve al modo sin edicion            
            this.cargarGridviewPresupuesto(SP_Consulta, gr, Periodo,  Ano);//Refresca el gridview
        }

        private void agregarNuevaFila(String SP_Consulta, GridView gr, String Periodo, String Ano)
        {

            gr.ShowFooter = true;//muestra el Footer del Gridview
            cargarGridviewPresupuesto(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview}


        }

        //-------------------------------------- MEtodos Propios del GridView que responden a los eventos---------------------------
        //Eliminar, Insertar, Editar,Actualizar,Cancelar, Agregar

        protected void GridViewPresupuesto_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                ElminarFila(Sp_EliminaBonificacion, SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }



        protected void GridViewPresupuesto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                InsertarFila(SP_InsertaBonificacion, SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewPresupuesto_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                EditarFila(SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewPresupuesto_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                ActualizaFila(SP_ActualizaBonificacion, SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }

        }


        protected void GridViewPresupuesto_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                CancelarEdicionFila(SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }


        protected void ImgBtnAddPresupuesto_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                agregarNuevaFila(SP_ConsultaPresupuestoXanoPeriodo, this.GridViewPresupuesto, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }

        }


    }
}