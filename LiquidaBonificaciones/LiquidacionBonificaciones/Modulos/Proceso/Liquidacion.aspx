<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="Liquidacion.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Proceso.Liquidacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 296px;
        }
    </style>

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
                    <td class="CuadranteBotonImagen"></td>
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


    <asp:UpdatePanel ID="upContenido" runat="server">
        <ContentTemplate>
            <table style="width: 100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="BarraSubTitulo">Liquidación Bonificacion
                    </td>
                </tr>
                <tr>
                    <td class="SeparadorSubTitulo"></td>
                </tr>
            </table>
            <table style="width: 100%" class="ColorContenedorDatos" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 10px" colspan="3"></td>
                </tr>
                <tr>
                    <td style="width: 10px"></td>
                    <td>
                        <asp:Panel ID="pnlLiquidacion" runat="server" ScrollBars="Auto" Height="100%" Width="900px">

                            <asp:Panel ID="pnlParametros" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="3">Parametros de Liquidación
                                     
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="5"></td>
                                    </tr>

                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td>
                                            <asp:GridView ID="gvParametros" runat="server" AutoGenerateColumns="False" Width="450px" Font-Size="Small"
                                                AllowSorting="True" BorderColor="#D0DEF0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                                GridLines="Horizontal" CssClass="EstiloEtiquetas81" OnSelectedIndexChanged="gvParametros_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Id" DataField="pId" ItemStyle-CssClass="OcultarControles"
                                                        HeaderStyle-CssClass="OcultarControles">
                                                        <HeaderStyle CssClass="OcultarControles" />
                                                        <ItemStyle CssClass="OcultarControles" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pParametro" HeaderText="Parametro">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pValor" HeaderText="Habilitado">
                                                        <HeaderStyle Width="60px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pAplican" HeaderText="Aplican">
                                                        <HeaderStyle Width="60px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
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
                            <asp:RoundedCornersExtender ID="rceMovimientos" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlParametros" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>

                            <br />
                            <asp:Panel ID="pnlProcesos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">Proceso Liquidación
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lblTipoProceso" runat="server" Text="Tipo de proceso:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5">
                                            <asp:DropDownList ID="ddlFormaLiquidacion" runat="server" CssClass="BordeListas" ValidationGroup="1" Height="16px" Width="129px">
                                                <asp:ListItem Value="0">[Seleccione]</asp:ListItem>
                                                <asp:ListItem Value="1">Simulación</asp:ListItem>
                                                <asp:ListItem Value="2">Liquidación</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvLiquidacion" runat="server" ErrorMessage="Favor seleccionar La forma de liquidación!"
                                                ForeColor="Red" ControlToValidate="ddlFormaLiquidacion" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceLiquidacion" runat="server" Enabled="True" TargetControlID="rfvLiquidacion"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblFechaInicio" runat="server" Text="Fecha de Inicio:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbFechaInicio" Enabled="false" runat="server" CssClass="BordeControles"
                                                ValidationGroup="1" Width="89px"></asp:TextBox>


                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblFechaFin" runat="server" Text="Fecha Fin:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbFechaFin" runat="server" Enabled="false" CssClass="BordeControles"
                                                ValidationGroup="1" Width="89px"></asp:TextBox>


                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>


                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">

                                            <asp:Label ID="lblCeremonia" runat="server" Text="Ceremonia de sueños:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">

                                            <asp:TextBox ID="txbCeremonia" runat="server" Enabled="false" CssClass="BordeControles"
                                                ValidationGroup="1" Width="89px"></asp:TextBox>

                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Button ID="btnSubirAsesores" runat="server" OnClick="btnSubirAsesores_Click" Text="Subir Asesores" ToolTip="Subir Asesores" ValidationGroup="1" />
                                            <asp:ImageButton ID="ImageButton1" runat="server" Enabled="false" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/usuario.png" Width="20px" />
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblEstado" runat="server" Text="Estado Liquidación:"></asp:Label>

                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:TextBox ID="txbEstado" runat="server" Enabled="false" CssClass="BordeControles"
                                                Width="89px"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblPeriodo" runat="server" Text="Periodo:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbPeriodo" runat="server" CssClass="BordeControles" Enabled="false" Width="89px"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Button ID="btnSubirVentas" runat="server" OnClick="btnSubirVentas_Click" Text="Subir Ventas" ToolTip="Subir Ventas" ValidationGroup="1" />
                                            <asp:ImageButton runat="server" Enabled="false" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/activar_sel.png" Width="20px" />
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"">
                                            <asp:Label ID="LabelVentasValidas" runat="server" Text="Ventas Validas"></asp:Label>
                                            <asp:TextBox ID="TextVentasValidas" runat="server" Width="89px"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblano" runat="server" Text="Año:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:TextBox ID="txbano" runat="server" CssClass="BordeControles" Enabled="false" Width="89px"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Button ID="btnLiquidar" runat="server" ValidationGroup="1" ToolTip="Liquidar" Text="Liquidar" OnClick="btnLiquidar_Click" />
                                            <asp:ImageButton ID="ImageButton2" Enabled="false" runat="server" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/herramientas.png" Width="20px" />
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Button ID="btnConfirmaLiquidacion" runat="server" OnClick="btnConfirmaLiquida_Click" Text="Confirmar Liquidación" ToolTip="Confirmar Liquidación" ValidationGroup="1" />
                                        </td>
                                        <td class="EspaciadoFinal">
                                            <asp:ImageButton ID="ImageButton3" runat="server" Enabled="false" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/aceptar.png" Width="20px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="rceBanco" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlProcesos" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                            <br />
                            <asp:Panel ID="pnlResumenProceso" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">Resumen Proceso
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lblVentas" runat="server" Text="Cantidad de ventas:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lblNVentas" runat="server" Text="0"></asp:Label>

                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl"></td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl"></td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>


                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl"></td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80"></td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl"></td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="RoundedCornersExtender1" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlResumenProceso" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
</asp:Content>

