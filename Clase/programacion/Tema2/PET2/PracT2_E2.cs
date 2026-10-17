using System;

class Program {
    static void Main() {
        int anterior = 0;
        int menor = 0;
        int mayor = 0;
        int masRepetido = 0;
        int racha = 1;
        int mayorRacha = 1;
        int final = 0;

        do {
            try {
                Console.Write("Introduce un número entero (0 para parar): ");
                int n = Convert.ToInt32(Console.ReadLine());

                if (n == 0) {
                    final = 1;
                } else {
                    if (mayor == 0 && menor == 0) {
                        menor = n;
                        mayor = n;
                    } else {
                        if (n == anterior) {
                            racha++;
                        } else {
                            racha = 1;
                        }

                        if (racha > mayorRacha) {
                            mayorRacha = racha;
                            masRepetido = n;
                        }
                        
                        if (n < menor) {
                            menor = n;
                        }
                        if (n > mayor) {
                            mayor = n;
                        }
                    }

                    anterior = n;
                }

            } catch (FormatException) {
                Console.WriteLine("Eso no es un número válido válido");
            }
        } while (final < 1);

        Console.WriteLine("El número mayor es: {0}", mayor);
        Console.WriteLine("El número menor es: {0}", menor);

        if (mayorRacha == 1) {
            Console.WriteLine("Ningún número es el más repetido");
        } else {
            Console.WriteLine("El número más repetido es: {0} y se ha repetido {1} veces", masRepetido, mayorRacha);
        }
    }
}
