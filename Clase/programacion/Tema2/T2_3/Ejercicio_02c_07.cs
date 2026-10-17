using System;

class Program {
	static void Main() {
		
		Console.Write("Escribe un número: ");
		int a = Convert.ToInt32(Console.ReadLine());
		
		Console.Write("Escribe otro número: ");
		int b = Convert.ToInt32(Console.ReadLine());
		
		int min,mcd = -1;
		
		if (a < b) {
			min = a;	
		} else {
			min = b;
		}
		
		for (int i = min; i >= 2; i--) {
			if (a % i == 0 && b % i == 0) {
				mcd = i;
				break;		
			}	
		}
		if (mcd != -1) {
			Console.Write("El mcd de los números es {0}", mcd);
		}
	}
}
