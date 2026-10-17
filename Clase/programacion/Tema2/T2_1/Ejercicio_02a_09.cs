using System;

class Program
{
	static void Main()
	{ 
		// Se pide el primero número y se pasa a entero
		Console.Write("Inserta un número entero (positivo o negativo): ");
		int num1 = Convert.ToInt32(System.Console.ReadLine());
		
		// Se pide el segundo número y se pasa a entero
		Console.Write("Inserta un número entero (positivo o negativo): ");
		int num2 = Convert.ToInt32(System.Console.ReadLine());
		
		

		
		if ( num1 >= 0 && num2 >= 0) {
			Console.Write("Todos los números son positivos");
		} else if ( num1 >= 0 || num2 >= 0 ) {
			Console.Write("Uno de los números es positivo");
		} else {
			Console.Write("Ninguno de los números es positivo");
		}

	}
}
