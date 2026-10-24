using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");
            Console.WriteLine("2 - ejercicio 2");
            Console.WriteLine("3 - ejercicio 3");
            Console.WriteLine("4 - ejercicio 4");
            Console.WriteLine("5 - ejercicio 5");
            Console.WriteLine("6 - ejercicio 6");
            Console.WriteLine("7 - ejercicio 7");
            Console.WriteLine("8 - ejercicio 7");
            Console.WriteLine("9 - ejercicio 8");
            Console.WriteLine("9 - ejercicio 9");
            Console.WriteLine("10 - ejercicio 10");
            Console.WriteLine("11 - ejercicio 11");

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
                case "4":
                    ejercicio4();
                    break;
                case "5":
                    ejercicio5();
                    break;
                case "6":
                    ejercicio6();
                    break;
                case "7":
                    ejercicio7();
                    break;
                case "8":
                    ejercicio8();
                    break;
                case "9":
                    ejercicio9();
                    break;
                case "10":
                    ejercicio10();
                    break;
                case "11":
                    ejercicio11();
                    break;
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT4_4.1.3.1.cs"
      Crea un programa que pida al usuario 6 números enteros cortos y luego
      los muestre en orden inverso (pista: usa un array para almacenarlos y "for" para
      mostrarlos).
      */
    public static void ejercicio1() {}

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT4_4.1.3.2.cs"
      Crea un programa que pregunte al usuario cuántos números enteros va a
      introducir (por ejemplo, 10), le pida todos esos números, los guarde en un array y
      finalmente calcule y muestre la media de esos números.
      */
    public static void ejercicio2() {}

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT4_4.1.3.3.cs"
      Un programa que pida al usuario 10 reales de doble precisión, calcule su
      media y luego muestre los que están por encima de la media.
      */
    public static void ejercicio3() {}

    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT4_4.1.3.4.cs"
      Un programa que almacene en una tabla el número de días que tiene
      cada mes (de un año no bisiesto), pida al usuario que le indique un mes (ej. 2 para
      febrero) y un día (ej. el día 15) y diga qué número de día es dentro del año (por
      ejemplo, el 15 de febrero sería el día número 46, el 31 de diciembre sería el día
      365).
      */
    public static void ejercicio4() {}
    //---------------------------------------EJERCICIO 5 ----------------------
    /*Ejercicio 5.
      Nombre del fichero: "PracT4_4.1.3.5.cs"
      A partir del ejercicio anterior, crea otro que pida al usuario que le indique
      la fecha, formada por día (1 al 31) y el mes (1=enero, 12=diciembre), y como
      respuesta muestre en pantalla el número de días que quedan hasta final de año.
      */
    public static void ejercicio5() {}
    //---------------------------------------EJERCICIO 6 ----------------------
    /*Ejercicio 6.
      Nombre del fichero: "PracT4_4.1.3.6.cs"
      Un programa que pida 10 nombres y los memorice (pista: esta vez se
      trata de un array de "string"). Después deberá pedir que se teclee un nombre y
      dirá si se encuentra o no entre los 10 que se han tecleado antes. Volverá a pedir
      otro nombre y a decir si se encuentra entre ellos, y así sucesivamente hasta que se
      teclee "fin". En el siguiente apartado verás detalles de cómo hacer ese tipo de
      búsquedas.
      */
    public static void ejercicio6() {}

    //---------------------------------------EJERCICIO 7 ----------------------
    /*Ejercicio 7.
      Nombre del fichero: "PracT4_4.1.3.7.cs"
      Un programa que prepare espacio para guardar un máximo de 100
      nombres. El usuario deberá ir introduciendo un nombre cada vez, hasta que se
      pulse Intro sin teclear nada, momento en el que dejarán de pedirse más nombres
      y se mostrará en pantalla la lista de los nombres que se han introducido.
      */
    public static void ejercicio7() {}

    //---------------------------------------EJERCICIO 8 ----------------------
    /*Ejercicio 8.
      Nombre del fichero: "PracT4_4.1.3.8.cs"
      Un programa que reserve espacio para un vector de 3 componentes, pida
      al usuario valores para dichas componentes (por ejemplo [2, -5, 7]) y muestre su
      módulo (la raíz cuadrada de la suma de sus componentes al cuadrado; por
      ejemplo, para [2, -5, 7] el resultado sería la raíz cuadrada de 78, aproximadamente
      8,83).
      */
    public static void ejercicio8() {}
    //---------------------------------------EJERCICIO 9 ----------------------
    /*Ejercicio 9.
      Nombre del fichero: "PracT4_4.1.3.9.cs"
      Un programa que reserve espacio para dos vectores de 3 componentes,
      pida al usuario sus valores y calcule la suma de ambos vectores (su primera
      componente será x1+y1, la segunda será x2+y2 y así sucesivamente).
      */
    public static void ejercicio9() {}
    //---------------------------------------EJERCICIO 10 ----------------------
    /*Ejercicio 10.
      Nombre del fichero: "PracT4_4.1.3.10.cs"
      Un programa que reserve espacio para dos vectores de 3 componentes,
      pida al usuario sus valores y calcule su producto escalar (x1·y1+ x2·y2 + z1·z2)
      */
    public static void ejercicio10() {}

    //---------------------------------------EJERCICIO 11 ----------------------
    /*Ejercicio 11.
      Nombre del fichero: "PracT4_4.1.3.11.cs"
      Un programa que pida al usuario 4 números enteros y calcule (y
      muestre) cuál es el mayor de ellos. Nota: para calcular el mayor valor de un array,
      hay que comparar cada uno de los valores que tiene almacenados el array con el
      que hasta ese momento es el máximo provisional. El valor inicial de este máximo
      provisional no debería ser cero (porque el resultado sería incorrecto si todos los
      números son negativos), sino el primer elemento del array. Si no lo consigues, en
      el próximo apartado tienes más detalles sobre cómo resolver este problema.
      */
    public static void ejercicio11() {}
}
