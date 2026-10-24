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
      Nombre del fichero: "PracT4_4.1.2.1.cs"
      Un programa que almacene en una tabla el número de días que tiene
      cada mes (supondremos que es un año no bisiesto), pida al usuario que le indique
      un mes (1=enero, 12=diciembre) y muestre en pantalla el número de días que
      tiene ese mes.
      */
    public static void ejercicio1() {
        int[] diasPorMes = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

        Console.Write("Introduce un número de mes: ");
        int mes = Convert.ToInt32(Console.ReadLine());

        if (mes >= 1 && mes <= 12) {
            Console.WriteLine("El mes {0} tiene {1} días.", mes, diasPorMes[mes - 1]);
        } else {
            Console.WriteLine("El número tiene que ser del 1 al 12");
        }
    }
}
