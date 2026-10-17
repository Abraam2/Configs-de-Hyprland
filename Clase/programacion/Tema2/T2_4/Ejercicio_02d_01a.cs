using System;

class Program {
    static void Main() {
        int edad = 18;
        int fecha = 2000;

        try {
            Console.Write("Introduce tu edad: ");
            edad = Convert.ToInt32(System.Console.ReadLine());

            if (edad <= 10 || edad >= 100) {
                Console.WriteLine("Esa no es una edad válida, eres un mentiroso");
            }

            Console.Write("Introduce tu fecha de nacimiento: ");
            fecha = Convert.ToInt32(System.Console.ReadLine());
        } catch (FormatException) {
            Console.WriteLine("Eso no es un dato válido");
        }

        if (fecha <= 1935 || fecha >= 2016) {
            Console.WriteLine("Esa no es una fecha válida, eres un mentiroso");
        }
    }
}
