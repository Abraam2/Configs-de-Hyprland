using System;

class Program
{
    static void Main()
    {
        int n;

        do
        {
            Console.Write("Inserta una contraseña de 4 números: ");
            n = Convert.ToInt32(System.Console.ReadLine());
        } while (n != 1111);
    }
}
