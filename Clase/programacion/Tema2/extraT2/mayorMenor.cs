using System;

class Program
{
    static void Main()
    {	
		
		int a = 1;
		int b = 4; 
		int c = 17;
		int mayor = a;
		
		if (a > b && a > c) {
			mayor = a;
		}
		if (b > a && b > c) {
			mayor = b;
		}
		if (c > a && c > b) {
			mayor = c;
		}
		
		Console.WriteLine("El mayor es: {0}", mayor);
	}
}

