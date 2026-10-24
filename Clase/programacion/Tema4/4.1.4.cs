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
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT4_4.1.4.1.cs"
      Crea una variante del ejemplo 04_01_04a que pida al usuario el dato a
      buscar, avise si ese dato no aparece, y que diga cuántas veces se ha encontrado en
      caso contrario.
      */
    public static void ejercicio1() {
        int[] datos = { 2, 4, 6, 8, 2, 4, 10, 0, 0 };
        int cantidad = 7;

        Console.Write("Inserta el número entero a buscar: ");
        int datoBuscado = Convert.ToInt32(Console.ReadLine());

        int contador = 0;

        for (int i = 0; i < cantidad; i++) {
            if (datos[i] == datoBuscado) {
                contador++;
            }
        }

        if (contador == 0) {
            Console.WriteLine("El número {0} no se ha encontrado.", datoBuscado);
        } else if (contador == 1) {
            Console.WriteLine("El número {0} se ha encontrado 1 vez.", datoBuscado);
        } else {
            Console.WriteLine("El número {0} se ha encontrado {1} veces.", datoBuscado, contador);
        }
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT4_4.1.4.2.cs"
      Crea una variante del ejemplo 04_01_04a que añada un dato introducido
      por el usuario al final de los datos existentes.
      */
    public static void ejercicio2() {
        int[] datos = { 2, 4, 6, 8, 2, 4, 10, 0, 0 };
        int cantidad = 7;
        int capacidad = 9;

        Console.Write("Los datos que hay ahora son: ");

        for (int i = 0; i < cantidad; i++) {
            Console.Write("{0} ", datos[i]);
        }
        Console.WriteLine();

        Console.Write("Inserta el número entero que quieras añadir: ");
        int datoNuevo = Convert.ToInt32(Console.ReadLine());

        if (cantidad < capacidad) {
            // Como empieza en 0, si cantidad es 7, lo pone el hueco 8
            datos[cantidad] = datoNuevo;
            cantidad++;
        }

        Console.Write("Los datos que hay ahora son: ");

        for (int i = 0; i < cantidad; i++) {
            Console.Write("{0} ", datos[i]);
        }
        Console.WriteLine();
    }

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT4_4.1.4.3.cs"
      Crea una variante del ejemplo 04_01_04a que inserte un dato introducido
      por el usuario en la posición que elija el usuario. Debe avisar si la posición
      escogida es incorrecta (porque esté más allá del final de los datos).
      */
    public static void ejercicio3() {
        int[] datos = { 2, 4, 6, 8, 2, 4, 10, 0, 0 };
        int cantidad = 7;

        Console.Write("Los datos que hay ahora son: ");

        for (int i = 0; i < cantidad; i++) {
            Console.Write("{0} ", datos[i]);
        }
        Console.WriteLine();

        Console.Write("Escribe un número entero que quieras añadir: ");
        int datoInsertar = Convert.ToInt32(Console.ReadLine());
        Console.Write("Escribe la posición en la que quieres añadirlo: ");
        int posicionInsertar = Convert.ToInt32(Console.ReadLine());

        if (posicionInsertar > cantidad || posicionInsertar < 0) {
            Console.WriteLine("No es posible hacer eso, la posición escogida no es válida");
        } else {
            for (int i = cantidad; i > posicionInsertar; i--) {
                datos[i] = datos[i - 1];
            }
            datos[posicionInsertar] = datoInsertar;
            cantidad++;

            Console.Write("Los datos que hay ahora son: ");

            for (int i = 0; i < cantidad; i++) {
                Console.Write("{0} ", datos[i]);
            }
            Console.WriteLine();
        }
    }

    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT4_4.1.4.4.cs"
      Crea una variante del ejemplo 04_01_04a que borre el dato que se
      encuentre en la posición que escoja el usuario. Debe avisar si la posición
      seleccionada no es válida.
      */
    public static void ejercicio4() {
        int[] datos = { 2, 4, 6, 8, 2, 4, 10, 0, 0 };
        int cantidad = 7;

        Console.Write("Los datos que hay ahora son: ");

        for (int i = 0; i < cantidad; i++) {
            Console.Write("{0} ", datos[i]);
        }
        Console.WriteLine();

        Console.Write("Escribe la posición del dato que quieras borrar");
        int posicionBorrar = Convert.ToInt32(Console.ReadLine());

        if (posicionBorrar > cantidad - 1 || posicionBorrar < 0) {
            Console.WriteLine("No es posible hacer eso, la posición escogida no es válida");
        } else {
            for (int i = posicionBorrar; i < cantidad - 1; i++) {
                datos[i] = datos[i + 1];
            }
            cantidad--;

            Console.Write("Los datos que hay ahora son: ");

            for (int i = 0; i < cantidad; i++) {
                Console.Write("{0} ", datos[i]);
            }
            Console.WriteLine();
        }
    }
    //---------------------------------------EJERCICIO 5 ----------------------
    /*Ejercicio 5.
      Nombre del fichero: "PracT4_4.1.4.5.cs"
      Crea un programa que prepare espacio para un máximo de 10 nombres.
      Deberá mostrar al usuario un menú que le permita realizar las siguientes
      operaciones:

      - Añadir un dato al final de los ya existentes.
      - Insertar un dato en una cierta posición (como ya se ha comentado, los que
      queden detrás deberán desplazarse "hacia el final" para dejarle hueco); por
      ejemplo, si el array contiene "hola", "adiós" y se pide insertar "bien" en la
      segunda posición, el array pasará a contener "hola", "bien", "adiós".
      - Borrar el dato que hay en una cierta posición (como se ha visto, lo que
      estaban detrás deberán desplazarse "hacia el principio" para que no haya
      huecos); por ejemplo, si el array contiene "hola", "bien", "adiós" y se pide
      borrar el dato de la segunda posición, el array pasará a contener "hola",
      "adiós"
      - Mostrar los datos que contiene el array.
      - Salir del programa.
      */
    public static void ejercicio5() {
        string[] nombres = { "Jose", "Paco", "Samuel", "Robe", "Samanta", "Arturo", "Mike", "Chester", "", "" };
        int cantidad = 8;
        int capacidad = 10;

        string respuesta;
        string datoNuevo;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - Añadir dato al final");
            Console.WriteLine("2 - Insertar dato en cierta posición");
            Console.WriteLine("3 - Borrar dato en cierta posición");
            Console.WriteLine("4 - Mostrar datos");
            Console.Write("Elige opción: ");
            respuesta = Console.ReadLine();

            switch (respuesta) {
                case "0":
                    break;

                case "1":
                    if (cantidad < capacidad) {
                        Console.Write("Inserta el nombre que quieras añadir: ");
                        datoNuevo = Console.ReadLine();
                        nombres[cantidad] = datoNuevo;
                        cantidad++;
                    } else {
                        Console.WriteLine("No se puede añadir un dato más, el array está lleno.");
                    }
                    Console.WriteLine();
                    break;

                case "2":
                    if (cantidad >= capacidad) {
                        Console.WriteLine("No caben más elementos en el array.");
                    } else {
                        Console.Write("Inserta la posición donde quieres añadirlo (0 a {0}): ", cantidad);
                        int posicionInsertar = Convert.ToInt32(Console.ReadLine());

                        if (posicionInsertar < 0 || posicionInsertar > cantidad) {
                            Console.WriteLine("Posición no válida.");
                        } else {
                            Console.Write("Inserta el dato que quieres añadir: ");
                            datoNuevo = Console.ReadLine();

                            for (int i = cantidad; i > posicionInsertar; i--) {
                                nombres[i] = nombres[i - 1];
                            }
                            nombres[posicionInsertar] = datoNuevo;
                            cantidad++;
                        }
                    }
                    Console.WriteLine();
                    break;

                case "3":
                    if (cantidad == 0) {
                        Console.WriteLine("El array ya está vacío, no hay nada que borrar.");
                    } else {
                        Console.Write("Inserta la posición del dato que quieres borrar (0 a {0}): ", cantidad - 1);
                        int posicionBorrar = Convert.ToInt32(Console.ReadLine());

                        if (posicionBorrar < 0 || posicionBorrar >= cantidad) {
                            Console.WriteLine("Posición no válida.");
                        } else {
                            for (int i = posicionBorrar; i < cantidad - 1; i++) {
                                nombres[i] = nombres[i + 1];
                            }
                            cantidad--;
                        }
                    }
                    Console.WriteLine();
                    break;

                case "4":
                    if (cantidad == 0) {
                        Console.WriteLine("El array no contiene datos.");
                    } else {
                        Console.Write("Los datos que contiene el array son: ");
                        for (int i = 0; i < cantidad; i++) {
                            Console.Write("{0} ", nombres[i]);
                        }
                        Console.WriteLine();
                    }
                    Console.WriteLine();
                    break;

                default:
                    Console.WriteLine("Opción incorrecta.");
                    Console.WriteLine();
                    break;
            }
        } while (respuesta != "0");
    }
}
