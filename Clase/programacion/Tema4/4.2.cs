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
      Nombre del fichero: "PracT4_4.2.1.cs"
      Un programa que pida al usuario dos bloques de 10 números enteros
      (usando un array de dos dimensiones). Después deberá mostrar el mayor dato
      que se ha introducido en cada uno de ellos
      */
    public static void ejercicio1() {
        const int BLOQUES = 2;
        const int N_DATOS = 10;

        int[,] datos = new int[BLOQUES, N_DATOS];

        for (int i = 0; i < BLOQUES; i++) {
            Console.WriteLine("Introduce los números del bloque {0}", i + 1);

            for (int j = 0; j < N_DATOS; j++) {
                Console.Write("Bloque {0}, dato {1}: ", i + 1, j + 1);
                datos[i, j] = Convert.ToInt32(Console.ReadLine());
            }
            Console.WriteLine();
        }

        for (int i = 0; i < BLOQUES; i++) {
            int mayor = datos[i, 0];

            for (int j = 1; j < N_DATOS; j++) {
                if (datos[i, j] > mayor) {
                    mayor = datos[i, j];
                }
            }

            Console.WriteLine("El mayor dato del bloque {0} es: {1}", i + 1, mayor);
        }
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT4_4.2.2.cs"
      Un programa que pida al usuario dos bloques de 6 cadenas de texto.
      Después pedirá al usuario una nueva cadena y comprobará si aparece en alguno
      de los dos bloques de información anteriores.
      */
    public static void ejercicio2() {
        const int BLOQUES = 2;
        const int N_DATOS = 6;

        string[,] datos = new string[BLOQUES, N_DATOS];

        for (int i = 0; i < BLOQUES; i++) {
            Console.WriteLine("Ingresa los datos del bloque {0}: ", i + 1);
            for (int j = 0; j < N_DATOS; j++) {
                Console.Write("Bloque {0}, dato {1}: ", i + 1, j + 1);
                datos[i, j] = Console.ReadLine();
            }
        }

        Console.Write("Ingresa el dato que quieres buscar: ");
        string datoBuscado = Console.ReadLine();

        bool encontrado = false;
        int contador = 0;

        for (int i = 0; i < BLOQUES; i++) {
            for (int j = 0; j < N_DATOS; j++) {
                if (datos[i, j] == datoBuscado) {
                    encontrado = true;
                    contador++;
                }
            }
        }

        if (encontrado) {
            if (contador == 1) {
                Console.WriteLine("Se ha encontrado {0} 1 vez", datoBuscado);
            } else {
                Console.WriteLine("Se ha encontrado {0} {1} veces", datoBuscado, contador);
            }
        } else {
            Console.WriteLine("No se ha encontrado {0}", datoBuscado);
        }
    }

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT4_4.2.3.cs"
      Un programa que pregunte al usuario el tamaño que tendrán dos bloques
      de números enteros (por ejemplo, uno de 10 elementos y otro de 12). Luego
      pedirá los datos para ambos bloques de datos. Finalmente deberá mostrar el
      mayor dato que se ha introducido en cada uno de ellos.
      */
    public static void ejercicio3() {
        Console.Write("Ingresa el tamaño del primer bloque: ");
        int tamaño1 = Convert.ToInt32(Console.ReadLine());
        Console.Write("Ingresa el tamaño del segundo bloque: ");
        int tamaño1 = Convert.ToInt32(Console.ReadLine());
    }
}
