<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="MontosMinimosPlanes.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Parametrizacion.MontosMinimosPlanes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
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
                    <td style="width: 10px"></td>
                    <td>
                        <asp:Panel ID="pnlCliente" runat="server" ScrollBars="Auto" Height="100%" Width="900px">

                            <asp:Panel ID="pnlDatos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">MontosMinimosPlanes</td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                                          <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80">                                      



                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                       <td class="EstiloEtiquetas80">
                                           Cantidad de Planes</td>
                                          <td class="EspaciadoIntermedio"></td>
                                       
                                        <td class="EspaciadoIntermedio"></td>
                                   
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                     <tr>
                                         <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="height: 10px" colspan="9">
                                            <asp:ImageButton ID="ImgBtnAddCantidadPlanes" runat="server"  ImageUrl="~/MarcaVisual/iconos/agregar.png" OnClick="ImgBtnAddCantidadPlanes_Click" />Añadir Nueva Bonificacion Especial

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td>
 <asp:GridView ID="GridViewBeCantidadPlanes" runat="server" AllowSorting="True" AutoGenerateColumns="False" BorderColor="#D0DEF0" BorderStyle="Solid" BorderWidth="1px" 
                                                CssClass="EstiloEtiquetas81" Font-Size="Small" GridLines="Horizontal" HorizontalAlign="Left" 
                                                OnRowDeleting="GridViewBeCantidadPlanes_RowDeleting" OnRowEditing="GridViewBeCantidadPlanes_RowEditing" 
                                                  OnRowUpdating="GridViewBeCantidadPlanes_RowUpdating" Width="500px" 
                                                OnRowCancelingEdit="GridViewBeCantidadPlanes_RowCancelingEdit" OnRowCommand="GridViewBeCantidadPlanes_RowCommand" ShowHeaderWhenEmpty="True">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label0" runat="server" Text='<%# Bind("pId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="OcultarControles" />
                                                        <ItemStyle CssClass="OcultarControles" HorizontalAlign="Center" />
                                                        <FooterStyle CssClass="OcultarControles" />
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
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Aplica" SortExpression="pAplica">
                                                        <EditItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("pAplica") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("pAplica") %>' Enabled="false" />
                                                        </ItemTemplate>
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
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Editar Fila">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnEdit" runat="server" CommandName="Edit" Height="20px" ImageUrl="~/MarcaVisual/iconos/Editar.png" ToolTip="Editar" Width="20px" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:ImageButton ID="ImgBtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/MarcaVisual/iconos/borrar.png" ToolTip="Cancelar" />
                                                            <asp:ImageButton ID="ImgBtnUpdate" runat="server" CommandName="Update" ImageUrl="~/MarcaVisual/iconos/Aceptar.png" ToolTip="Actualizar" />
                                                            <asp:ImageButton ID="ImgBtnDelete" runat="server" CommandName="Delete" ImageUrl="~/MarcaVisual/iconos/delete.png" ToolTip="Borrar"/>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="ImgBtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/MarcaVisual/iconos/borrar.png" ToolTip="Cancelar" />
                                                            <asp:ImageButton ID="ImgBtnInsert" runat="server" CommandName="Insert" ImageUrl="~/MarcaVisual/iconos/Guardar.png" ToolTip="Insertar" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                   <PagerStyle BackColor="White" Height="2px"
                                                    HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#326394" Font-Bold="True" Font-Size="Small" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#F2F2F2" />
                                            </asp:GridView>

                                        </td>
                                        <td colspan="9">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="7">&nbsp;</td>
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
