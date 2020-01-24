<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="Parametrizacion.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Proceso.Parametrizacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBarraHerramientas" runat="server">
    <table align="left" cellpadding="0" cellspacing="0">
        <tr>
            <td class="CuadranteBotonImagen">
                <asp:ImageButton ID="imgBtnNuevo" runat="server" ImageUrl="~/MarcaVisual/iconos/nuevo.png"
                    Width="16px" ToolTip="Nuevo..." OnClick="imgBtnNuevo_Click" />
            </td>
            <td class="CuadranteBotonImagen">
                <asp:ImageButton ID="imgBtnGuardar" runat="server" ImageUrl="~/MarcaVisual/iconos/guardar.png"
                    Width="16px" ToolTip="Guardar" OnClick="imgBtnGuardar_Click" ValidationGroup="1" />
            </td>
            <td class="CuadranteBotonImagen">
                <asp:ImageButton ID="BtnCancelar" runat="server" ImageUrl="~/MarcaVisual/iconos/deshacer.png"
                    Width="16px" ToolTip="Cancelar" OnClick="BtnCancelar_Click" />
            </td>
        </tr>
    </table>
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
            <table style="width: 100%" class="ColorContenedorDatos" cellpadding="0" cellspacing="0">
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
                                        <td class="LetraLeyendaColor" colspan="9">Parametrización
                                        </td>
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
                                           <b> <asp:Label ID="lblEstado" runat="server" Text="Estado Liquidación:"></asp:Label><b/>
                                           <asp:Label ID="lblEstadoParametro" runat="server" ></asp:Label>
                                        </td>
                                          <td class="EspaciadoIntermedio"></td>
                                       
                                        <td class="EspaciadoIntermedio"></td>
                                   
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                     <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td>
                                          <asp:GridView ID="GvParametros" runat="server" AutoGenerateColumns="False"  
                                                CellPadding="0" GridLines="None" Height="117px" BorderColor="#DADADA"
                                                BorderWidth="1px" Font-Size="8pt"
                                                Width="764px">
                                               <FooterStyle BackColor="#326394" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#f9fcff" />
                                                <Columns>
                                                
                                                    <asp:BoundField DataField="pId" HeaderText="No">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="5px" />
                                                    </asp:BoundField>
                                                        <asp:BoundField HeaderText="Tipo" DataField="pTipo" ItemStyle-CssClass="OcultarControles"
                                                        HeaderStyle-CssClass="OcultarControles">
                                                        <HeaderStyle CssClass="OcultarControles" />
                                                        <ItemStyle CssClass="OcultarControles" />
                                                         <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" Width="5px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pParametro" HeaderText="Parametro" NullDisplayText="&quot; &quot;">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" Width="180px" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Valor" ItemStyle-HorizontalAlign="Center">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtValorEdi" runat="server" Text='<%# Bind("pValor") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtValor" runat="server" Text='<%# Bind("pValor") %>'></asp:TextBox>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="70px" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="pObservaciones" HeaderText="Observaciones" NullDisplayText="&quot; &quot;">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="200px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pUsuActualiza" HeaderText="Usu Actualiza" NullDisplayText="&quot; &quot;">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pFecActualiza" HeaderText="Fec Actualiza" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" NullDisplayText="&quot; &quot;">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                                    </asp:BoundField>

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
                            <asp:RoundedCornersExtender ID="rceEsquinasRedondas" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlDatos" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                            <br />


                        </asp:Panel>
                    </td>
                </tr>
            </table>
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
            <asp:HiddenField ID="HdAccion" runat="server" />
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
</asp:Content>

