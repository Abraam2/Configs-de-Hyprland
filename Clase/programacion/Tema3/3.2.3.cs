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
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }
    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.2.3.1.cs"
      Calcula el volumen de una esfera, dado su radio, que será un número de
      doble precisión (volumen = pi * radio al cubo * 4/3)
      */
    public static void ejercicio1() {
        Console.Write("Introduce el radio del círculo: ");
        int radio = Convert.ToInt32(Console.ReadLine());

        double pi = 3.141592653589793;
        double volumen = pi * (radio * radio) * 4 / 3;

        Console.WriteLine("El volumen de una efera con radio {0} es: {1}", radio, volumen);
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.2.3.2.cs"
      Crea un programa que pida al usuario a una distancia (en metros) y el
      tiempo necesario para recorrerla (como tres números: horas, minutos, segundos),
      y muestre la velocidad, en metros por segundo, en kilómetros por hora y en millas
      por hora (pista: 1 milla = 1.609 metros).
      */
    public static void ejercicio2() {
        Console.Write("Introduce la distancia en metros: ");
        double metros = Convert.ToDouble(Console.ReadLine());

        Console.Write("Introduce las horas: ");
        double horas = Convert.ToDouble(Console.ReadLine());

        Console.Write("Introduce los minutos: ");
        double minutos = Convert.ToDouble(Console.ReadLine());

        Console.Write("Introduce los segundos: ");
        double segundos = Convert.ToDouble(Console.ReadLine());

        double totalSegundos = (horas * 3600) + (minutos * 60) + segundos;
        double totalHoras = horas + (minutos / 60.0) + (segundos / 3600.0);

        double mps = metros / totalSegundos;
        double kmh = (metros / 1000.0) / totalHoras;
        double mph = (metros / 1609.0) / totalHoras;

        Console.WriteLine("Velocidad en m/s: {0}", mps);
        Console.WriteLine("Velocidad en km/h: {0}", kmh);
        Console.WriteLine("Velocidad en mph: {0}", mph);
    }
    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
     Nombre del fichero: "PracT3_3.2.3.3.cs"
      Halla las soluciones de una ecuación de segundo grado del tipo y = Ax2 + Bx + C.
      Pista: la raíz cuadrada de un número x se calcula con Math.Sqrt(x)
      */

    public static void ejercicio3() {
        
        Console.WriteLine("Tienes que introducir los valores de una ecuación de segundo grado (a, b y c) ");

        Console.Write("Introduce el valor de a: ");
        int a = Convert.ToInt32(Console.ReadLine());
        Console.Write("Introduce el valor de b: ");
        int b = Convert.ToInt32(Console.ReadLine());
        Console.Write("Introduce el valor de c: ");
        int c = Convert.ToInt32(Console.ReadLine());
        
        double resultado1;
        double resultado2;
        int discriminante = b * b - 4 * a * c;

        if (discriminante < 0) {
            Console.WriteLine("No tiene solución real");
        }
        else if (discriminante == 0) {
            resultado1 = -b / (2 * a);
            Console.WriteLine("Solo hay un resultado y es: {0}", resultado1);
        } else {
            resultado1 = (-b + Math.Sqrt(discriminante)) / (2 * a);
            resultado2 = (-b - Math.Sqrt(discriminante)) / (2 * a);
            Console.WriteLine("El resultado si sumas el discriminantes es: {0}", resultado1);
            Console.WriteLine("El resultado si restas el discriminante es: {0}", resultado2);
        }
    }
    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT3_3.2.3.4.cs"
      Si se ingresan E euros en el banco a un cierto interés I durante N años, el
      dinero obtenido viene dado por la fórmula del interés compuesto: Resultado = e
      (1+ i)^n
      Aplícalo para calcular en cuanto se convierten 1.000 euros al cabo de 10
      años al 3% de interés anual.
      */
    public static void ejercicio4() {
		double dinero = 1000;
		int anyos = 10;
		double interes = 0.03;

		for (int i = 0; i < anyos; i++) {
			dinero = dinero * (1 + interes);
		}

		Console.WriteLine("Al cabo de {0} años tendrás: {1} euros", anyos, dinero);
	}
    //---------------------------------------EJERCICIO 5 ----------------------
    /*Ejercicio 5.
      Nombre del fichero: "PracT3_3.2.3.5.cs"
      Crea un programa que muestre los primeros 20 valores de la función y = x^2 - 1
      */
    public static void ejercicio5() {
        
        for (int x = 1; x <= 20; x++) {
			int y = (x * x) - 1;
			Console.WriteLine("Para x = {0}, y = {1}", x, y);
    	}
	}
    //---------------------------------------EJERCICIO 6 ----------------------
    /*Ejercicio 6.
      Nombre del fichero: "PracT3_3.2.3.6.cs"
      Crea un programa que "dibuje" la gráfica de y = (x-5)^2 para valores de x
      entre 1 y 10. Deberá hacerlo dibujando varios espacios en pantalla y luego un
      asterisco. La cantidad de espacios dependerá del valor obtenido para "y". Te será
      fácil si dibujas la gráfica "girada", de forma que los valores de "y" crezcan hacia la
      derecha.
     */
    public static void ejercicio6() {
		
		int y;
		
		for (int x = 1; x <= 10; x++) {
			y = (x - 5) * (x - 5);
			for (int j = 1; j <= y; j++) {
				if (j < y) {
					Console.Write(" ");
				} else if (j < y + 1) {
					Console.Write("*");
				}
			}
			Console.WriteLine();
		}	
	}
    //---------------------------------------EJERCICIO 7 ----------------------
    /*Ejercicio 7.
      Nombre del fichero: "PracT3_3.2.3.7.cs"
      Escribe un programa que calcule una aproximación de PI mediante la
      expresión: pi/4 = 1/1 - 1/3 + 1/5 - 1/7 + 1/9 - 1/11 + 1/13 ... El usuario deberá
      indicar la cantidad de términos a utilizar, y el programa mostrará todos los
      resultados hasta esa cantidad de términos. Debes hacer todas las operaciones con
      "double".
      */
    public static void ejercicio7() {
		Console.Write("Indica la cantidad de términos a utilizar: ");
        double n = Convert.ToDouble(Console.ReadLine());
        
        double resultado = 0;
        int signoAnterior = -1;
        double divisor = 1.0;
        
        for (int i = 1; i <= n; i++) {
			double termino = 1.0/divisor;
			
			if (signoAnterior == -1) {
				resultado = resultado + termino;
				signoAnterior = 1;
			} else {
				resultado = resultado - termino;
				signoAnterior = -1;
			}
			
			divisor = divisor + 2;
			
			double pi = resultado * 4;
			Console.WriteLine("Término {0} | pi = {1}", i, pi);
		}
		
		
	}
}
