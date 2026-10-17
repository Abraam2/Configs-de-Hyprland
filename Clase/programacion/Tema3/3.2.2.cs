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
      Nombre del fichero: "PracT3_3.2.2.1.cs"
      Crea un programa que muestre el resultado de dividir 13 entre 6 usando
      números enteros, luego usando números de coma flotante de simple precisión y
      luego con números de doble precisión.
      */
    public static void ejercicio1() {
        int i1 = 13, i2 = 6;
        float f1 = 13, f2 = 6;
        double d1 = 13, d2 = 6;

        int divEntera = i1 / i2;
        float divFloat = f1 / f2;
        double divDouble = d1 / d2;

        Console.WriteLine("El resultado de la división entera es: {0}", divEntera);
        Console.WriteLine("El resultado de la división con simple precisión (float) es: {0}", divFloat);
        Console.WriteLine("El resultado de la división con doble precisión (double) es: {0}", divDouble);
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.2.2.2.cs"
      Calcula el área de un círculo, dado su radio, que será un número entero
      (área = pi * radio al cuadrado). Usa datos de doble precisión.
      */
    public static void ejercicio2() {
        Console.Write("Introduce el radio del círculo: ");
        int radio = Convert.ToInt32(Console.ReadLine());

        double pi = 3.141592653589793;
        double area = pi * (radio * radio);

        Console.WriteLine("El área del círculo con radio {0} es: {1}", radio, area);
    }
}
