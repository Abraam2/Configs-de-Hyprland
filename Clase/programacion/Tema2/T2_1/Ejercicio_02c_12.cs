using System;

class Program
{
    static void Main()
    {
        Console.Write("Escribe una letra: ");
        char letra = Convert.ToChar(Console.ReadLine());

        switch (letra)
        {
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
                Console.WriteLine("La letra introducida es una vocal");
                break;
            default:
                Console.WriteLine("La letra no es un una vocal");
                break;
        }
    }
}
