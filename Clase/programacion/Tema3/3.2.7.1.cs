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
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.2.7.1.cs"
      Crea un programa que halle (y muestre) la raíz cuadrada del número que
      introduzca el usuario. Se repetirá hasta que introduzca 0.
      */
    public static void ejercicio1() {
        double a;
        do {
            Console.Write("Introduce un número: ");
            a = Convert.ToDouble(Console.ReadLine());

            double raiz = Math.Sqrt(a);
            Console.WriteLine("La raíz cuadrada de {0} es: {1}", a, raiz);

        } while (a != 0);
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.2.7.2.cs"
      Diseña un programa que calcule cualquier raíz (de cualquier orden) de un
      número. El usuario deberá indicar el número (por ejemplo, 2) y el índice de la raíz
      (por ejemplo, 3 para la raíz cúbica). Pista: hallar la raíz cúbica de 2 es lo mismo que
      elevar 2 a 1/3.
      */
    public static void ejercicio2() {
        Console.Write("Introduce el número del que quieras sacar la raíz: ");
        double radicando = Convert.ToDouble(Console.ReadLine());

        Console.Write("Introduce el índice de la raíz: ");
        int indice = Convert.ToInt32(Console.ReadLine());

        double exponente = 1.0 / indice;
        double resultado = Math.Pow(radicando, exponente);
        Console.WriteLine("El resultado de la operación es: {0} ", resultado);
    }

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT3_3.2.7.3.cs"
      Crea un programa que calcule la distancia entre dos puntos (x1,y1) y (x2,y2),
      usando la expresión d = raíz [ (x1-x2)^2 + (y1-y2)^2].
      */
    public static void ejercicio3() {
        double x1 = 1;
        double y1 = 2;
        double x2 = 4;
        double y2 = 6;

        double puntoX = x1 - x2;
        double puntoY = y1 - y2;

        double distancia = Math.Sqrt(Math.Pow(puntoX, 2) + Math.Pow(puntoY, 2));

        Console.WriteLine("La distancia es: {0}", distancia);
    }

    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT3_3.2.6.4.cs"
      Crea un programa que pida al usuario un ángulo (en grados) y muestre su
      seno, coseno y tangente. Recuerda que las funciones trigonométricas esperan que
      el ángulo se indique en radianes, no en grados. La equivalencia es que 180 grados
      = PI radianes.
      */
    public static void ejercicio4() {
        Console.Write("Intruduce un ángulo en grados: ");
        int grados = Convert.ToInt32(Console.ReadLine());

        double radianes = grados * (Math.PI / 180);

        string seno = Math.Sin(radianes).ToString("F2");
        string coseno = Math.Cos(radianes).ToString("F2");
        string tangente = Math.Tan(radianes).ToString("F2");

        Console.WriteLine("El seno tiene valor de: {0}", seno);
        Console.WriteLine("El coseno tiene valor de: {0}", coseno);
        Console.WriteLine("La tangente tiene valor de: {0}", tangente);
    }
}
