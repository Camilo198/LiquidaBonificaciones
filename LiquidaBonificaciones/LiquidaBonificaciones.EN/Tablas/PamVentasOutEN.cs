using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LiquidaBonificaciones.EN.Tablas
{
   public class PamVentasOutEN
    {
    public String  Cupo {get;set;}
	public String Afiliado {get;set;}
	public String Contrato {get;set;}
	public Int32  CodOficina {get;set;}
	public String Oficina {get;set;}
	public DateTime FechaVenta {get;set;}
	public Double ValorPlan {get;set;}
	public Int32 CodVendedor {get;set;}
	public Double IdeVendedor {get;set;}
	public String nombreVendedor {get;set;}
	public String Tipo {get;set;}
	public Double PorcentajeInscripcion {get;set;}
	public Double ValorInscripcionSinIva {get;set;}
	public Double ValorPagoParcial {get;set;}
	public String AlturaDiferida {get;set;}
	public String TipoContrato {get;set;}
    public String EstadoCupo { get; set; }
	public String CarroAgil {get;set;}
	public String MarcaDiferida {get;set;}
	public Int32 CodigoDirector {get;set;}
	public Double IdeDirector {get;set;}
	public String NombreDirector {get;set;}
	public Double ValorIvaInscripcion {get;set;}
	public Double ValorTotaInscripcionConIva {get;set;}
	public String MarcaExcl {get;set;}
    public String LineaProducto { get; set; }
    public String UsuarioActualiza { get; set; }
    public String FechaActualiza { get; set; }
    }
}
