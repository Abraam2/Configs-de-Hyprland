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
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT4_4.1.5.1.cs"
      Crea un programa que contenga un array con los nombres de los meses
      del año. El usuario podrá elegir entre verlos en orden natural (de Enero a
      Diciembre) o en orden inverso (de Diciembre a Enero). Usa constantes para el
      valor máximo del array en ambos recorridos.
      */
    public static void ejercicio1() {
        string[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
        const int MAXIMO = 12;

        Console.WriteLine("1 - Ver los meses en orden natural");
        Console.WriteLine("2 - Ver los meses en orden inverso");
        Console.Write("Elige una opción: ");
        string respuesta = Console.ReadLine();

        switch (respuesta) {
            case "1":
                Console.Write("El órden normal de los meses es: ");
                for (int i = 0; i < MAXIMO; i++) {
                    Console.Write("{0} ", meses[i]);
                }
                Console.WriteLine("");
                break;
            case "2":
                Console.Write("El órden inverso de los meses es: ");
                for (int i = MAXIMO - 1; i >= 0; i--) {
                    Console.Write("{0} ", meses[i]);
                }
                Console.WriteLine("");
                break;
            default:
                Console.WriteLine("Opción incorrecta");
                break;
        }
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT4_4.1.5.2.cs"
      Crea una nueva versión del ejercicio 4.1.5.1, usando ".Length" en vez de
      una constante.
      */
    public static void ejercicio2() {
        string[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

        Console.WriteLine("1 - Ver los meses en orden natural");
        Console.WriteLine("2 - Ver los meses en orden inverso");
        Console.Write("Elige una opción: ");
        string respuesta = Console.ReadLine();

        switch (respuesta) {
            case "1":
                Console.Write("El órden normal de los meses es: ");
                for (int i = 0; i < datos.Length; i++) {
                    Console.Write("{0} ", meses[i]);
                }
                Console.WriteLine("");
                break;
            case "2":
                Console.Write("El órden inverso de los meses es: ");
                for (int i = datos.Length - 1; i >= 0; i--) {
                    Console.Write("{0} ", meses[i]);
                }
                Console.WriteLine("");
                break;
            default:
                Console.WriteLine("Opción incorrecta");
                break;
        }
    }
}
