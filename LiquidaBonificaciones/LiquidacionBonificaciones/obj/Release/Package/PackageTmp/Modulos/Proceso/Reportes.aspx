<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra/Sitio.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="LiquidacionBonificaciones.Modulos.Proceso.Reportes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCabecera" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 69px;
        }
        .auto-style2 {
            font-size: 9pt;
            text-align: left;
            vertical-align: middle;
            width: 69px;
        }
        .auto-style3
        {
            font-size: 8pt;
            text-align: left;
            vertical-align: middle;
            width: 92px;
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
                    <td class="BarraSubTitulo">Reportes Bonificaciones Pre
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
                        <asp:Panel ID="pnlRespuestasTransacciones" runat="server" ScrollBars="Auto" Height="100%" Width="900px">
                      
                                     <asp:Panel ID="pnlFiltros" CssClass="PanelBordesRedondos" runat="server" Width="99%">
                                <table style="width: 100%" cellpadding="0" cellspacing="2">
                                  

                               
                                  
                                    <tr>
                                        <td style="height: 10px" colspan="13">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="EspaciadoInicial">
                                            &nbsp;</td>
                                        <td class="auto-style3">
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                            &nbsp;</td>
                                        <td>
                                               &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                         <td class="EstiloEtiquetas125Right">
                                             &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td class="EstiloEtiquetas80">
                                            &nbsp;</td>
                                         <td class="auto-style2">
                                             &nbsp;</td>
                                         <td class="EstiloEtiquetas80">
                                             &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                            
                                        </td>
                                        
                                    </tr>
                                          <tr>
                                        <td style="height: 10px" colspan="13">
                                        </td>
                                    </tr>                    
                                
                                      <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="auto-style3">
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                         <td class="EstiloEtiquetas125Right">
                                             &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                               <asp:Button ID="btnInformes" runat="server" Height="33px" OnClick="btnInformes_Click" Text="Ir a mis informes" Width="137px" />
                                          </td>
                                        <td class="auto-style1">
                                            &nbsp;</td>
                                        <td class="EstiloEtiquetas80">
                                            
                                        </td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                        <td>
                                             
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 10px" colspan="13">
                                        </td>
                                    </tr>
                                         <tr>
                                        <td class="EspaciadoInicial">
                                        </td>
                                        <td class="auto-style3">
                                            
                                            &nbsp;</td>
                                        <td class="EspaciadoIntermedio">
                                        </td>
                                       <td class="EstiloEtiquetas80" colspan="9">
                                          
                                           &nbsp;</td>
                                        
                                                 <tr>
                                                     <td colspan="13" style="height: 10px"></td>
                                    </tr>
                                    
                                    </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="rceRutas" Radius="3" BorderColor="181, 198, 214"
                                TargetControlID="pnlFiltros" runat="server" Enabled="True">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBarraEstado" runat="server">
    <asp:Label ID="lbEstado" runat="server"></asp:Label>
</asp:Content>
