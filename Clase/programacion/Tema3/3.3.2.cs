using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");

            op = Console.ReadLine();

            switch (op) {
                case "0":
                    break;
                case "1":
                    ejercicio1();
                    break;
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.3.2.1.cs"
      Crea un programa que pida al usuario que teclee cuatro letras y las
      muestre en pantalla juntas, pero en orden inverso, y entre comillas dobles. Por
      ejemplo si las letras que se teclean son a, l, o, h, escribiría "hola".
      */
    public static void ejercicio1() {}
}
