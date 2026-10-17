using System;

class Program
{
    static void Main()
    {
        Console.Write("Inserta un entero: ");
        int n = Convert.ToInt32(System.Console.ReadLine());

        for (int i = 0; i <= 10; i++)
        {
			Console.WriteLine("{0} x {1} = {2}", n, i, (n * i));
		}
    }
}
