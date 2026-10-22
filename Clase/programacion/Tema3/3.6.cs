using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");
            Console.WriteLine("2 - ejercicio 2");

            op = Console.ReadLine();

            switch (op) {
                case "0":
                    break;
                case "1":
                    ejercicio1();
                    break;
                case "2":
                    ejercicio2();
                    break;
            }
        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.6.1.cs"
      Crea un programa que permita convertir de millas a metros. El valor
      necesario para la conversión debe estar almacenado en una constante.
      */
    public static void ejercicio1() {
        Console.Write("Introduce el número de metros que quieres pasar a millas: ");
        int n = Convert.ToInt32(Console.ReadLine());

        const double METROS_POR_MILLA = 1609.344;
        double millas = n * METROS_POR_MILLA;

        Console.WriteLine("{0} metros equivalen a {1} millas", n, millas);
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.6.2.cs"
      Crea una enumeración para los meses del año, desde ENERO (con valor 1)
      hasta DICIEMBRE (con valor 12). Muestra el valor numérico correspondiente a
      OCTUBRE
      */
    enum meses { ENERO = 1, FEBRERO, MARZO, ABRIL, MAYO, JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE }
    public static void ejercicio2() {
        int valorOctubre = (int)meses.OCTUBRE;

        Console.WriteLine("El valor numérico de OCTUBRE es: {0}", valorOctubre);
    }
}
