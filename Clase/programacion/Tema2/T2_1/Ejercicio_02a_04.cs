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
		
		
		if ( num2 != 0 ) {
			// Se define la variable si se puede dividir para que no salte un error
			int div = num1 / num2;
			Console.WriteLine("La división entre el número {0} y {1} es {2}", num1, num2, div );
		}
		else {
			Console.WriteLine("No se puede dividir entre cero");
		}

	}
}

