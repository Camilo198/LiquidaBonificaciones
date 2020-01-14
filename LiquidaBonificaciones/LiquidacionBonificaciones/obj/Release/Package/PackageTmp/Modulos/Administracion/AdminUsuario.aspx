<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="AdminUsuario.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Administracion.AdminUsuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBarraHerramientas" runat="server">
    <asp:UpdatePanel ID="UpdatePanelHerramientas" runat="server">
        <ContentTemplate>
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
                </tr>
            </table>
            <asp:UpdateProgress ID="UpdateProgressPanelHerramientas" runat="server" AssociatedUpdatePanelID="UpdatePanelHerramientas">
                <ProgressTemplate>
                    <div class="contenedor">
                        <div class="centrado">
                            <div class="contenido">
                                <asp:Image ID="ImagePanelHerramientas" runat="server" ImageUrl="~/MarcaVisual/iconos/loading.gif"
                                    Height="20px" Width="100px" ImageAlign="Middle" />
                            </div>
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <script type="text/javascript" language="javascript">
        //CERRAR SESION DESPUES DE X TIEMPO
        //******************************************************
        var IDLE_TIMEOUT = 900; //seconds 900
        var _idleSecondsCounter = 0;
        document.onclick = function () {
            _idleSecondsCounter = 0;
        };
        document.onmousemove = function () {
            _idleSecondsCounter = 0;
        };
        document.onkeypress = function () {
            _idleSecondsCounter = 0;
        };
        window.setInterval(CheckIdleTime, 1000);

        function CheckIdleTime() {
            _idleSecondsCounter++;
            if ('<%= Session["IdConcesionario"] %>' != "0") {
                if (_idleSecondsCounter >= IDLE_TIMEOUT) {
                    alert("Tiempo de sesión ha expirado!");
                    document.location.href = "<%=ConfigurationManager.AppSettings["loginChevy"].ToString() %>";
                }
            }
        }

        //******************************************************
    </script>
    
    <asp:UpdatePanel ID="upContenido" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td class="BarraSubTitulo">Administración Usuarios
                    </td>
                </tr>
                <tr>
                    <td class="SeparadorSubTitulo"></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="ColorContenedorDatos" style="width: 100%">
                <tr>
                    <td colspan="3" style="height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 10px"></td>
                    <td>
                        <asp:Panel ID="pnlLogs" runat="server" Height="620px" ScrollBars="Auto" Width="1000px">
                            <asp:Panel ID="pnlDatos" runat="server" CssClass="PanelBordesRedondos" Width="99%">
                                <table cellpadding="0" cellspacing="2" style="width: 100%">
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>
          
                                    <tr>
                                        <td style="height: 20px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px; font-family: Arial, Verdana; font-size: 9pt;" colspan="5">&nbsp <b>Administrar Usuario</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 20px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">&nbsp;
                                        </td>
                                        <td class="EstiloEtiquetas125Right">
                                            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">&nbsp;
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUsuarioChevy" runat="server" CssClass="BordeControles" Width="203px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvUsuarioChevy" runat="server" ForeColor="Red" ControlToValidate="ddlUsuarioChevy"
                                                InitialValue="0" ValidationGroup="1" Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <%--<asp:TextBox ID="txbUsuario" runat="server" ValidationGroup="1" Width="200px" CssClass="BordeControles"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ForeColor="Red" ControlToValidate="txbUsuario"
                                                ValidationGroup="1" Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                             
         
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">&nbsp;
                                        </td>
                                        <td class="EstiloEtiquetas125Right">
                                            <asp:Label ID="lblPerfil" runat="server" Text="Perfil:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">&nbsp;
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="BordeControles" Width="203px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvPerfil" runat="server" ForeColor="Red" ControlToValidate="ddlPerfil"
                                                InitialValue="0" ValidationGroup="1" Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">&nbsp;
                                        </td>
                                        <td class="EstiloEtiquetas125Right">
                                            <asp:Label ID="lblHabilita" runat="server" Text="Habilita:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">&nbsp;
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chbHabilita" runat="server" />
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">&nbsp;
                                        </td>
                                        <td colspan="3">
                                            <asp:GridView ID="gvUsuario" runat="server" AutoGenerateColumns="False" Width="450px"
                                                AllowSorting="True" BorderColor="#D0DEF0" BorderStyle="Solid" BorderWidth="1px"
                                                GridLines="Horizontal" OnRowCommand="gvUsuario_RowCommand" CssClass="EstiloEtiquetas100">
                                                <Columns>
                                                    <asp:ButtonField ButtonType="Image" CommandName="Editar" ImageUrl="~/MarcaVisual/iconos/editar.png"
                                                        Text="Editar">
                                                        <ItemStyle Width="30px" />
                                                        <ControlStyle Width="16px" />
                                                    </asp:ButtonField>
                                                    <asp:ButtonField ButtonType="Image" CommandName="Eliminar" ImageUrl="~/MarcaVisual/iconos/borrar.png"
                                                        Text="Eliminar">
                                                        <ItemStyle Width="30px" />
                                                        <ControlStyle Width="16px" />
                                                    </asp:ButtonField>
                                                    <asp:BoundField HeaderText="ID" DataField="pId" ItemStyle-CssClass="OcultarControles"
                                                        HeaderStyle-CssClass="OcultarControles">
                                                        <HeaderStyle CssClass="OcultarControles" />
                                                        <ItemStyle CssClass="OcultarControles" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pUsuario" HeaderText="Usuario">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center"/>
                                                    </asp:BoundField>
                                                           <asp:BoundField HeaderText="Idperfil" DataField="pIdPerfil" ItemStyle-CssClass="OcultarControles"
                                                        HeaderStyle-CssClass="OcultarControles">
                                                        <HeaderStyle CssClass="OcultarControles" />
                                                        <ItemStyle CssClass="OcultarControles" />
                                                    </asp:BoundField>
                                                      <asp:BoundField DataField="pPerfil" HeaderText="Perfil">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center"/>
                                                    </asp:BoundField>
                                 
                                                    <asp:CheckBoxField HeaderText="Habilita" DataField="pHabilita">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center"/>
                                                    </asp:CheckBoxField>
                                      
                                           
                                                </Columns>
                                                <HeaderStyle BackColor="#C5C5C6" />
                                                <PagerStyle BackColor="#C5C5C6" Font-Strikeout="False" Font-Underline="False" />
                                                <RowStyle BackColor="#F0F0F0" BorderColor="#D0DEF0" />
                                            </asp:GridView>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <ajax:RoundedCornersExtender ID="rceDatos" runat="server" BorderColor="181, 198, 214"
                                Enabled="True" Radius="3" TargetControlID="pnlDatos">
                            </ajax:RoundedCornersExtender>
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
</asp:Content>
