using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiquidacionBonificaciones.Conversiones
{
    public class FormateoCampos
    {
        public static string FormatoHTML(String Palabra)
        {
            if (string.IsNullOrEmpty(Palabra))
                return "";
            else
            {
                Palabra = Palabra.Replace("&#243;", "ó");
                Palabra = Palabra.Replace("&#241;", "ñ");
            }
            return Palabra;
        }
    }
}