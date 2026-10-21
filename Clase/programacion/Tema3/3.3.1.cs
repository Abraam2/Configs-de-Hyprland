using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");
            Console.WriteLine("2 - ejercicio 2");
            Console.WriteLine("3 - ejercicio 3");

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
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.3.1.1.cs"
      Crea un programa que pida una letra al usuario y diga si se trata de una
      vocal.
      */
    public static void ejercicio1() {
        Console.Write("Introduce una letra: ");
        char letra = Convert.ToChar(Console.ReadLine());

        if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' || letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U') {
            Console.WriteLine("Es una vocal");
        }
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.3.1.2.cs"
      Crea un programa que muestre letras alternas (una sí y una no) entre la
      que teclee el usuario y la "z". Por ejemplo, si el usuario introduce una "a", se
      escribirá "aceg...".
      */
    public static void ejercicio2() {
        Console.Write("Introduce una letra: ");
        char letraInicial = Convert.ToChar(Console.ReadLine());

        for (int c = letraInicial; c <= 'z'; c += 2) {
            Console.Write((char)c);
        }
        Console.WriteLine();
    }

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Crea un programa que pida al usuario el ancho (por ejemplo, 4) y el alto
      (por ejemplo, 3) y una letra (por ejemplo, X) y escriba un rectángulo formado por
      esa cantidad de letras:
      XXXX
      XXXX
      XXXX
      */
    public static void ejercicio3() {
        Console.Write("Introduce el ancho: ");
        int ancho = Convert.ToInt32(Console.ReadLine());

        Console.Write("Introduce el alto: ");
        int alto = Convert.ToInt32(Console.ReadLine());

        Console.Write("Introduce una letra: ");
        char letra = Convert.ToChar(Console.ReadLine());

        for (int i = 1; i <= alto; i++) {
            for (int j = 1; j <= ancho; j++) {
                Console.Write(letra);
            }
            Console.WriteLine();
        }
    }
}
