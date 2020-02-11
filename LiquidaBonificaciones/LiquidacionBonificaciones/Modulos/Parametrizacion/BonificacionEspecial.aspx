<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="BonificacionEspecial.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Parametrizacion.BonificacionEspecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">

    <style type="text/css">
        .auto-style1
        {
            font-size: 8pt;
            color: #2C4586;
            width: 268435440px;
        }
        .auto-style2
        {
            height: 10px;
            width: 268435440px;
        }
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
                        <asp:Panel ID="pnlCliente" runat="server" ScrollBars="Auto" Height="100%" Width="900px">

                            <asp:Panel ID="pnlDatos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="auto-style1" colspan="9">Bonificacion Especial </td>              
                                                          <tr>
                                        <td colspan="9" class="auto-style2">
                                            <asp:DropDownList ID="ListAsesor" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListAsesor_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:TextBox ID="TextBoxIdPlan" runat="server" Width="30px"></asp:TextBox>
                                            <asp:DropDownList ID="ListBonificacion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBonificacion_SelectedIndexChanged">
                                            </asp:DropDownList>
                                                              </td>
                                                              <td class="EstiloEtiquetas80">
                                                                      <asp:Label ID="LabelEstadoPlan" runat="server" Text="Estado Plan"></asp:Label>
                                                                  <asp:ImageButton ID="ImgEditarEstadoPlan" runat="server" ImageUrl="~/MarcaVisual/iconos/Editar.png" OnClick="ImgEditarEstadoPlan_Click" />
                                                                  </td>
                                                              <td class="EstiloEtiquetas80">
                                                                     
                                                                  <asp:DropDownList ID="EstadoLista" runat="server" Height="16px">
                                                                      <asp:ListItem Value="True">Activar</asp:ListItem>
                                                                      <asp:ListItem Value="False">Desactivar</asp:ListItem>
                                                                  </asp:DropDownList>
                                                                     
                                                                  <asp:ImageButton ID="ImgGuardarEstadoPlan" runat="server" ImageUrl="~/MarcaVisual/iconos/Guardar.png" OnClick="ImgGuardarEstadoPlan_Click" />
                                                              <asp:ImageButton ID="ImgCancelarEdicionEstadoPlan" runat="server" ImageUrl="~/MarcaVisual/iconos/Borrar.png" OnClick="ImgCancelarEdicionEstadoPlan_Click" />       
                                                                  
                                                              </td>
                                                              <tr>
                                                                  <td class="EspaciadoInicial">
                                                                      &nbsp;</td>
                                                                  <td class="EstiloEtiquetas80"></td>
                                                                  <td class="EspaciadoIntermedio">
                                                                      &nbsp;</td>
                                                                  <td class="EstiloEtiquetas80">
                                                                      <asp:Label ID="LabelDescipcionPlan" runat="server" Text="Descripcion del Plan"></asp:Label>
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
                                                                      <asp:ImageButton ID="ImgBtnAddCantidadPlanes" runat="server" ImageUrl="~/MarcaVisual/iconos/agregar.png" OnClick="ImgBtnAddCantidadPlanes_Click" />
                                                                      Añadir Nueva Bonificacion Especial </td>
                                                              </tr>
                                                              <tr>
                                                                  <td class="EspaciadoInicial"></td>
                                                                  <td class="EstiloEtiquetas80"></td>
                                                                  <td class="EspaciadoIntermedio"></td>
                                                                  <td>
                                                                      <asp:GridView ID="GridViewBonificacionEspecial" runat="server" AllowSorting="True" AutoGenerateColumns="False" BorderColor="#D0DEF0" BorderStyle="Solid" BorderWidth="1px" CssClass="EstiloEtiquetas81" Font-Size="Small" GridLines="Horizontal" HorizontalAlign="Left" OnRowCancelingEdit="GridViewBeCantidadPlanes_RowCancelingEdit" OnRowCommand="GridViewBeCantidadPlanes_RowCommand" OnRowDeleting="GridViewBeCantidadPlanes_RowDeleting" OnRowEditing="GridViewBeCantidadPlanes_RowEditing" OnRowUpdating="GridViewBeCantidadPlanes_RowUpdating" ShowHeaderWhenEmpty="True" Width="500px">
                                                                          <Columns>
                                                                              <asp:TemplateField HeaderText="Id">
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label0" runat="server" Text='<%# Bind("pId") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <HeaderStyle CssClass="OcultarControles" />
                                                                                  <ItemStyle CssClass="OcultarControles" HorizontalAlign="Center" />
                                                                                  <FooterStyle CssClass="OcultarControles" />
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Descripcion">
                                                                                  <EditItemTemplate>
                                                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pDescripcionBono") %>'></asp:TextBox>
                                                                                  </EditItemTemplate>
                                                                                  <FooterTemplate>
                                                                                      <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                                                                  </FooterTemplate>
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("pDescripcionBono") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <ItemStyle HorizontalAlign="Center" />

                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Planes Minimos">
                                                                                  <EditItemTemplate>
                                                                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pPlanesMinimos") %>'></asp:TextBox>
                                                                                  </EditItemTemplate>
                                                                                  <FooterTemplate>
                                                                                      <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                                                                  </FooterTemplate>
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("pPlanesMinimos") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <HeaderStyle Width="60px" />
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Planes Maximos">
                                                                                  <EditItemTemplate>
                                                                                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pPlanesMaximos") %>'></asp:TextBox>
                                                                                  </EditItemTemplate>
                                                                                  <FooterTemplate>
                                                                                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("pPlanesMaximos") %>'></asp:TextBox>
                                                                                  </FooterTemplate>
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("pPlanesMaximos") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <HeaderStyle Width="60px" />
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Valor del Bono">
                                                                                  <EditItemTemplate>
                                                                                      <asp:TextBox ID="TextBox4" runat="server" text='<%# Bind("pValorBono") %>'></asp:TextBox>
                                                                                  </EditItemTemplate>
                                                                                  <FooterTemplate>
                                                                                      <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                                                                  </FooterTemplate>
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("pValorBono") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Estado" SortExpression="pAplica">
                                                                                  <EditItemTemplate>
                                                                                      <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("pEstado") %>' />
                                                                                  </EditItemTemplate>
                                                                                  <FooterTemplate>
                                                                                      <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                                  </FooterTemplate>
                                                                                  <ItemTemplate>
                                                                                      <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("pEstado") %>' Enabled="false" />
                                                                                  </ItemTemplate>
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Usuario Modifica">
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("pUsuActualiza") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Fecha Actualizacion">
                                                                                  <ItemTemplate>
                                                                                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("pFecActualiza") %>'></asp:Label>
                                                                                  </ItemTemplate>
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Editar Fila">
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
                                                                                  <ItemStyle HorizontalAlign="Center" />
                                                                              </asp:TemplateField>
                                                                          </Columns>
                                                                          <PagerStyle BackColor="White" Height="2px" HorizontalAlign="Center" />
                                                                          <SelectedRowStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="#333333" />
                                                                          <HeaderStyle BackColor="#326394" Font-Bold="True" Font-Size="Small" ForeColor="White" />
                                                                          <AlternatingRowStyle BackColor="#F2F2F2" />
                                                                      </asp:GridView>
                                                                  </td>
                                                                  <td colspan="9">&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                  <td colspan="7" style="height: 10px">&nbsp;</td>
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

    </asp:UpdatePanel>

       

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">

        

</asp:Content>
