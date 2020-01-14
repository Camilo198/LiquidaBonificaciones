﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="Novedades.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Proceso.Novedades" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 304px;
        }
        .auto-style5 {
            width: 332px;
        }
        .auto-style9 {
            width: 734px;
        }
        .auto-style10 {
            width: 711px;
        }
    </style>
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
            <%--<td class="CuadranteBotonImagen">
                <asp:ImageButton ID="imgBtnEliminar" runat="server" ImageUrl="~/MarcaVisual/iconos/borrar.png" Width="16px"
                    ToolTip="Eliminar" OnClick="imgBtnEliminar_Click" />
                <asp:ConfirmButtonExtender ID="cbeEliminar" runat="server" TargetControlID="imgBtnEliminar"
                    ConfirmText="Esta seguro de eliminar el registro?">
                </asp:ConfirmButtonExtender>
            </td>--%>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="upContenido" runat="server">
        <ContentTemplate>
            <table style="width: 100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="BarraSubTitulo">
                        Modificación del cliente
                    </td>
                </tr>
                <tr>
                    <td class="SeparadorSubTitulo">
                    </td>
                </tr>
            </table>
            <table style="width: 100%" class="ColorContenedorDatos" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 10px" colspan="3">
                    </td>
                </tr>
                <tr>
                    <td style="width: 10px">
                    </td>
                    <td>
                        <asp:Panel ID="pnlCliente" runat="server" ScrollBars="Auto" Height="100%" Width="1020px">
                            <asp:Panel ID="pnlDatos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">
                                            Titular del Contrato
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lblContrato" runat="server" Text="Contrato:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbContrato" runat="server" CssClass="BordeControles" MaxLength="10"
                                                Width="110px" ValidationGroup="1" AutoPostBack="true" OnTextChanged="txbContrato_TextChanged"></asp:TextBox>
                                            <asp:TextBox ID="txbDigito" runat="server" CssClass="BordeControles" MaxLength="1"
                                                Width="10px" Enabled="False"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revContrato" runat="server" ControlToValidate="txbContrato"
                                                ErrorMessage="Formato Incorrecto!!!" ForeColor="Red" ValidationExpression="^\d+$"
                                                ValidationGroup="1">*</asp:RegularExpressionValidator>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                                FilterType="Numbers" TargetControlID="txbContrato">
                                            </asp:FilteredTextBoxExtender>
                                            <asp:ValidatorCalloutExtender ID="vceContrato" runat="server" Enabled="True" TargetControlID="revContrato"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="Left"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                            <asp:RequiredFieldValidator ID="rfvContrato" runat="server" ControlToValidate="txbContrato"
                                                ErrorMessage="Favor digitar el Contrato!" ForeColor="Red" SetFocusOnError="true"
                                                Text="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceContrato1" runat="server" Enabled="True" TargetControlID="rfvContrato"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="Left"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td colspan="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbNombreCliente" runat="server" Text="Nombre del Cliente:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbNombreCliente" runat="server" CssClass="BordeControles" Width="220px"
                                                ValidationGroup="1" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td colspan="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbTipoIdentificacionC" runat="server" Text="Tipo de Identificación:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:DropDownList ID="ddlTipoIdentificacionC" runat="server" CssClass="BordeListas"
                                                ValidationGroup="1" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbIdentificacionC" runat="server" Text="Número de Identificación:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbIdentificacionC" runat="server" CssClass="BordeControles" MaxLength="50"
                                                ValidationGroup="1" Width="130px" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>
                                    </tr>
                                          <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbEstadoCont" runat="server" Text="Estado del Contrato:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbEstadoCont" runat="server" CssClass="BordeControles" MaxLength="17"
                                                Width="130px" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbTipoCliente" runat="server" Text="Tipo de Cliente:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbTipoCliente" runat="server" CssClass="BordeControles" MaxLength="17"
                                                Width="130px" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="rceEsquinasRedondas" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlDatos" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                            <br />
                            <asp:Panel ID="pnlBanco" CssClass="PanelBordesRedondos" runat="server" Width="99%"
                                Enabled="False">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">
                                            Datos Débito Automático
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbBanco" runat="server" Text="Entidad Bancaria:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="auto-style10">
                                            <asp:DropDownList ID="ddlBanco" runat="server" CssClass="BordeListas" ValidationGroup="1">
                                            </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="rfvBanco" runat="server" ErrorMessage="Favor seleccionar la entidad bancaria!"
                                                ForeColor="Red" ControlToValidate="ddlBanco" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceBanco" runat="server" Enabled="True" TargetControlID="rfvBanco"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                         <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="Label1" runat="server" Text="Débito a partir de:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                              <asp:DropDownList ID="ddlFechaDebito" runat="server" CssClass="BordeListas" ValidationGroup="1">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvfechadebito" runat="server" ErrorMessage="Favor seleccionar Banco!"
                                                ForeColor="Red" ControlToValidate="ddlFechaDebito" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vcfechadebito" runat="server" Enabled="True" TargetControlID="rfvfechadebito"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbTipoCuenta" runat="server" Text="Tipo de Cuenta:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="auto-style10">
                                            <asp:DropDownList ID="ddlTipoCuenta" runat="server" CssClass="BordeListas" ValidationGroup="1">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvTipoCuenta" runat="server" ErrorMessage="Favor seleccionar la entidad bancaria!"
                                                ForeColor="Red" ControlToValidate="ddlTipoCuenta" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceTipoCuenta" runat="server" Enabled="True" TargetControlID="rfvTipoCuenta"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbNumCuenta" runat="server" Text="Número de Cuenta:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbNumCuenta" runat="server" CssClass="BordeControles" MaxLength="16"
                                                ValidationGroup="1" Width="130px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revNumCuenta" runat="server" ControlToValidate="txbNumCuenta"
                                                ErrorMessage="Formato Incorrecto!!!" ForeColor="Red" ValidationExpression="^\d+$"
                                                ValidationGroup="1">*</asp:RegularExpressionValidator>
                                            <asp:ValidatorCalloutExtender ID="vceNumCuenta" runat="server" Enabled="True" TargetControlID="revNumCuenta"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="Left"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                            <asp:RequiredFieldValidator ID="rfvNumCuenta" runat="server" ControlToValidate="txbNumCuenta"
                                                ErrorMessage="Favor digitar la Cuenta!" ForeColor="Red" SetFocusOnError="true"
                                                Text="*" ValidationGroup="1">
                                            </asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceNumCuenta1" runat="server" Enabled="True" TargetControlID="rfvNumCuenta"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="Left"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                             <asp:FilteredTextBoxExtender ID="ftbNumCuenta" runat="server" 
                                                FilterType="Numbers" TargetControlID="txbNumCuenta">
                                            </asp:FilteredTextBoxExtender>
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>
                                    </tr>
                        
                                    
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbEstadoD" runat="server" Text="Estado Débito:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="auto-style10">
                                            <asp:DropDownList ID="ddlEstadoD" runat="server" AutoPostBack="true" CssClass="BordeListas" ValidationGroup="1" OnSelectedIndexChanged="ddlEstadoD_SelectedIndexChanged">
                                            </asp:DropDownList>
                                                 <asp:RequiredFieldValidator ID="rfvEstadoD" runat="server" ErrorMessage="Favor seleccionar el estado del debito!"
                                                ForeColor="Red" ControlToValidate="ddlEstadoD" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceEstadoD" runat="server" Enabled="True" TargetControlID="rfvEstadoD"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            
                                            <asp:Label ID="lblFormatoIngreso" runat="server" Text="Formato Ingreso:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style5">
                                                 <asp:DropDownList ID="ddlFormaDebito" runat="server" CssClass="BordeListas" ValidationGroup="1">
                                            </asp:DropDownList>
                                                   <asp:RequiredFieldValidator ID="rfvFormaDebito" runat="server" ErrorMessage="Favor seleccionar el formato de ingreso!"
                                                ForeColor="Red" ControlToValidate="ddlFormaDebito" InitialValue="0" ValidationGroup="1"
                                                Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceFormaDebito" runat="server" Enabled="True" TargetControlID="rfvFormaDebito"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="BottomLeft"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>
                                    </tr>
                                  
                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label Visible="false" ID="lbFormaDebito" runat="server" Text="Formato Cancelación:"></asp:Label>
                                            

                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style10">
                                            <asp:DropDownList ID="ddlCancelación" Visible="false" runat="server" CssClass="BordeListas" ValidationGroup="1">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="Label2" runat="server" Text="Cuenta de Tercero?:"></asp:Label>
                                            <%--<asp:Label ID="lbNotificarCelular" runat="server" Text="Notificar Celular?:"></asp:Label>--%>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:CheckBox ID="chbTercero" runat="server" AutoPostBack="true" OnCheckedChanged="chbTercero_CheckedChanged" />
                                            <%--<asp:CheckBox ID="chbNotificarCelular" runat="server" AutoPostBack="true" Checked="True" />--%>

                                        </td>
                                        <td class="EspaciadoFinal"></td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblSuspender" Visible="false" runat="server" Text="Suspender Temporalmente?:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="auto-style10">
                                            <asp:CheckBox ID="chbSuspender" Visible="false" runat="server" AutoPostBack="true" OnCheckedChanged="chbSuspender_CheckedChanged" />
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                    
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>
                                    </tr>
                                       <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbFechaInicio" Visible="false" runat="server" Text="Fecha Inicio:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="auto-style10">
                                            <asp:TextBox  Visible="false" ID="txbFechaInicialSuspesion" runat="server" CssClass="FuenteDDL" 
                                                TabIndex="2" ValidationGroup="1" Width="85px"></asp:TextBox>
                                            <asp:ImageButton  Visible="false"  ID="imgBtnFechaInicial" runat="server" ImageAlign="Middle" 
                                                ImageUrl="~/MarcaVisual/iconos/calendario.png" Width="20px" />
                                            <asp:CalendarExtender ID="ceFechaInicial" runat="server" Enabled="True" 
                                                Format="dd/MM/yyyy" PopupButtonID="imgBtnFechaInicial" 
                                                TargetControlID="txbFechaInicialSuspesion">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="meeFechaInicial" runat="server" 
                                                InputDirection="LeftToRight" Mask="99/99/9999" MaskType="Date" 
                                                TargetControlID="txbFechaInicialSuspesion" UserDateFormat="DayMonthYear">
                                            </asp:MaskedEditExtender>
                                       
                                       
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label  Visible="false"  ID="lbFechaFin" runat="server" Text="Fecha Finalización:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                            <asp:TextBox  Visible="false" ID="txbFechaFinSuspension" runat="server" CssClass="FuenteDDL" TabIndex="3" 
                                                ValidationGroup="1" Width="85px"></asp:TextBox>
                                            <asp:ImageButton  Visible="false" ID="imgBtnFechaFin" runat="server" ImageAlign="Middle" 
                                                ImageUrl="~/MarcaVisual/iconos/calendario.png" Width="20px" />
                                            <asp:CalendarExtender ID="ceFechaFin" runat="server" Enabled="True" 
                                                Format="dd/MM/yyyy" PopupButtonID="imgBtnFechaFin" 
                                                TargetControlID="txbFechaFinSuspension">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="meeFechaFin" runat="server" 
                                                InputDirection="LeftToRight" Mask="99/99/9999" MaskType="Date" 
                                                TargetControlID="txbFechaFinSuspension" UserDateFormat="DayMonthYear">
                                            </asp:MaskedEditExtender>
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>                                        
                                    </tr>

                                
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="rceBanco" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlBanco" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                            <br />
                            <asp:Panel ID="pnlTercero" CssClass="PanelBordesRedondos" runat="server" Width="99%"
                                Visible="False">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">
                                            Titular de la Cuenta
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbNombreTercero" runat="server" Text="Nombre del Tercero:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbNombreTercero" runat="server" CssClass="BordeControles" Width="220px"
                                                ValidationGroup="1" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvNombreTercero" runat="server" ErrorMessage="Favor digitar el Nombre del Titular de la Cuenta!"
                                                ForeColor="Red" ControlToValidate="txbNombreTercero" ValidationGroup="1" Text="*"
                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceNombreTercero" runat="server" Enabled="True"
                                                TargetControlID="rfvNombreTercero" WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png"
                                                PopupPosition="Left" HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td colspan="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbTipoIdentificacionT" runat="server" Text="Tipo de Identificación:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:DropDownList ID="ddlTipoIdentificacionT" runat="server" CssClass="BordeListas"
                                                ValidationGroup="1">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lbIdentificacionT" runat="server" Text="Número de Identificación:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EspaciadoCeldaControl">
                                            <asp:TextBox ID="txbIdentificacionT" runat="server" CssClass="BordeControles" MaxLength="50"
                                                ValidationGroup="1" Width="130px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revIdentificacionT" runat="server" ControlToValidate="txbIdentificacionT"
                                                ErrorMessage="Formato Incorrecto!!!" ForeColor="Red" ValidationExpression="^\d+$"
                                                ValidationGroup="1">*</asp:RegularExpressionValidator>
                                            <asp:ValidatorCalloutExtender ID="vceIdentificacionT" runat="server" Enabled="True"
                                                TargetControlID="revIdentificacionT" WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png"
                                                PopupPosition="Left" HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                            <asp:RequiredFieldValidator ID="rfvIdentificacionT" runat="server" ControlToValidate="txbIdentificacionT"
                                                ErrorMessage="Favor digitar la Identificación!" ForeColor="Red" SetFocusOnError="true"
                                                Text="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="vceIdentificacionT1" runat="server" Enabled="True"
                                                TargetControlID="rfvIdentificacionT" WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png"
                                                PopupPosition="Left" HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                                   <asp:FilteredTextBoxExtender ID="ftbIdentificacionT" runat="server" 
                                                FilterType="Numbers" TargetControlID="txbIdentificacionT">
                                            </asp:FilteredTextBoxExtender>
                                        </td>
                                        <td class="EspaciadoFinal">
                                        </td>
                                    </tr>
                                 
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="recTercero" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlTercero" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                        
                          <br />
                                    <asp:Panel ID="pnlMovimientos" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">Movimientos
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9"></td>
                                    </tr>

                                    <tr>
                                        <td class="EspaciadoInicial"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblFechaInicioTransaccion" runat="server" Text="Fecha Inicio Transacción:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="txbFechaInicioTransaccion" Enabled="false" runat="server" CssClass="FuenteDDL" TabIndex="2"
                                                ValidationGroup="5" Width="85px"></asp:TextBox>
                                            <asp:ImageButton ID="imgFechaInicioTransaccion" Enabled="false" runat="server" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/calendario.png"
                                                Width="20px" />
                                            <asp:CalendarExtender ID="ceeFechaInicioTransaccion" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                PopupButtonID="imgFechaInicioTransaccion" TargetControlID="txbFechaInicioTransaccion">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="meeFechaInicioTransaccion" runat="server" InputDirection="LeftToRight"
                                                Mask="99/99/9999" MaskType="Date" TargetControlID="txbFechaInicioTransaccion" UserDateFormat="DayMonthYear">
                                            </asp:MaskedEditExtender>
       
                                        </td>

                                        <td class="auto-style1"></td>
                                        <td style="width: 20%" class="EstiloEtiquetas80">
                                            <asp:Label ID="lblFechaFinTransaccion" runat="server" Text="Fecha Fin Transacción:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio"></td>
                                           <td>
                                            <asp:TextBox ID="txbFechaFinTransaccion" runat="server" Enabled="false" CssClass="FuenteDDL" TabIndex="2"
                                                ValidationGroup="5" Width="85px"></asp:TextBox>
                                            <asp:ImageButton ID="imgFechaFinTransaccion" Enabled="false" runat="server" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/calendario.png"
                                                Width="20px" />


                                            <asp:CalendarExtender ID="ceeFechaFinTransaccion" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                PopupButtonID="imgFechaFinTransaccion" TargetControlID="txbFechaFinTransaccion">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="meeFechaFinTransaccion" runat="server" InputDirection="LeftToRight"
                                                Mask="99/99/9999" MaskType="Date" TargetControlID="txbFechaFinTransaccion" UserDateFormat="DayMonthYear">
                                            </asp:MaskedEditExtender>
                                       <%--     <asp:RequiredFieldValidator ID="rfvFechaFinTransaccion" runat="server" ControlToValidate="txbFechaFinTransaccion"
                                                ErrorMessage="Favor digitar o seleccionar del calendario la fecha final!" ForeColor="Red"
                                                SetFocusOnError="true" Text="*" ValidationGroup="5">
                                            </asp:RequiredFieldValidator>--%>
                                  <%--          <asp:ValidatorCalloutExtender ID="vceFechaFinTransaccion" runat="server" Enabled="True"
                                                HighlightCssClass="Resaltar" TargetControlID="rfvFechaFinTransaccion">
                                            </asp:ValidatorCalloutExtender>--%>
                                               
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                               
                                                <asp:ImageButton ID="imgBuscar" Enabled="false" AutoPostBack="true" runat="server" ImageAlign="Middle" ImageUrl="~/MarcaVisual/iconos/buscar.png"
                                                Width="20px" ValidationGroup="5"  OnClick="imgBuscar_Click"/>

                                        </td
                                        <td class="EspaciadoFinal"></td>
                                                <td class="EspaciadoFinal">
                                                   

                                                </td>
                                    </tr>

                                    
                                         <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                     <tr>
                                        <td style="height: 10px" colspan="9"></td>
                                    </tr>
                                    

                                    <tr>
                                        <td colspan="9">
                                            <asp:GridView ID="gvHistorial" runat="server" Width="970px" AllowSorting="True" BorderColor="#D0DEF0"
                                                BorderStyle="Solid" BorderWidth="1px" GridLines="Horizontal" AutoGenerateColumns="False"
                                                Font-Size="XX-Small"  AllowPaging="True"
                                                OnPageIndexChanging="gvHistorial_PageIndexChanging" PageSize="15">
                                                <Columns>
                                                    <asp:BoundField DataField="pNumeroIdentificacion" HeaderText="Documento" />
                                                    <asp:BoundField DataField="pNumeroCuenta" HeaderText="Cuenta" />
                                                    <asp:BoundField DataField="pTipoCuenta" HeaderText="Tipo Cuenta" />
                                                    <asp:BoundField DataField="pNombreBancoDebita" HeaderText="Banco Convenio" />
                                                    <asp:BoundField DataField="pTipoTransferencia" HeaderText="Tipo Trans" />
                                                    <asp:BoundField DataField="pFecha" HeaderText="Fecha Transacción" DataFormatString="{0:dd-MM-yyyy}" />
                                                    <asp:BoundField DataField="pValor" HeaderText="Valor" />
                                                    <asp:BoundField DataField="pEstado" HeaderText="Estado Trans" />
                                                    <asp:BoundField DataField="pCausal" HeaderText="Causal" />
                                                    <asp:BoundField DataField="pFechaProceso" HeaderText="Fecha Proceso" DataFormatString="{0:dd-MM-yyyy}" />
                                                    <asp:BoundField DataField="pNombreBanco" HeaderText="Banco del Cliente" />
                                                    <asp:BoundField DataField="pUsuario" HeaderText="Usuario" />
                                                    <asp:BoundField DataField="pIdTipoCausal" HeaderText="Devolución"/>
                                                    <asp:BoundField DataField="pFechaGiro" HeaderText="Fecha Giro" DataFormatString="{0:dd-MM-yyyy}" />
                                                </Columns>
                                                <HeaderStyle BackColor="#C5C5C6" />
                                                <RowStyle HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1pt" />
                                                <PagerStyle BackColor="#C5C5C6" Font-Strikeout="False" Font-Underline="False" />
                                                <RowStyle BackColor="#F0F0F0" BorderColor="#D0DEF0" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>

                            </asp:Panel>
                             
                            <asp:RoundedCornersExtender ID="recMovimientos" Radius="3" BorderColor="181, 198, 214"
                                    TargetControlID="pnlMovimientos" runat="server" Enabled="True">
                                </asp:RoundedCornersExtender>
                            <br />

                            <asp:Panel ID="pnlCesion" CssClass="PanelBordesRedondos" runat="server" Width="99%"
                                Visible="False">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="LetraLeyendaColor" colspan="9">
                                             Datos de la cesión del cliente nuevo
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                      
                                            <td colspan="9">
                                            <asp:GridView ID="gvCesion" runat="server" Width="880px" AllowSorting="True" BorderColor="#D0DEF0"
                                                BorderStyle="Solid" BorderWidth="1px" GridLines="Horizontal" AutoGenerateColumns="False"
                                                Font-Size="XX-Small" >
                                                <Columns>
                                                    <asp:BoundField DataField="TIPO_IDENTIFICACION" HeaderText="TipoDocumento" />
                                                    <asp:BoundField DataField="ID_IDENTIFICACION" HeaderText="NumeroDocumento" DataFormatString="{0:N}"/>
                                                    <asp:BoundField DataField="NOMBRES" HeaderText="Nombre" />
                                                    <asp:BoundField DataField="CELULAR" HeaderText="Celular" />
                                                    <asp:BoundField DataField="CORREO" HeaderText="Email" />
                                                </Columns>
                                                <HeaderStyle BackColor="#C5C5C6" />
                                                <RowStyle HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1pt" />
                                                <PagerStyle BackColor="#C5C5C6" Font-Strikeout="False" Font-Underline="False" />
                                                <RowStyle BackColor="#F0F0F0" BorderColor="#D0DEF0" />
                                            </asp:GridView>
                                        </td>
                          
                                  
                                        
                                    </tr>
                                 
                                    <tr>
                                        <td style="height: 10px" colspan="9">
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="recCesion" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlCesion" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                            </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlBusquedaContrato" CssClass="ContenedorDatos" runat="server" Width="600px"
                Height="400px" Style="display:none;">
                <table style="width: 100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="BarraSubTitulo">
                            B&uacute;squeda
                        </td>
                    </tr>
                    <tr>
                        <td class="SeparadorSubTitulo">
                        </td>
                    </tr>
                </table>
                <table style="width: 100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="EspaciadoInicial">
                        </td>
                        <td>
                            <asp:Panel ID="pnlContratoB" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbContratoB" runat="server" Text="Contrato:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txbContratoB" runat="server" CssClass="BordeControles" MaxLength="100"
                                                Width="150px" ValidationGroup="3"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revContratoB" runat="server" ControlToValidate="txbContratoB"
                                                ErrorMessage="Formato Incorrecto!!!" ForeColor="Red" ValidationExpression="^\d+$"
                                                ValidationGroup="3">*</asp:RegularExpressionValidator>
                                            <asp:ValidatorCalloutExtender ID="vceContratoB" runat="server" Enabled="True" TargetControlID="revContratoB"
                                                WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png" PopupPosition="Left"
                                                HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            <asp:Label ID="lbIdentClienteB" runat="server" Text="Identificación Cliente:"></asp:Label>
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txbIdentClienteB" runat="server" CssClass="BordeControles" MaxLength="100"
                                                Width="150px" ValidationGroup="3"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revIdentClienteB" runat="server" ControlToValidate="txbIdentClienteB"
                                                ErrorMessage="Formato Incorrecto!!!" ForeColor="Red" ValidationExpression="^\d+$"
                                                ValidationGroup="3">*</asp:RegularExpressionValidator>
                                            <asp:ValidatorCalloutExtender ID="vceIdentClienteB" runat="server" Enabled="True"
                                                TargetControlID="revIdentClienteB" WarningIconImageUrl="~/MarcaVisual/iconos/advertencia.png"
                                                PopupPosition="Left" HighlightCssClass="Resaltar">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="rceEsquinasRedondasB" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlContratoB" runat="server" Enabled="True">
                            </asp:RoundedCornersExtender>
                        </td>
                        <td style="width: 130px; text-align: center; vertical-align: bottom">
                       
                        </td>
                        <td class="EspaciadoInicial">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="SeparadorHorizontal">
                        </td>
                    </tr>
                </table>
                <table style="width: 100%" cellspacing="2" cellpadding="0">
                    <tr>
                        <td colspan="2">
                         
                        </td>
                    </tr>
                </table>
                <div class="BarraEstado">
                    <table class="EstiloBarraEstado">
                        <tr>
                            <td>
                                <asp:Label ID="lbEstadoBusquedaCliente" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
    
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
        <Triggers>
            <asp:PostBackTrigger ControlID="txbContrato" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
    <asp:Label ID="lbEstado" runat="server"></asp:Label>
</asp:Content>
