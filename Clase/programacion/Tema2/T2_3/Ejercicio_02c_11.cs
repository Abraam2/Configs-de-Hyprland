using System;

class Program {
	static void Main() {
		
		int n = 4;
		int a;
		
		do {
		Console.Write("Adivina el número (1-100): ");
		a = Convert.ToInt32(Console.ReadLine());
		} while (a != n);
		
		Console.Write("Has adivinado el número, aquí tienes una galleta 🍪");
	}
}

