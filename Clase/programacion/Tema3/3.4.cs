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
      Nombre del fichero: "PracT3_3.4.2.1.cs"
      Crea un programa que pida al usuario su nombre, y le diga "Hola" si se
      llama "Juan", o bien le diga "No te conozco" si teclea otro nombre.
      */
    public static void ejercicio1() {
        Console.Write("Inserta tu nombre: ");
        string nombre = Console.ReadLine();

        if (nombre == "juan" || nombre == "Juan") {
            Console.WriteLine("Hola");
        } else {
            Console.WriteLine("No te conozco");
        }
    }
    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.4.2.1.cs"
      Crea un programa que pida al usuario un nombre y una contraseña. La
      contraseña se debe introducir dos veces. Si las dos contraseñas no son iguales, se
      avisará al usuario y se le volverán a pedir las dos contraseñas, tantas veces como
      sea necesario hasta que coincidan.
      */
    public static void ejercicio2() {
        int pasar = 0;

        Console.Write("Inserta un nombre: ");
        string nombre = Console.ReadLine();

        do {
            Console.Write("Inserta la contraseña: ");
            string contraseña1 = Console.ReadLine();

            Console.Write("Inserta la contraseña otra vez: ");
            string contraseña2 = Console.ReadLine();

            if (contraseña1 == contraseña2) {
                Console.WriteLine("Has escrito la contraseña correctamente");
                pasar = 1;
            } else {
                Console.WriteLine("La primera contraseña y la segunda contraseña no coinciden");
            }
        } while (pasar == 0);
    }
}
