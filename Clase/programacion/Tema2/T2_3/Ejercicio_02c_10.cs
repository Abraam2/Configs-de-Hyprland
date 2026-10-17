using System;

class Program {
	static void Main() {
		
		int a;
		
		do {
		Console.Write("Escribe un número positivo (y no cero): ");
		a = Convert.ToInt32(Console.ReadLine());
		} while (a <= 0);
		
		while (a >= 0) {
			Console.WriteLine(a);
			a--;	
		}
	}
}
