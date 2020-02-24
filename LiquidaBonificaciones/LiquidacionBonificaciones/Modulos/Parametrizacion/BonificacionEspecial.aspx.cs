using System;
using System.Collections.Generic;
using System.Globalization;
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

   //Procedimientos almacenados que interactuan con el Gridview
   private String SP_ConsultaBonificacionesXidPlan = "BON_ConsultaBonificacionEspecialXidPlan";
   private  String Sp_EliminaBonificacion  = "BON_BorrarBonificacionEspecial";
   private  String SP_InsertaBonificacion  = "BON_CrearBonificacionEspecial";
   private  String SP_ActualizaBonificacion = "BON_ActBonificacionEspecial";

   //Procedimientos almacenados que interactuan con los Combos
   private String SP_ConsultaPlanesBonificacionesXrol = "BON_ConsultaPlanesBonificacionXrol";
   private String SP_ConsultaPerfilComercial = "BON_ConsultaPerfilComercial";

//Procedimiento almacenado que retorna  un plan de Bonificacion Especifico

   private String SP_ConsultaPlanesBonificacionXid = "BON_ConsultaPlanesBonificacionXid";
   private String SP_ActualizarPlanDeBonificacion = "BON_ActPlanBonificacionEspecial";

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

                    cargarComboPerfilComercial();
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
            Session["Obj_BonificacionEspecialEn"] = "";
            TextBoxIdPlan.Text = "";
            this.GridViewBonificacionEspecial.DataSource = "";
            GridViewBonificacionEspecial.DataBind();
            cancelarControlesEditarEstadoPlan();
            ocultarControlesEstadoPlan();
            ocultarControlesAnadirNuevo();
            
        }


        //Muestra Los Controles para añadir un Elemento nuevo al gridview
        private void mostrarControlesAnadirNuevo()
        {
            this.Label9.Visible = true;
            this.ImgBtnAddCantidadPlanes.Visible = true;
        }

        //Oculta Los Controles para añadir un Elemento nuevo al gridview
        private void ocultarControlesAnadirNuevo()
        {
            LabelDescipcionPlan.Text = "";
            this.Label9.Visible = false;
            this.ImgBtnAddCantidadPlanes.Visible = false;
        }

        // Controles Dinamicos que editan la vista en tiempo de ejecucion
        protected void ocultarControlesEstadoPlan()
        {
            this.LabelEstadoPlan.Visible = false;
            this.ImgEditarEstadoPlan.Visible = false;
            
        }

        // Controles Dinamicos que editan la vista en tiempo de ejecucion
        protected void cancelarControlesEditarEstadoPlan()
        {
            this.LabelEstadoPlan.Visible = true;
            this.ImgEditarEstadoPlan.Visible = true;
            this.EstadoLista.Visible = false;
            this.ImgGuardarEstadoPlan.Visible = false;
            this.ImgCancelarEdicionEstadoPlan.Visible = false;
        }

        // Controles Dinamicos que editan la vista en tiempo de ejecucion
        protected void mostrarControlesEditarEstadoPlan()
        {
            this.EstadoLista.Visible = true;
            this.ImgGuardarEstadoPlan.Visible = true;
            this.ImgCancelarEdicionEstadoPlan.Visible = true;
        }

        //Permite Editar el estado del plan
        protected void ImgEditarEstadoPlan_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
            mostrarControlesEditarEstadoPlan();
            ocultarControlesEstadoPlan();
           
                Boolean estadoPlan = Convert.ToBoolean(Session["EstadoPlan"].ToString());
                if (estadoPlan == true)
                {
                    this.EstadoLista.SelectedIndex = 1;
                }
                else { this.EstadoLista.SelectedIndex = 0; }
            }
            catch (NullReferenceException) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SesionExpirada + "');</script>", false);
            }

   

        }

        //Permite Guardar el estado del plan
        protected void ImgGuardarEstadoPlan_Click(object sender, ImageClickEventArgs e)
        {

           
            

            try
            {
                PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
                PlanDeBonificacionEN pben = new PlanDeBonificacionEN();
                pben.ID = Convert.ToInt32(Session["Obj_BonificacionEspecialEn"].ToString());
                pben.estado = Convert.ToBoolean(this.EstadoLista.SelectedValue);
                pben.pUsuActualiza = Session["usuario"].ToString();
                cancelarControlesEditarEstadoPlan();
                int result = Convert.ToInt32(pbln.ActualizarPlanBonificacionEspecialLN(pben, SP_ActualizarPlanDeBonificacion));
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.CambioEstadoPlan + "');</script>", false);
                    IList<PlanDeBonificacionEN> listaplanes = pbln.ConsultarPlanBonificacionEspecialXidLN(SP_ConsultaPlanesBonificacionXid, pben);
                    if (listaplanes[0].estado == true)
                    {
                        this.LabelEstadoPlan.Text = "Activo";

                    }
                    else
                    {
                        this.LabelEstadoPlan.Text = "Desactivado";

                    }
                }
                else {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.NoCambioEstadoPlan + "');</script>", false);
                }
            }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SesionExpirada+ "');</script>", false);
            }
            


        }
        //Permite Cancelar la edicion de el estado del plan
        protected void ImgCancelarEdicionEstadoPlan_Click(object sender, ImageClickEventArgs e)
        {
            cancelarControlesEditarEstadoPlan();

        }


        //Entrega la bonificacion seleccionada
        protected void ListBonificacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            mostrarControlesAnadirNuevo();
            TextBoxIdPlan.Text = ListBonificacion.Text;
            Session["Obj_BonificacionEspecialEn"] = ListBonificacion.Text; //Se envia el resultado del Combo a sesion para que funcione en los otros eventos del GridView
            //Carga los grid view con informacion
            this.GridViewBonificacionEspecial.ShowFooter = false; //oculta el footer si esta visible
            this.GridViewBonificacionEspecial.EditIndex = -1; //Devuelve al modo sin edicion 
            PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
            PlanDeBonificacionEN planBonificacion = new PlanDeBonificacionEN();
            planBonificacion.ID = Convert.ToInt32(Session["Obj_BonificacionEspecialEn"].ToString());
            IList<PlanDeBonificacionEN> lista= pbln.ConsultarPlanBonificacionEspecialXidLN(SP_ConsultaPlanesBonificacionXid,planBonificacion);
            try
            {
                if (lista.Count > 0)
                {
                    this.LabelDescipcionPlan.Text = lista[0].Descripcion;
                    Session["EstadoPlan"] = lista[0].estado;
                    if (lista[0].estado == true)
                    {
                        this.LabelEstadoPlan.Text = "Activo";

                    }
                    else
                    {
                        this.LabelEstadoPlan.Text = "Desactivado";

                    }
                    cargarGridviewBonificacionEspecial(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, Session["Obj_BonificacionEspecialEn"].ToString());
                    cancelarControlesEditarEstadoPlan();
                }
                else {
                    cargarGridviewBonificacionEspecial(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, Session["Obj_BonificacionEspecialEn"].ToString());
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionSeleccion + "');</script>", false);
                    ocultarControlesAnadirNuevo();
                    ocultarControlesEstadoPlan();
                }
            }
            catch (Exception) {
                cargarGridviewBonificacionEspecial(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, Session["Obj_BonificacionEspecialEn"].ToString());
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionInvalida + "');</script>", false);
                ocultarControlesAnadirNuevo();
                ocultarControlesEstadoPlan();
            }
            
        }
        //Entrega el rol seleccionado y carga la lista de bonificaciones con este rol
        protected void ListAsesor_SelectedIndexChanged(object sender, EventArgs e)
        {
            resetearPantalla();
            cargarComboPlanesBonificaciones(ListAsesor.Text);
        }





        // Carga los combos con informacion
        private void cargarComboPerfilComercial() {
            PerfilComercialLN pcln = new PerfilComercialLN();
            List<Object> listPc = pcln.ConsultarPerfilesComercialesLN(SP_ConsultaPerfilComercial).Cast<Object>().ToList();
            cargarComboGenerico(listPc, this.ListAsesor);
          
        }
        // Carga los combos con informacion
        private void cargarComboPlanesBonificaciones(String perfilComercial) {
            PlanDeBonificacionLN pbln = new PlanDeBonificacionLN();
            PlanDeBonificacionEN asen = new PlanDeBonificacionEN();
            asen.ID = Convert.ToInt32(perfilComercial);
            List<Object> listPb = pbln.ConsultarPlanBonificacionEspecialXidLN(SP_ConsultaPlanesBonificacionesXrol, asen).Cast<Object>().ToList();
            cargarComboGenerico(listPb, this.ListBonificacion);
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
                ocultarControlesEstadoPlan();

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinInformacionDB+"');</script>", false);

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
        private void modificacionHeadersGridview() {
            //Modifica Los Heaters del Grid View Segun el plan de Bonificaion Seleccionado
            String indexBonificacionEspecial = Session["Obj_BonificacionEspecialEn"].ToString();
            if (indexBonificacionEspecial == "1" || indexBonificacionEspecial == "6")
            {
                this.GridViewBonificacionEspecial.HeaderRow.Cells[1].Text = "Descripcion";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[2].Text = "Planes Minimos";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[3].Text = "Planes Maximos";
            }
            else if (indexBonificacionEspecial == "2")
            {
                this.GridViewBonificacionEspecial.HeaderRow.Cells[1].Text = "Descripcion";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[2].Text = "Planes Desde";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[3].Text = "Planes Hasta";
            }
            else if (indexBonificacionEspecial == "3" || indexBonificacionEspecial == "4" || indexBonificacionEspecial == "5" || indexBonificacionEspecial == "7")
            {
                this.GridViewBonificacionEspecial.HeaderRow.Cells[1].Text = "Descripcion";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[2].Text = "% Minimo de Cumplimiento";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[3].Text = "% Maximo de Cumplimiento";
            }
            else if (indexBonificacionEspecial == "8")
            {
                this.GridViewBonificacionEspecial.HeaderRow.Cells[1].Text = "Meta de Ventas";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[2].Text = "Fecha Desde";
                this.GridViewBonificacionEspecial.HeaderRow.Cells[3].Text = "Fecha Hasta";
                
            }
        }

        private int cargarGridviewBonificacionEspecial (String SP_Consulta,GridView gr,String planBonificacion){
            BonificacionEspecialLN beln = new BonificacionEspecialLN();
            BonificacionEspecialEN ben = new BonificacionEspecialEN();
            ben.pIdPlanBonificacion = Convert.ToInt32(planBonificacion);
            IList<BonificacionEspecialEN> DatosParametros = beln.ConsultarBonificacionEspecialXidPlanLN(SP_Consulta,ben);
                if (DatosParametros.Count > 0)
                {
                    //Carga la tabla de parametros al GridView
                    gr.DataSource = DatosParametros;
                    gr.DataBind();

                    //Modifica Los Heaters del Grid View Segun el plan de Bonificaion Seleccionado
                    modificacionHeadersGridview();

                }
                else
                {                  
                    //gr.Columns[8].Visible = false; Ocular una columna
                    BonificacionEspecialEN be = new BonificacionEspecialEN();
                    DatosParametros.Add(be);
                    gr.DataSource = DatosParametros;
                    gr.DataBind();

                    //Modifica Los Heaters del Grid View Segun el plan de Bonificaion Seleccionado
                    modificacionHeadersGridview();
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinParametros + " Por Cantidad Planes" + "');</script>", false);
                }
                
            
            return DatosParametros.Count;
            }


        private void ElminarFila(String SP_Elimina,String SP_Consulta,GridView gr,GridViewDeleteEventArgs e,String planBonificacion)
        {
            int id = e.RowIndex;
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            be.pId = Convert.ToInt32(l1ID.Text);
            BonificacionEspecialLN beln = new BonificacionEspecialLN();

            try
            {
                String retorno = beln.EliminarBonificacionEspecialLN(be,SP_Elimina);
                int reg = Convert.ToInt32(retorno);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Elimino " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewBonificacionEspecial(SP_Consulta,gr,planBonificacion);//Refresca el gridview
            }
            catch(Exception ex){
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message + "');</script>", false);
            }

        }

        private void InsertarFila(String SP_Inserta,String SP_Consulta,GridView gr, GridViewCommandEventArgs e,String planBonificacion) {

            if (e.CommandName == "Insert")
            {
                BonificacionEspecialEN be = new BonificacionEspecialEN();
                BonificacionEspecialLN beln = new BonificacionEspecialLN(); ;
                TextBox t5Fdes = (TextBox)gr.FooterRow.FindControl("TextBox5");
                TextBox t6Fpmin = (TextBox)gr.FooterRow.FindControl("TextBox6");
                TextBox t7Fpmax = (TextBox)gr.FooterRow.FindControl("TextBox7");
                TextBox t8Fvbon = (TextBox)gr.FooterRow.FindControl("TextBox8");
                CheckBox c2Fapl = (CheckBox)gr.FooterRow.FindControl("CheckBox2");



                try
                {
                    be.pDescripcionBono = t5Fdes.Text;
                    be.pPlanesMinimos = Convert.ToDouble(t6Fpmin.Text );
                    be.pPlanesMaximos = Convert.ToDouble(t7Fpmax.Text );
                    be.pValorBono = Convert.ToDouble(t8Fvbon.Text);
                    be.pEstado = Convert.ToBoolean(c2Fapl.Checked);
                    be.pUsuActualiza = Session["Usuario"].ToString();
                    be.pIdPlanBonificacion = Convert.ToInt32(Session["Obj_BonificacionEspecialEn"].ToString());
                    String retorno = beln.InsertarBonificacionEspecialLN(be, SP_Inserta);
                    int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Agrego " + reg + " Registro Correctamente" + "');</script>", false);

                    gr.ShowFooter = false; //Oculta El Footer
                    this.cargarGridviewBonificacionEspecial(SP_Consulta,gr,planBonificacion);//Refresca el gridview
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
                }
            }
        }

        private void EditarFila(String SP_Consulta,GridView gr, GridViewEditEventArgs e,String planBonificacion) {
          
            gr.EditIndex = e.NewEditIndex; //Activa el modo edicion
            this.cargarGridviewBonificacionEspecial(SP_Consulta,gr,planBonificacion);
        }

        private void ActualizaFila(String SP_Actualiza,String SP_Consulta,GridView gr,GridViewUpdateEventArgs e,String planBonificacion) {
            //CApturar Controles
           
            int id = e.RowIndex; //iterador de la fil
            Label l1ID = (Label)gr.Rows[id].FindControl("Label0"); //Llave de la tabla control oculto
            TextBox t1Des = (TextBox)gr.Rows[id].FindControl("Textbox1"); //Sirve para Templates
            TextBox t2pmin = (TextBox)gr.Rows[id].FindControl("Textbox2");
            TextBox t3pmax = (TextBox)gr.Rows[id].FindControl("Textbox3");
            TextBox t4vbon = (TextBox)gr.Rows[id].FindControl("Textbox4");
            CheckBox c1apl = (CheckBox)gr.Rows[id].FindControl("CheckBox1");
            BonificacionEspecialEN be = new BonificacionEspecialEN();
            BonificacionEspecialLN beln = new BonificacionEspecialLN();
            try
            {
                be.pId = Convert.ToInt32(l1ID.Text);
                be.pDescripcionBono = t1Des.Text;
                be.pPlanesMinimos = Convert.ToDouble(t2pmin.Text);
                be.pPlanesMaximos = Convert.ToDouble(t3pmax.Text);
                be.pValorBono = Convert.ToDouble(t4vbon.Text);
                be.pEstado = Convert.ToBoolean(c1apl.Checked);
                be.pUsuActualiza = Session["Usuario"].ToString();
                be.pIdPlanBonificacion = Convert.ToInt32(Session["Obj_BonificacionEspecialEn"].ToString());
                string retorno = beln.ActualizarBonificacionEspecialLN(be, SP_Actualiza);
                int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Actualizo " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewBonificacionEspecial(SP_Consulta,gr,planBonificacion);//Refresca el gridview

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
            }
        }

        private void CancelarEdicionFila(String SP_Consulta, GridView gr,GridViewCancelEditEventArgs e,String planBonificacion ){
            gr.ShowFooter = false; //oculta el footer si esta visible
            gr.EditIndex = -1; //Devuelve al modo sin edicion            
            this.cargarGridviewBonificacionEspecial(SP_Consulta,gr,planBonificacion);//Refresca el gridview
        }

        private void agregarNuevaFila(String SP_Consulta, GridView gr,String planBonificacion)
        {

                gr.ShowFooter = true;//muestra el Footer del Gridview
                cargarGridviewBonificacionEspecial(SP_Consulta, gr,planBonificacion);//Refresca el gridview}


        }

        //-------------------------------------- MEtodos Propios del GridView que responden a los eventos---------------------------
        //Eliminar, Insertar, Editar,Actualizar,Cancelar, Agregar

        protected void GridViewBeCantidadPlanes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try{
                ElminarFila(Sp_EliminaBonificacion, SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, e, Session["Obj_BonificacionEspecialEn"].ToString());
                                    }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        

        protected void GridViewBeCantidadPlanes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try{
                InsertarFila(SP_InsertaBonificacion, SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, e, Session["Obj_BonificacionEspecialEn"].ToString());
                                    }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewBeCantidadPlanes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try{
                EditarFila(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, e, Session["Obj_BonificacionEspecialEn"].ToString());
                                    }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewBeCantidadPlanes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           try{
               ActualizaFila(SP_ActualizaBonificacion, SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, e, Session["Obj_BonificacionEspecialEn"].ToString());
                                    }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
            
        }


        protected void GridViewBeCantidadPlanes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try{
                CancelarEdicionFila(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, e, Session["Obj_BonificacionEspecialEn"].ToString());
                                    }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }


        protected void ImgBtnAddCantidadPlanes_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                agregarNuevaFila(SP_ConsultaBonificacionesXidPlan, this.GridViewBonificacionEspecial, Session["Obj_BonificacionEspecialEn"].ToString());
            
                        }
            catch (Exception) {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
            
        }



 




     



  



    




        



    }
}