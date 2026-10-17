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
      Nombre del fichero: "PracT3_3.1.4.1.cs"
      Crea un programa que use tres variables x,y,z. Sus valores iniciales serán
      15, -10, 214. Deberás incrementar el valor de estas variables en 12, usando el formato abreviado. ¿Qué valores esperas que se obtengan? Contrástalo con el
      resultado obtenido por el programa.
      */
    public static void ejercicio1() {
        int x = 15;
        int y = -10;
        int z = 214;

        // x = 27
        // y = 2
        // z = 226
        Console.WriteLine("La variable x incrementada es igual a {0}", x += 12);
        Console.WriteLine("La variable y incrementada es igual a {0}", y += 12);
        Console.WriteLine("La variable z incrementada es igual a {0}", z += 12);
    }

    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.1.4.2.cs"
      ¿Cuál sería el resultado de las siguientes operaciones? a=5; b=a+2; b-=3;
      c=-3; c*=2; ++c; a*=b; Crea un programa que te lo muestre
      */
    public static void ejercicio2() {
        int a = 5;
        int b = a + 2;
        b -= 3;

        // b = 7 - 3 == 4
        Console.WriteLine("b -= 3; El resultado es: {0}", b);

        int c = -3;
        c *= 2;
        ++c;

        // c = -6 + 1 == -5
        Console.WriteLine("c *= 2; ++c; El resultado es: {0}", c);

        a *= b;

        // a = 5 * 4 == 20
        Console.WriteLine("a *= b; El resultado es: {0}", a);
    }
}
