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
    Nombre del fichero: "PracT3_3.1.3.1.cs"
    Crea un programa que use tres variables enteras x,y,z. Sus valores
    iniciales serán 15, -10, 2.147.483.647. Se deberá incrementar el valor de estas
    variables. ¿Qué valores esperas que se obtengan? Contrástalo con el resultado
    obtenido por el programa.
     */
    public static void ejercicio1() {
        int x = 15;
        int y = -10;
        int z = 2147483647;

        // Z da un número negativo porque ya tiene el valor máximo y al incrementar, hay overflow
        Console.WriteLine("La variable x incrementada es igual a {0}", ++x);
        Console.WriteLine("La variable y incrementada es igual a {0}", ++y);
        Console.WriteLine("La variable z incrementada es igual a {0}", ++z);
    }

    /*Ejercicio 2.
    Nombre del fichero: "PracT3_3.1.3.2.cs"
    ¿Cuál sería el resultado de las siguientes operaciones? a=5; b=++a; c=a++;
    b=b*5; a=a*2; Calcúlalo a mano y luego crea un programa que lo resuelva, para
    ver si habías hallado la solución correcta.
     */
    public static void ejercicio2() {
        int a = 5;
        int b = ++a;
        int c = a++;

        // b = 6, primero aumenta el valor y luego se lo asigna a la variable
        // c = 6, primero asigna el valor y luego lo aumenta, por lo que ahora a = 7
        Console.WriteLine("b = ++a; El resultado es: {0}", b);
        Console.WriteLine("c = a++; El resultado es: {0}", c);

        b = b * 5;
        a = a * 2;

        // b = 6 * 5 == 30
        // a = 7 * 2 == 14
        Console.WriteLine("b = b * 5; El resultado es: {0}", b);
        Console.WriteLine("c = a * 2; El resultado es: {0}", a);
    }
}
