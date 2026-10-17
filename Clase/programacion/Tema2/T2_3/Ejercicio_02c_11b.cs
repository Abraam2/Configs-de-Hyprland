using System;

class Program {
	static void Main() {
		
		int n = 4;
		int a;
		int intento = 0;
		
		do {
		Console.Write("Adivina el número (1-100): ");
		a = Convert.ToInt32(Console.ReadLine());
		intento++;
		} while (a != n && intento < 6);
		
		if (intento <= 6) {
			Console.Write("Has adivinado el número, aquí tienes una galleta 🍪");
		} else {
			Console.Write("Has perdido, eres un completo fracasado.");
		}
		
	}
}


