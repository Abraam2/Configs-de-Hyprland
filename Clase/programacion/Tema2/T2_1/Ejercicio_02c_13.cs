using System;

class Program
{
    static void Main()
    {
        Console.Write("Introduce un carácter: ");
        char c = Convert.ToChar(Console.ReadLine());

        switch (c)
        {
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'Ñ':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
                Console.WriteLine("Letra alfabética de la A a la Z");
                break;
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                Console.WriteLine("Dígito del 0 al 9");
                break;
            default:
                Console.WriteLine("Cualquier otra cosa");
                break;
        }
    }
}
