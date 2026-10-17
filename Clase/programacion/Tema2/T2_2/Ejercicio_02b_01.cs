using System;

class Program
{
    static void Main()
    {
        Console.Write("Inserta una contraseña de 4 números: ");
        int n = Convert.ToInt32(System.Console.ReadLine());

        while (n != 1111)
        {
            Console.Write("Incorresta. Vuelve a inserta una contraseña de 4 números: ");
            n = Convert.ToInt32(System.Console.ReadLine());
        }
    }
}
