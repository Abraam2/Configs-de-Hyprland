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
		
		// Se pide el tercer número y se pasa a entero
		Console.Write("Inserta un número entero: ");
		int num3 = Convert.ToInt32(System.Console.ReadLine());
		
		int mayor;

		
		if (num1 > num2 && num1 > num3) {
			mayor = num1;
		} else if (num2 > num1 && num2 > num3) {
			mayor = num2;
		} else {
			mayor = num3;
		}
		
		Console.WriteLine("El número {0} es el mayor", mayor);

	}
}
