using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiquidaBonificaciones.EN.Tablas;
using LiquidaBonificaciones.LN.Consultas;
using SpreadsheetLight;

namespace LiquidacionBonificaciones.Modulos.Parametrizacion
{
    public partial class Retos : System.Web.UI.Page
    {
        //Procedimientos almacenados que interactuan con el Gridview
        private String SP_ConsultaRetosXanoPeriodo = "BON_ConsultaRetos";
        private String Sp_EliminaReto = "BON_BorrarReto";
        private String SP_InsertaReto = "BON_CrearReto";
        private String SP_ActualizaReto = "BON_ActReto";
        private String SP_ConsultaRetosXllave = "BON_ConsultaRetosXllave";

        //Procedimientos almacenados que interactuan con los Combos
        private String SP_ConsultaPeriodosRetosXano = "BON_ConsultaPeriodosRetosXano";
        private String SP_ConsultaAnosRetos = "BON_ConsultaAnosRetos";


        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager _scriptMan = ScriptManager.GetCurrent(this);
            _scriptMan.AsyncPostBackTimeout = 36000;
            try
            {

                UsuarioEN objUsuario = new UsuarioEN();
              //  Session["usuario"] = "cristian.munoz";
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

                    cargarComboAnosRetos();
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
            this.GridViewRetos.DataSource = "";
            GridViewRetos.DataBind();
            this.Label8.Visible = false;
            ocultarControlesAnadirNuevo();



        }


        //Entrega la bonificacion seleccionada
        protected void ListPeriodos_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxIdPlan.Text = ListPeriodos.Text;
            Session["Obj_Periodo"] = ListPeriodos.Text; //Se envia el resultado del Combo a sesion para que funcione en los otros eventos del GridView
            //Carga los grid view con informacion
            this.GridViewRetos.ShowFooter = false; //oculta el footer si esta visible
            this.GridViewRetos.EditIndex = -1; //Devuelve al modo sin edicion 
            RetosLN retLn = new RetosLN();
            RetosEN retEn = new RetosEN();
            retEn.periodo = Convert.ToInt32(Session["Obj_Periodo"].ToString());
            retEn.ano = Convert.ToInt32(Session["Obj_Ano"].ToString());
            IList<RetosEN> lista = retLn.ConsultarRetosLN(SP_ConsultaRetosXanoPeriodo, retEn);
            try
            {
                if (lista.Count > 0)
                {
                    this.LabelDescipcionPlan.Text = "Retos: " + lista[0].ano.ToString() + "-" + lista[0].periodo;
                    cargarGridviewRetos(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
                }
                else
                {
                    cargarGridviewRetos(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
                    ocultarControlesAnadirNuevo();
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionSeleccion + "');</script>", false);

                }
            }
            catch (Exception)
            {
                cargarGridviewRetos(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
                ocultarControlesAnadirNuevo();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.OpcionInvalida + "');</script>", false);

            }

        }
        //Entrega el rol seleccionado y carga la lista de bonificaciones con este rol
        protected void ListAnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            resetearPantalla();
            cargarComboPeriodosRetos(ListAnos.Text);
            Session["Obj_Ano"] = ListAnos.Text;
        }


        //Muestra Los Controles para añadir un Elemento nuevo al gridview
        private void mostrarControlesAnadirNuevo()
        {
            this.Label9.Visible = true;
            this.ImgBtnAddRetos.Visible = true;
        }

        //Oculta Los Controles para añadir un Elemento nuevo al gridview
        private void ocultarControlesAnadirNuevo()
        {
            LabelDescipcionPlan.Text = "";
            this.Label9.Visible = false;
            this.ImgBtnAddRetos.Visible = false;
        }

        // Carga los combos con informacion
        private void cargarComboAnosRetos()
        {
            RetosLN retLn = new RetosLN();
            List<Object> listPc = retLn.ConsultarAnosRetosLN(SP_ConsultaAnosRetos).Cast<Object>().ToList();
            this.ListPeriodos.DataSource = "";
            this.ListPeriodos.DataBind();
            this.ListPeriodos.Items.Insert(0, new ListItem("Sin Informacion", "0"));
            cargarComboGenerico(listPc, this.ListAnos);

        }
        // Carga los combos con informacion
        private void cargarComboPeriodosRetos(String ano)
        {
            RetosLN retLn = new RetosLN();
            RetosEN retEn = new RetosEN();
            retEn.ID = Convert.ToInt32(ano);
            List<Object> listPre = retLn.ConsultarPeriodosRetosXanoLN(SP_ConsultaPeriodosRetosXano, retEn).Cast<Object>().ToList();
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

        private int cargarGridviewRetos(String SP_Consulta, GridView gr, String Periodo, String Ano)
        {
            mostrarControlesAnadirNuevo();
            RetosLN retLn = new RetosLN();
            RetosEN retEn = new RetosEN();
            retEn.periodo = Convert.ToInt32(Periodo);
            retEn.ano = Convert.ToInt32(Ano);
            IList<RetosEN> DatosParametros = retLn.ConsultarRetosLN(SP_Consulta, retEn);
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
                RetosEN be = new RetosEN();
                DatosParametros.Add(be);
                gr.DataSource = DatosParametros;
                gr.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.SinParametros + " Por Cantidad Planes" + "');</script>", false);
            }


            return DatosParametros.Count;
        }

        private int cargarGridviewRetosXllave(String SP_Consulta, GridView gr, String Periodo, String Ano,String CodigoGer, String FechaIni, String FechaFin)
        {
            mostrarControlesAnadirNuevo();
            RetosLN retLn = new RetosLN();
            RetosEN retEn = new RetosEN();
            retEn.periodo = Convert.ToInt32(Periodo);
            retEn.ano = Convert.ToInt32(Ano);
            retEn.codigoGerente = Convert.ToInt32(CodigoGer);
            retEn.fechaInicioReto = Convert.ToDateTime(FechaIni);
            retEn.fechaFinReto = Convert.ToDateTime(FechaFin);
            IList<RetosEN> DatosParametros = retLn.ConsultarRetosXllaveLN(SP_Consulta, retEn);
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
                RetosEN be = new RetosEN();
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
            Label l1CodGeren= (Label)gr.Rows[id].FindControl("Label10");
            Label l2Periodo = (Label)gr.Rows[id].FindControl("Label2");
            Label l3ano = (Label)gr.Rows[id].FindControl("Label3");
            Label l4FechaInicio = (Label)gr.Rows[id].FindControl("Label11");
            Label l5FechaFin = (Label)gr.Rows[id].FindControl("Label12");

            RetosEN retEn = new RetosEN();
            retEn.codigoGerente = Convert.ToInt32(l1CodGeren.Text);
            retEn.periodo = Convert.ToInt32(l2Periodo.Text);
            retEn.ano = Convert.ToInt32(l3ano.Text);
            retEn.fechaInicioReto=Convert.ToDateTime(l4FechaInicio.Text);
            retEn.fechaFinReto = Convert.ToDateTime(l5FechaFin.Text);
            RetosLN retLn = new RetosLN();

            try
            {
                String retorno = retLn.EliminarRetosLN(retEn, SP_Elimina);
                int reg = Convert.ToInt32(retorno);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Elimino " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewRetos(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview
                cargarComboPeriodosRetos(Session["Obj_Ano"].ToString());
                cargarComboAnosRetos();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + ex.Message + "');</script>", false);
            }

        }


        //--Ajustar
        private void InsertarFila(String SP_Inserta, String SP_Consulta, GridView gr, GridViewCommandEventArgs e, String Periodo, String Ano)
        {

            if (e.CommandName == "Insert")
            {
                RetosEN retEn = new RetosEN();
                RetosLN retLn = new RetosLN();
                TextBox t4FcodZona = (TextBox)gr.FooterRow.FindControl("TextBox4");
                TextBox t5FRetos = (TextBox)gr.FooterRow.FindControl("TextBox5");
                TextBox t6FPeriodo = (TextBox)gr.FooterRow.FindControl("TextBox6");
                TextBox t7Fano = (TextBox)gr.FooterRow.FindControl("TextBox7");
                TextBox t9FcodGerente = (TextBox)gr.FooterRow.FindControl("TextBox9");
                TextBox t10FFechaInicial = (TextBox)gr.FooterRow.FindControl("TextBox10");
                TextBox t11FFechaFinal = (TextBox)gr.FooterRow.FindControl("TextBox11");
                TextBox t13FvalorBono= (TextBox)gr.FooterRow.FindControl("TextBox13");
                TextBox t14FnumeroRetp = (TextBox)gr.FooterRow.FindControl("TextBox14");

                try
                {
                    retEn.codigoZona = Convert.ToInt32(t4FcodZona.Text);
                    retEn.RetoEnVentas = Convert.ToInt32(t5FRetos.Text);
                    retEn.periodo = Convert.ToInt32(t6FPeriodo.Text);
                    retEn.ano = Convert.ToInt32(t7Fano.Text);
                    retEn.codigoGerente = Convert.ToInt32(t9FcodGerente.Text);
                    retEn.fechaInicioReto = Convert.ToDateTime(t10FFechaInicial.Text);
                    retEn.fechaFinReto = Convert.ToDateTime(t11FFechaFinal.Text);
                    retEn.valorBono = Convert.ToInt32(t13FvalorBono.Text);
                    retEn.usuarioActualiza = Session["Usuario"].ToString();
                    retEn.numeroReto = Convert.ToInt32(t14FnumeroRetp.Text);
                    String retorno = retLn.InsertarRetosLN(retEn, SP_Inserta);
                    int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Agrego " + reg + " Registro Correctamente" + "');</script>", false);

                    gr.ShowFooter = false; //Oculta El Footer
                    this.cargarGridviewRetos(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview
                    cargarComboPeriodosRetos(Session["Obj_Ano"].ToString());
                    cargarComboAnosRetos();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ParametrosInvalidos + "');</script>", false);
                }
            }
        }

        private void EditarFila(String SP_Consulta, GridView gr, GridViewEditEventArgs e, String Periodo, String Ano)
        {
            int id = e.NewEditIndex;
            gr.EditIndex = id;  //Activa el modo edicion
            Label l4CodGeren = (Label)gr.Rows[id].FindControl("Label10"); //Llave de la tabla 
            Label l5FechaInicial = (Label)gr.Rows[id].FindControl("Label11");
            Label l6FechaFinal = (Label)gr.Rows[id].FindControl("Label12");

            this.cargarGridviewRetosXllave(SP_Consulta, gr, Periodo, Ano,l4CodGeren.Text,l5FechaInicial.Text,l6FechaFinal.Text);
        }
        //---Ajustar
        private void ActualizaFila(String SP_Actualiza, String SP_Consulta, GridView gr, GridViewUpdateEventArgs e, String Periodo, String Ano)
        {
            //CApturar Controles

            int id = e.RowIndex; //iterador de la fil
            TextBox l0CodZona = (TextBox)gr.Rows[id].FindControl("Textbox8");
            TextBox t1Retos = (TextBox)gr.Rows[id].FindControl("Textbox1"); //Sirve para Templates
            Label l2Periodo = (Label)gr.Rows[id].FindControl("Label2");
            Label l3ano = (Label)gr.Rows[id].FindControl("Label3");
            Label l4CodGeren = (Label)gr.Rows[id].FindControl("Label10"); //Llave de la tabla 
            Label l5FechaInicial = (Label)gr.Rows[id].FindControl("Label11");
            Label l6FechaFinal = (Label)gr.Rows[id].FindControl("Label12");
            TextBox t7VAlorBono = (TextBox)gr.Rows[id].FindControl("Textbox12"); //Sirve para Templates
            RetosEN retEn = new RetosEN();
            RetosLN beln = new RetosLN();
            try
            {
                retEn.codigoZona = Convert.ToInt32(l0CodZona.Text);
               retEn.RetoEnVentas = Convert.ToInt32(t1Retos.Text);
                retEn.periodo = Convert.ToInt32(l2Periodo.Text);
                retEn.ano = Convert.ToInt32(l3ano.Text);                
                retEn.codigoGerente = Convert.ToInt32(l4CodGeren.Text);
                retEn.fechaInicioReto = Convert.ToDateTime(l5FechaInicial.Text);
                retEn.fechaFinReto = Convert.ToDateTime(l6FechaFinal.Text);
                retEn.valorBono = Convert.ToInt32(t7VAlorBono.Text);                
                retEn.usuarioActualiza = Session["Usuario"].ToString();
                string retorno = beln.ActualizarRetosLN(retEn, SP_Actualiza);
                int reg = Convert.ToInt32(retorno);// Si ejecuta con exito
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + "Se Actualizo " + reg + " Registro Correctamente" + "');</script>", false);
                gr.EditIndex = -1; //Devuelve al modo sin edicion
                this.cargarGridviewRetos(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview

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
            this.cargarGridviewRetos(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview
        }

        private void agregarNuevaFila(String SP_Consulta, GridView gr, String Periodo, String Ano)
        {

            gr.ShowFooter = true;//muestra el Footer del Gridview
            cargarGridviewRetos(SP_Consulta, gr, Periodo, Ano);//Refresca el gridview}


        }

        //-------------------------------------- MEtodos Propios del GridView que responden a los eventos---------------------------
        //Eliminar, Insertar, Editar,Actualizar,Cancelar, Agregar

        protected void GridViewRetos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                ElminarFila(Sp_EliminaReto, SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }



        protected void GridViewRetos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                InsertarFila(SP_InsertaReto, SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewRetos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                
                EditarFila(SP_ConsultaRetosXllave, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
               // EditarFila(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void GridViewRetos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                ActualizaFila(SP_ActualizaReto, SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }

        }


        protected void GridViewRetos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                CancelarEdicionFila(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, e, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }
        }

        protected void PosicionFinalScroll()
        {
          ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>var elm=document.getElementById('containerDiv');elm.scrollTop=99999999;</script>", false);

                    }



        protected void ImgBtnAddRetos_Click(object sender, ImageClickEventArgs e)
        {
            
            try
            {
                PosicionFinalScroll();
                agregarNuevaFila(SP_ConsultaRetosXanoPeriodo, this.GridViewRetos, Session["Obj_Periodo"].ToString(), Session["Obj_Ano"].ToString());

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.seleccioneBonificacion + "');</script>", false);
            }

        }

        //-------------Ajustar
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            try
            {
                resetearPantalla();
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
                                RetosLN retLn = new RetosLN();
                                for (int i = 2; sl.GetCellValueAsString(i, 1) != null && sl.GetCellValueAsString(i, 1) != ""; i++)
                                {
                                    DateTime ret = sl.GetCellValueAsDateTime(i, 6);
                                    RetosEN retEn = new RetosEN();
                                    retEn.codigoZona = Convert.ToInt32(sl.GetCellValueAsString(i, 1));
                                    retEn.periodo = Convert.ToInt32(sl.GetCellValueAsString(i, 2));
                                    retEn.ano = Convert.ToInt32(sl.GetCellValueAsString(i, 3));
                                    retEn.RetoEnVentas = Convert.ToInt32(sl.GetCellValueAsString(i, 4));
                                    retEn.codigoGerente = Convert.ToInt32(sl.GetCellValueAsString(i, 5));
                                    retEn.fechaInicioReto = sl.GetCellValueAsDateTime(i, 6);
                                    retEn.fechaFinReto = sl.GetCellValueAsDateTime(i, 7);
                                    retEn.valorBono = Convert.ToDouble(sl.GetCellValueAsString(i, 8));
                                    retEn.numeroReto = Convert.ToInt32(sl.GetCellValueAsString(i, 9));

                                    retEn.usuarioActualiza = Session["usuario"].ToString();
                                    String result = retLn.InsertarRetosLN(retEn, SP_InsertaReto);
                                    if ( result == "0")
                                    {
                                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ErrorProceso + "');</script>", false);
                                        break;
                                    }
                                    else if (result != "1")
                                    {
                                          if (result.Length >= 140)
                                        {
                                        LogErrores += result.Substring(140, 78) + "</br>";
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

                                    resetearPantalla();
                                    cargarComboAnosRetos();
                                    Label8.Visible = true;
                                    Label8.Text = LogErrores;

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ArchivoUpOk + "');" + "  window.location.href='/Modulos/Parametrizacion/Retos.aspx'</script>", false);

                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.archivoVacio + "');" + "  window.location.href='/Modulos/Parametrizacion/Retos.aspx'</script>", false);


                            }




                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), "<script type='text/javascript'>alert('" + Mensajes.ArchivoUpFail + "');</script>", false);
                            Label8.Visible = true;
                            Label8.Text = ex.ToString();
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

        protected void GridViewRetos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "60px");


            }

        }




    }
}