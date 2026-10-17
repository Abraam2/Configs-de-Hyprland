using System;

class Program
{
    static void Main()
    {
		int i = 1;
		int j = 1;
		
		while (i <= 5) {
			while (j <= i) {
				Console.Write(j);
				j++;	
			}
			Console.WriteLine();
			i++;
			j = 1;
		}
		
		
		/*for (int i = 1; i <= 5; i++)
		{
			for (int j = 1; j <= i; j++)
			{
				Console.Write(j);
			}
			Console.WriteLine();
		} */
    }
}

