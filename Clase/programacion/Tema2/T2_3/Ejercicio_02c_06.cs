using System;

class Program {
    static void Main() {
        Console.Write("Inserta un número entero: ");
        int n = Convert.ToInt32(Console.ReadLine());

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (j <= n - i) {
                    Console.Write(" ");
                } else {
                    Console.Write("*");
                }
            }
            Console.WriteLine();
        }
    }
}
