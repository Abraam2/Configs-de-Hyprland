using System;

class Program {
    static void Main() {
        int edad = 18;
        int fecha = 2000;
        int ok = 0;

        do {
            try {
                Console.Write("Introduce tu edad: ");
                edad = Convert.ToInt32(System.Console.ReadLine());

                Console.Write("Introduce tu fecha de nacimiento: ");
                fecha = Convert.ToInt32(System.Console.ReadLine());

                ok = 1;
            } catch (FormatException) {
                Console.WriteLine("Eso no es un dato válido");
            }
        } while (ok == 0);
    }
}
