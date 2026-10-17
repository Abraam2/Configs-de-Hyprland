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
		
		// Si es verdad, devuelve num1, si es falso num2
		int mayor = (num1 > num2)?num1:num2;
		Console.Write("El número mayor es " + mayor);

	}
}

