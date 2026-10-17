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
    Nombre del fichero: "PracT3_3.1.1.1.cs"
    Calcula el producto de 1.000.000 por 1.000.000, usando una variable
	llamada "producto", de tipo "long". Prueba también a calcularlo usando una
	variable de tipo "int"
     */
    public static void ejercicio1() {
        int i1 = 1000000;
        int i2 = 1000000;
        
        // Si haces la operación con 2 int y lo guardas en un long, aunque en el long quepa, la operación sale mal igualmente
        long l1 = 1000000;
        long l2 = 1000000;
        
        long productoLong = l1 * l2;
        int productoInt = i1 * i2;
        
        Console.WriteLine("El resultado de la operación de 1000000 x 1000000 usando un int es: " + productoInt);
        Console.WriteLine("El resultado de la operación de 1000000 x 1000000 usando un long es: " + productoLong);
    }
