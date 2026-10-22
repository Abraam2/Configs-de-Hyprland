using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");
            Console.WriteLine("2 - ejercicio 2");
            Console.WriteLine("3 - ejercicio 3");
            Console.WriteLine("4 - ejercicio 4");
            Console.WriteLine("5 - ejercicio 5");
            Console.WriteLine("6 - ejercicio 6");

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
                case "3":
                    ejercicio3();
                    break;
                case "4":
                    ejercicio4();
                    break;
                case "5":
                    ejercicio5();
                    break;
                case "6":
                    ejercicio6();
                    break;
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.5.1.cs"
      Crea un programa que use el operador condicional para dar a una variable
      llamada "iguales" (booleana) el valor "true" si los dos números que ha tecleado el
      usuario son iguales, o "false" si son distintos.
      */
    public static void ejercicio1() {}

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.5.2.cs"
      Crea una versión alternativa del ejercicio 3.5.1, que use "if" en vez del
      operador condicional.
      */
    public static void ejercicio2() {}

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT3_3.5.3.cs"
      Crea una versión alternativa del ejercicio 3.5.1, que asigne directamente el
      valor al booleano a partir de una comparación.
      */
    public static void ejercicio3() {}

    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT3_3.5.4.cs"
      Crea un programa que use el operador condicional para dar a una variable
      llamada "ambosPares" (booleana) el valor "true" si dos números introducidos por
      el usuario son pares, o "false" si alguno es impar
      */
    public static void ejercicio4() {}
    //---------------------------------------EJERCICIO 5 ----------------------
    /*Ejercicio 5.
      Nombre del fichero: "PracT3_3.5.5.cs"
      Crea una versión alternativa del ejercicio 3.5.4, que use "if" en vez del
      operador condicional.
      */
    public static void ejercicio5() {}
    //---------------------------------------EJERCICIO 6 ----------------------
    /*Ejercicio 6.
      Nombre del fichero: "PracT3_3.5.6.cs"
      Crea una versión alternativa del ejercicio 3.5.5, que asigne directamente el
      valor al booleano a partir de una comparación.
      */
    public static void ejercicio6() {}
}
