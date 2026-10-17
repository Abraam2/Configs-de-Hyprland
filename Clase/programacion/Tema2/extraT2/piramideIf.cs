using System;

class Program {
    static void Main() {
        Console.Write("Inserta un número entero: ");
        int n = Convert.ToInt32(Console.ReadLine());

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n - i; j++) {
                Console.Write(" ");
            }

            for (int k = 1; k <= 2 * i - 1; k++) {
                Console.Write("*");
            }

            Console.WriteLine();
        }
    }
}
