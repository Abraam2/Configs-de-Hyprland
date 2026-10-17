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
      Nombre del fichero: "PracT3_3.2.1.1.cs"
      Crea un programa que muestre el resultado de dividir 3 entre 4, primero usando números enteros y luego usando números de coma flotante.
      */
    public static void ejercicio1() {
        int divisionI = 3 / 4;
        float divisionF = 3f / 4f;

        Console.WriteLine("El resutaldo de la división con númeores enteros es {0}", divisionI);
        Console.WriteLine("El resutaldo de la división con númeores flotantes es {0}", divisionF);
    }

    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.2.1.2.cs"
      ¿Cuál sería el resultado de las siguientes operaciones, usando números
      reales? a=5; a/=2; a+=1; a*=3; --a;
      */
    public static void ejercicio2() {
        int a = 5;

        // a = 5 / 2 = 2; Al ser un int, trunca directamente, en vez de 2,5 es 2
        a /= 2;
        Console.WriteLine("a /= 2; El resutaldo es: {0}", a);

        // a = 2 + 1 == 3
        a += 1;

        // a = 3 * 3 == 9
        a *= 3;

        // a = 8
        --a;

        Console.WriteLine("a += 1; a *= 3; --a; El resutaldo es: {0}", a);
    }
}
