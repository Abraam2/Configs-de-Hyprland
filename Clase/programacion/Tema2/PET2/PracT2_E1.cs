using System;

class Program {
    static void Main() {
        string nombreMes = "";

        int i = 1;
        int anyoNac = 0;

        int jovenes = 0;
        int maduros = 0;
        int mayores = 0;

        Console.Write("Introduce el mes actual");
        string mesAct = Console.ReadLine();

        Console.Write("Introduce el año actual");
        string anyoAct = Console.ReadLine();

        do {
            Console.Write("Introduce el nombre de la persona {0}: ", i++);
            string nombre = Console.ReadLine();

            Console.Write("Introduce el mes de nacimiento de {0}: ", nombre);
            int mesNac = Convert.ToInt32(Console.ReadLine());

            Console.Write("Introduce el año de nacimiento de {0}: ", nombre);
            anyoNac = Convert.ToInt32(Console.ReadLine());

            int edad = anyoAct - anyoNac;

            if (mesAct < mesNac) {
                int edad = anyoAct - anyoNac;
            } else {
                int edad = anyoAct - anyoNac + 1;
            }

            if (edad < 25) {
                jovenes++;
            }
            if (edad <= 25 && edad >= 49) {
                maduros++;
            }
            if (edad >= 50) {
                mayores++;
            }

            switch (mesNac) {
                case 1:
                    nombreMes = "enero";
                    break;
                case 2:
                    nombreMes = "febrero";
                    break;
                case 3:
                    nombreMes = "marzo";
                    break;
                case 4:
                    nombreMes = "abril";
                    break;
                case 5:
                    nombreMes = "mayo";
                    break;
                case 6:
                    nombreMes = "junio";
                    break;
                case 7:
                    nombreMes = "julio";
                    break;
                case 8:
                    nombreMes = "agosto";
                    break;
                case 9:
                    nombreMes = "septiembre";
                    break;
                case 10:
                    nombreMes = "octubre";
                    break;
                case 11:
                    nombreMes = "noviembre";
                    break;
                case 12:
                    nombreMes = "diciembre";
                    break;
                default:
                    nombreMes = "Desconocido";
                    break;
            }

            if (anyoNac != 0) {
                Console.WriteLine("{0} nació en {1} del año {2}. Tiene {3} años.", nombre, nombreMes, anyoNac, edad);
            }

        } while (anyoNac != 0);

        Console.WriteLine("Hay {0} jóvenes, {1} maduros y {2} mayores", jovenes, maduros, mayores);

        if (mayores == 0) {
            Console.WriteLine("Ninguno ha llegado a los 50");
        } else if (jovenes == 0 && maduros == 0) {
            Console.WriteLine("Todos tienen 50 años o más");
        } else {
            Console.WriteLine("Hay algunos menores de 50 y otros mayores");
        }
    }
}
