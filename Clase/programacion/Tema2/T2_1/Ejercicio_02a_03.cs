using System;

class Program
{
	static void Main()
	{ 
		// Se pide el primero número y se pasa a entero
		Console.Write("Inserta un número entero: ");
		int num1 = Convert.ToInt32(System.Console.ReadLine());
		
		// Se pide el segundo número y se pasa a entero
		Console.Write("Inserta un número entero: ");
		int num2 = Convert.ToInt32(System.Console.ReadLine());

		
		if (num1 > num2) {
			Console.WriteLine("El número {0} es el mayor", num1);
		} else {
			Console.WriteLine("El número {0} es el mayor", num2);
		}

	}
}

