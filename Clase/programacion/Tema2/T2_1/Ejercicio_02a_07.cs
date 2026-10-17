using System;

class Program
{
	static void Main()
	{ 
	
		// Se pide el primero número y se pasa a entero
		Console.Write("Inserta un número entero: ");
		int n = Convert.ToInt32(System.Console.ReadLine());
	
		if ( n % 2 == 0 && n % 3 != 0 ) {
			Console.WriteLine("El número {0} es múltiplo de 2 pero no de 3", n);
		}

	}
}


