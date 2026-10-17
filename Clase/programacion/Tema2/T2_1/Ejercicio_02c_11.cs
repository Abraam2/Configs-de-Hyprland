using System;

class Program
{
    static void Main()
    {
        Console.Write("Escribe un número de més: ");
        int n = Convert.ToInt32(System.Console.ReadLine());

        switch (n)
        {
            case 1:
                Console.WriteLine("Enero");
                break;
            case 2:
                Console.WriteLine("Febrero");
                break;
            case 3:
                Console.WriteLine("Marzo");
                break;
            case 4:
                Console.WriteLine("Abril");
                break;
            case 5:
                Console.WriteLine("Mayo");
                break;
            case 6:
                Console.WriteLine("Junio");
                break;
            case 7:
                Console.WriteLine("Julio");
                break;
            case 8:
                Console.WriteLine("Agosto");
                break;
            case 9:
                Console.WriteLine("Septiembre");
                break;
            case 10:
                Console.WriteLine("Octubre");
                break;
            case 11:
                Console.WriteLine("Noviembre");
                break;
            case 12:
                Console.WriteLine("Diciembre");
                break;
            default:
                Console.WriteLine("No es ningún més");
                break;
        }

        /*

        Equivalente usando if

        if (n == 1)
        {
            Console.WriteLine("Enero");
        }
        else if (n == 2)
        {
            Console.WriteLine("Febrero");
        }
        else if (n == 3)
        {
            Console.WriteLine("Marzo");
        }
        else if (n == 4)
        {
            Console.WriteLine("Abril");
        }
        else if (n == 5)
        {
            Console.WriteLine("Mayo");
        }
        else if (n == 6)
        {
            Console.WriteLine("Junio");
        }
        else if (n == 7)
        {
            Console.WriteLine("Julio");
        }
        else if (n == 8)
        {
            Console.WriteLine("Agosto");
        }
        else if (n == 9)
        {
            Console.WriteLine("Septiembre");
        }
        else if (n == 10)
        {
            Console.WriteLine("Octubre");
        }
        else if (n == 11)
        {
            Console.WriteLine("Noviembre");
        }
        else if (n == 12)
        {
            Console.WriteLine("Diciembre");
        }
        else
        {
            Console.WriteLine("No es ningún més");
        }
        */
    }
}
