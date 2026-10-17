using System;

class Program
{
    static void Main()
    {
		
		Console.Write("Inserta un número entero: ");
        int n = Convert.ToInt32(System.Console.ReadLine());
        
		for (int i = 1; i <= n; i++)
		{
			for (int j = 1; j <= i; j++)
			{
				Console.Write("*");
			}
			Console.WriteLine();
		}
    }
}

