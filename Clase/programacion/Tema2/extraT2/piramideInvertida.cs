using System;

class Program {
    static void Main() {
        Console.Write("Inserta un número entero: ");
        int n = Convert.ToInt32(Console.ReadLine());

        for (int i = n; i >= 1; i--) {
            for (int j = 1; j <= n - i; j++) {
                Console.Write(" ");
            }

            for (int j = 1; j <= (2 * i - 1); j++) {
                Console.Write("*");
            }

            Console.WriteLine();
        }
    }
}
