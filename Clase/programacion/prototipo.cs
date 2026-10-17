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
    Nombre del fichero: "PracT2_E1.cs"
    Puntuación máxima: 3.5 puntos
    Crea un programa que pida al usuario la fecha actual en formato numérico (mes y año).
    A continuación, pedirá el nombre, el mes y el año de nacimiento de varias personas.
    Mientras el año de nacimiento sea distinto de cero, seguirá pidiendo los datos del siguiente
    empleado. El programa mostrará de forma intercalada a la petición de datos de cada
    persona, el mes (en formato texto), el año de nacimiento y la edad (en años) de cada
    persona.
    El programa terminará mostrando dos mensajes:
    • Cuántos jóvenes hay (menores de 25 años), maduros (entre 25 y 49 años) y
    mayores (aquellos con más de 49 años).
    • "Todos tienen 50 años o más", "Ninguno ha llegado a los 50 años" o "Hay algunos
    menores de 50 y otros mayores", dependiendo de los datos introducidos.
     */
    public static void ejercicio1() {
        Console.WriteLine("Ejercicio 1");
    }
    //----------------------------------EJERCICIO 2 -----------------------------------------------
    /*Ejercicio 2.
    Nombre del fichero: "PracT2_E2.cs"
    Puntuación máxima: 3 puntos
    Realiza un programa que permita introducir una serie de números enteros positivos y
    negativos hasta que se introduzca un cero. A continuación mostrará como resultado el que
    se ha repetido más veces de forma consecutiva, el número mayor y el número menor de los
    introducidos.
    Utilizando excepciones (bloques try..catch) se deberá controlar si el dato introducido no es
    un número, mostrar un mensaje de error y continuar la ejecución del programa.
    * */
    public static void ejercicio2() {
        Console.WriteLine("Ejercicio 2");
    }
    //---------------------------------------EJERCICIO 3--------------------------------------
    /*Ejercicio 3
    Nombre del fichero: "PracT2_E3.cs"
    Puntuación máxima: 3.5 puntos
    Crea un programa que pida al usuario un número (impar) de filas, y dibuje un cuadrado con
    ese número de filas y columnas. Además deberán estar unidos los vértices.
    En el caso de que el número de filas indicado por el usuario sea par, inferior a 9 o superior a
    26, debe mostrarse el mensaje "Número de filas incorrecto" y no dibujar nada.
    Por ejemplo, si el usuario escribe 11 filas, el programa debe dibujar algo así:
    * */
    public static void ejercicio3() {
        Console.WriteLine("Ejercicio 3");
    }
}
