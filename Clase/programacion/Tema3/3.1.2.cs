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
    Nombre del fichero: "PracT3_3.1.2.1.cs"
    Pregunta al usuario su edad, que se guardará en un "byte". A
    continuación, le deberás decir que no aparenta tantos años (por ejemplo, "No aparentas 20 años
     */
    public static void ejercicio1() {
        Console.Write("Introduce tu edad: ");
        byte edad = Convert.ToByte(Console.ReadLine());

        Console.WriteLine("No apartentas {0} años", edad);
    }

    /*Ejercicio 2.
    Nombre del fichero: "PracT3_3.1.2.2.cs"
    Pide al usuario dos números de dos cifras ("byte"), calcula su
    multiplicación, que se deberá guardar en un "int", y muestra el resultado en pantalla.
     */
    public static void ejercicio2() {
        Console.Write("Introduce un número de 2 cifras: ");
        byte a = Convert.ToByte(Console.ReadLine());

        Console.Write("Introduce un número de 2 cifras: ");
        byte b = Convert.ToByte(Console.ReadLine());

        int producto = a * b;
        Console.WriteLine("El resultado de la multiplicación de los números es: {0}", producto);
    }

    /*Ejercicio 3.
    Nombre del fichero: "PracT3_3.1.2.3.cs"
    Pide al usuario dos números enteros largos ("long") y muestra su suma, su resta y su producto.
     */
    public static void ejercicio3() {
        Console.Write("Introduce un número largo (en serio, muy largo): ");
        long a = Convert.ToInt64(Console.ReadLine());

        Console.Write("Introduce un número largo (en serio, muy largo): ");
        long b = Convert.ToInt64(Console.ReadLine());

        long suma = a + b;
        long resta = a - b;
        long producto = a * b;

        Console.WriteLine("El resultado de la suma es: {0}", suma);
        Console.WriteLine("El resultado de la resta es: {0}", resta);
        Console.WriteLine("El resultado de la producto es: {0}", producto);
    }
}
