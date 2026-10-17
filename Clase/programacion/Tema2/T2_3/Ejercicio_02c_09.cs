using System;

class Program {
	static void Main() {
		
		// No hay que convertir nada porque el readline saca un string
		Console.Write("Inserta un texto: ");
		string texto = Console.ReadLine();
		
		int i = 0;
		
		foreach (char letra in texto) {
			if (letra == 'a') {
				i++;		
			}
		}
		
		Console.WriteLine("En el texto '{0}' la letra 'a' aparece {1} veces", texto, i);
	}
}

