using System;

class Program {
    static void Main() {
        int pasar = 1;

        Console.Write("Introduce el tamaño: ");
        int n = Convert.ToInt32(Console.ReadLine());

        if (n % 2 == 0 || n < 9 || n > 26) {
            Console.WriteLine("Número de filas incorrecto");
            pasar = 0;
        }

        if (pasar == 1) {
            for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= n; j++) {
                    if ((i == 1 || i == n) || (j == 1 || j == n) || (j == i || j == n - i + 1)) {
                        Console.Write("*");
                    } else {
                        Console.Write(" ");
                    }
                }
                Console.WriteLine();
            }
        }
    }
}
