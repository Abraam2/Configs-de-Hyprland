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
      Nombre del fichero: "PracT4_4.1.1.1.cs"
      Un programa que pida al usuario 4 números, los memorice (utilizando un
      array), calcule su media aritmética y después muestre en pantalla la media y los
      datos tecleados.
      */
    public static void ejercicio1() {
        int[] datos = new int[4];
        int suma = 0;

        for (int i = 0; i < 4; i++) {
            Console.Write("Escribe el número {0}: ", i + 1);
            datos[i] = Convert.ToInt32(Console.ReadLine());
        }

        for (int i = 0; i < 4; i++) {
            suma = suma + datos[i];
        }

        double media = suma / 4.0;
        Console.WriteLine("La media es {0}", media);

        Console.Write("Los números tecleados fueron: ");
        for (int i = 0; i < 4; i++) {
            Console.Write("{0} ", datos[i]);
        }

        Console.WriteLine();
    }
    //----------------------------------EJERCICIO 2 -----------------------------------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT4_E2.cs"
      Un programa que pida al usuario 5 números reales (pista: necesitarás un
      array de "float") y luego los muestre en el orden contrario al que se introdujeron.
     * */
    public static void ejercicio2() {
        Console.WriteLine("Ejercicio 2");
    }
}
