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
    Nombre del fichero: "PracT3_3.2.4.1.cs"
    Crea un programa que calcule la raíz cuadrada del número que
	introduzca el usuario. La raíz se deberá calcular como "double", pero el resultado
	se mostrará como "float". (Recuerda: como viste al hacer el ejercicio 3.2.3.3, la raíz
	cuadrada de un número x se calcula con Math.Sqrt(x)).
      */
    public static void ejercicio1() {
		Console.Write("Inserta un número: ");
        int n = Convert.ToInt32(Console.ReadLine());
		
		double raiz = Math.Sqrt(n);
		float raizF = (float) raiz;
		Console.WriteLine("La raíz cuadrada de {0} es {1} (mostrada como float)", n, raizF);
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
    Nombre del fichero: "PracT3_3.2.4.2.cs"
    Crea una nueva versión del programa que calcula una aproximación de PI
	mediante la expresión: pi/4 = 1/1 - 1/3 + 1/5 - 1/7 + 1/9 - 1/11 + 1/13 (...) con tantos
	términos como indique el usuario. Debes hacer todas las operaciones con
	"double", pero mostrar el resultado como "float".
      */
    public static void ejercicio2() {
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
			float piF = (float) pi;
			Console.WriteLine("Término {0} | pi = {1} (mostrado como float)", i, piF);
		}
    }
    
}

