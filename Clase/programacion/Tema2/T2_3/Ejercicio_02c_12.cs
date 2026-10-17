using System;

class Program {
	static void Main() {
		
		Console.Write("Escribe un número entero: ");
		int n = Convert.ToInt32(Console.ReadLine());
		int primo = 1;
		
		for (int i = n - 1; i >= 2; i--) {
			if (n % i == 0) {
			primo = 0;
			break;
			}
		}
		
		if (primo == 0) {
			Console.WriteLine("El número {0} no es primo", n);
		} else {
			Console.WriteLine("El número {0} es primo", n);
		}
	}
}



