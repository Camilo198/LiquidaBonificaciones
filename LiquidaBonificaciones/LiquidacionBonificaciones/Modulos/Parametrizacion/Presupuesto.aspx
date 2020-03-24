<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Parametrizacion.Presupuesto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
    <style type="text/css">
        .EstiloEtiquetas81
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBarraHerramientas" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="upContenido" runat="server">
        <ContentTemplate>
            <table style="width: 100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="BarraSubTitulo">Parametrización
                    </td>
                </tr>
                <tr>
                    <td class="SeparadorSubTitulo"></td>
                </tr>
            </table>
            <table style="width: 100%"  cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 10px" colspan="2"></td>
                </tr>
                <tr>
                    <td style="width: 10px">&nbsp;</td>
                    <td>
                        <asp:Panel ID="pnlCliente" runat="server" ScrollBars="Auto" Height="100%" Width="1000px">

                            <asp:Panel ID="pnlDatos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="auto-style1" colspan="9">Presupuesto 
                                           
                         
                   
                                           
                                        </td>     
                                        
                                                 
                                                          <tr>
                                        <td colspan="9" class="auto-style2">
                                            <asp:DropDownList ID="ListAnos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListAnos_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:TextBox ID="TextBoxIdPlan" runat="server" Width="30px"></asp:TextBox>
                                            <asp:DropDownList ID="ListPeriodos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListPeriodos_SelectedIndexChanged">
                                            </asp:DropDownList>
                                                              </td>
                                                              <td class="EstiloEtiquetas80">
                                                                      &nbsp;</td>
                                                              <td class="EstiloEtiquetas80">
                                                                     
                                                                  &nbsp;</td>
                                                              <tr>
                                                                  <td class="EspaciadoInicial">
                                                                      &nbsp;</td>
                                                                  <td class="EstiloEtiquetas80"></td>
                                                                  <td class="EspaciadoIntermedio">
                                                                      &nbsp;</td>
                                                                  <td class="EstiloEtiquetas80">
                                                                      <asp:Label ID="LabelDescipcionPlan" runat="server" Text="Descripcion"></asp:Label>
                                                                  </td>
                                                                  <td class="EspaciadoIntermedio"></td>
                                                                  <td class="EspaciadoIntermedio"></td>
                                                                  <td class="EspaciadoFinal"></td>
                                                              </tr>
                                                              <tr>
                                                                  <td class="EspaciadoInicial"></td>
                                                                  <td class="EstiloEtiquetas80"></td>
                                                                  <td class="EspaciadoIntermedio"></td>
                                                                  <td colspan="9" style="height: 10px">
                                                                      <asp:ImageButton ID="ImgBtnAddPresupuesto" runat="server" ImageUrl="~/MarcaVisual/iconos/agregar.png" OnClick="ImgBtnAddPresupuesto_Click" />
                                                                      <asp:Label ID="Label9" runat="server" Text="Añadir Nueva Oficina al Presupuesto "></asp:Label>
                                                                  </td>
                                                              </tr>
                                                              <tr>
                                                                  <td class="EspaciadoInicial"></td>
                                                                  <td class="EstiloEtiquetas80"></td>
                                                                  <td class="EspaciadoIntermedio"></td>
                                                                  <td>
                                                                       <div id="containerDiv"  style="overflow-y:auto;height:400px">
                                                                          <!--BARRA VERTICAL-->
                                                                          <asp:GridView ID="GridViewPresupuesto" runat="server" AllowSorting="True" AutoGenerateColumns="False" BorderColor="#D0DEF0" BorderStyle="Solid" BorderWidth="1px" CssClass="EstiloEtiquetas81" Font-Size="Small" GridLines="Horizontal" 
                                                                             HeaderStyle-CssClass="FixedHeader"   HorizontalAlign="Left" OnRowCancelingEdit="GridViewPresupuesto_RowCancelingEdit" OnRowCommand="GridViewPresupuesto_RowCommand" onrowdatabound="GridViewPresupuesto_RowDataBound" 
                                                                              OnRowDeleting="GridViewPresupuesto_RowDeleting" OnRowEditing="GridViewPresupuesto_RowEditing" OnRowUpdating="GridViewPresupuesto_RowUpdating" ShowHeaderWhenEmpty="True" Width="950px" >
                                                                              <Columns>
                                                                                  <asp:TemplateField HeaderText="CodZona">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox8" horizontalAling="Center" runat="server" Width="30px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label10" runat="server" Width="30px" Text='<%# Bind("codigoZona") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="CodOfic">
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label0" runat="server" Width="25px" Text='<%# Bind("codigoOficina") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <EditItemTemplate>
                                                                                          <asp:Label ID="Label15" runat="server" Width="40px" Text='<%# Bind("codigoOficina") %>'></asp:Label>
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox4" runat="server" Width="40px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="CodDir">
                                                                                      <EditItemTemplate>
                                                                                          <asp:TextBox ID="TextBox9" runat="server"   Width="40px" Text='<%# Bind("codigoDirector") %>'></asp:TextBox>
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox10" runat="server" Width="40px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label11" runat="server"  Width="30px" Text='<%# Bind("codigoDirector") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="CodGer">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox11" runat="server" Width="40px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label12" runat="server"  Width="30px" Text='<%# Bind("codigoGerente") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="MetaVen">
                                                                                      <EditItemTemplate>
                                                                                          <asp:TextBox ID="TextBox1" runat="server"  Width="30px" Text='<%# Bind("presupuesto") %>'></asp:TextBox>
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox5" runat="server" Width="30px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label1" runat="server" Width="30px" Text='<%# Bind("presupuesto") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="PartCer">
                                                                                      <EditItemTemplate>
                                                                                          <asp:TextBox ID="TextBox12" Width="40px" runat="server" Text='<%# Bind("retoSonadoresDia") %>'></asp:TextBox>
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox13" Width="30px" runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label13" runat="server" Width="30px" Text='<%# Bind("retoSonadoresDia") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="ValAsesor">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox16" Width=50px  runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label16" runat="server" Width=40px Text='<%# Bind("bonoAsesorSonadoresDia") %>' ></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="ValDirect">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox18" Width=40px runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label18" runat="server" Width=40px Text='<%# Bind("bonoDirectorSonadoresDia") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="ExtPartCe">
                                                                                      <EditItemTemplate>
                                                                                          <asp:TextBox ID="TextBox14"  Width="40px" runat="server" Text='<%# Bind("retoExtraSonadoresDia") %>'></asp:TextBox>
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox15"  Width="30px" runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label14" runat="server"  Width="20px" Text='<%# Bind("retoExtraSonadoresDia") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="ValExAse">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox17" Width=50px  runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label17" runat="server" Width=40px  Text='<%# Bind("bonoAsesorExtraSonadoresDia") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="ValExDir">
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox19" Width=50px runat="server"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label19" runat="server" Width=30px Text='<%# Bind("bonoDirectorExtraSonadoresDia") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="Periodo">
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label2" runat="server" Width="20px" Text='<%# Bind("periodo") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox6" runat="server" Width="20px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="Año">
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label3" runat="server" Width="30px" Text='<%# Bind("ano") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:TextBox ID="TextBox7" runat="server" Width="30px"></asp:TextBox>
                                                                                      </FooterTemplate>
                                                                                      <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="UsuarioActualiza">
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label5" runat="server" Width="40px" Text='<%# Bind("usuarioActualiza") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="FechaActualiza">
                                                                                      <ItemTemplate>
                                                                                          <asp:Label ID="Label6" runat="server" Width="80px" Text='<%# Bind("fechaActualiza") %>'></asp:Label>
                                                                                      </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                  </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="EditarFila">
                                                                                      <ItemTemplate>
                                                                                          <asp:ImageButton ID="imgBtnEdit" runat="server" CommandName="Edit" Height="20px" ImageUrl="~/MarcaVisual/iconos/Editar.png" ToolTip="Editar" Width="20px" />
                                                                                      </ItemTemplate>
                                                                                      <EditItemTemplate>
                                                                                          <asp:ImageButton ID="ImgBtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/MarcaVisual/iconos/borrar.png" ToolTip="Cancelar" />
                                                                                          <asp:ImageButton ID="ImgBtnUpdate" runat="server" CommandName="Update" ImageUrl="~/MarcaVisual/iconos/Aceptar.png" ToolTip="Actualizar" />
                                                                                          <asp:ImageButton ID="ImgBtnDelete" runat="server" CommandName="Delete" ImageUrl="~/MarcaVisual/iconos/delete.png" ToolTip="Borrar" />
                                                                                      </EditItemTemplate>
                                                                                      <FooterTemplate>
                                                                                          <asp:ImageButton ID="ImgBtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/MarcaVisual/iconos/borrar.png" ToolTip="Cancelar" />
                                                                                          <asp:ImageButton ID="ImgBtnInsert" runat="server" CommandName="Insert" ImageUrl="~/MarcaVisual/iconos/Guardar.png" ToolTip="Insertar" />
                                                                                      </FooterTemplate>
                                                                                  
                                                                                  </asp:TemplateField>
                                                                              </Columns>
                                                                              <PagerStyle BackColor="White" Height="2px" HorizontalAlign="Center" />
                                                                              <SelectedRowStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="#333333" />
                                                                              <HeaderStyle BackColor="#326394" Font-Bold="True" Font-Size="Small" ForeColor="White" />
                                                                              <AlternatingRowStyle BackColor="#F2F2F2" />
                                                                          </asp:GridView>
                                                                      </div>
                                                                      
                                                                 

                                                                  </td>
                                                                  <td colspan="9">&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                  <td colspan="7" style="height: 10px"  class="EstiloEtiquetas80">                                                                     
                                                                      <br />
                                                                      <br />
                                                                      <asp:Label ID="Label7" runat="server" Text="Cargar Presupúesto desde Excel"></asp:Label>
                                                                      <asp:FileUpload ID="FileUploadControl" runat="server" />
                                                                      <asp:Button ID="UploadButton" runat="server" onclick="UploadButton_Click" text="Subir Archivo" />
                                                                      <br />
                                                                      <br />
                                                                      <asp:Label ID="Label8" runat="server" Text="Error Estatus"></asp:Label>
                                                                       <br />
                                                                      <br />
                                                                  </td>
                                                              </tr>
                                    </tr>
                                </table>
                            </asp:Panel>
                             <br />

                            

                            </asp:Panel>

                            <br />
                    </td>
                </tr>
                
            </table>
 
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="UploadButton" />

        </Triggers>

    </asp:UpdatePanel>
               <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upContenido">
                <ProgressTemplate>
                    <div class="contenedor">
                        <div class="centrado">
                            <div class="contenido" style="width: 100px; height: 20px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/MarcaVisual/iconos/loading.gif"
                                    Height="20px" Width="100px" ImageAlign="Middle" />
                            </div>
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
</asp:Content>
