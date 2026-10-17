using System;

class Program
{
    static void Main()
    {
        int n = 0;
        int suma = 0;

        do
        {
            Console.Write("Inserta un número para sumar: ");
            n = Convert.ToInt32(System.Console.ReadLine());

            if (n > 0)
            {
                suma = suma + n;
                Console.WriteLine("La suma total es: " + suma);
            }
        } while (n > 0);
    }
}
