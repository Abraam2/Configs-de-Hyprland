using System;
class Program {
    public static void Main() {
        string op;

        do {
            Console.WriteLine("0 - Salir");
            Console.WriteLine("1 - ejercicio 1");
            Console.WriteLine("2 - ejercicio 2");
            Console.WriteLine("3 - ejercicio 3");
            Console.WriteLine("5 - ejercicio 4");

            op = Console.ReadLine();

            switch (op) {
                case "0":
                    break;
                case "1":
                    ejercicio1();
                    break;
                case "2":
                    Ejercicio2();
                    break;
                case "3":
                    Ejercicio3();
                    break;
                case "4":
                    Ejercicio4();
                    break;
                default:
                    Console.WriteLine("Opción incorrecta");
                    break;
            }

        } while (op != "0");
    }

    //---------------------------------------EJERCICIO 1 ----------------------
    /*Ejercicio 1.
      Nombre del fichero: "PracT3_3.2.5.1.cs"
      El usuario de nuestro programa podrá teclear dos números de hasta 12
      cifras significativas. El programa deberá mostrar el resultado de dividir el primer número entre el segundo, utilizando tres cifras decimales
      */
    public static void ejercicio1() {
        Console.Write("Inserta un número decimal: ");
        double a = Convert.ToDouble(Console.ReadLine());

        Console.Write("Inserta un número decimal: ");
        double b = Convert.ToDouble(Console.ReadLine());

        double division = a / b;

        Console.WriteLine(division.ToString("F3"));
    }

    //---------------------------------------EJERCICIO 2 ----------------------
    /*Ejercicio 2.
      Nombre del fichero: "PracT3_3.2.5.2.cs"
      Crea un programa que use tres variables x,y,z. Las tres serán números
      reales, y nos bastará con datos de simple precisión. Se deberá pedir al usuario los
      valores para las tres variables y mostrar en pantalla el valor de x^2
      + y - z (con exactamente dos cifras decimales).
      */
    public static void Ejercicio2() {
        Console.Write("Inserta un número decimal: ");
        float x = Convert.ToSingle(Console.ReadLine());

        Console.Write("Inserta un número decimal: ");
        float y = Convert.ToSingle(Console.ReadLine());

        Console.Write("Inserta un número decimal: ");
        float z = Convert.ToSingle(Console.ReadLine());

        float resultado = x * x + y - z;

        Console.WriteLine(resultado.ToString("F2"));
    }

    //---------------------------------------EJERCICIO 3 ----------------------
    /*Ejercicio 3.
      Nombre del fichero: "PracT3_3.2.5.3.cs"
      Calcula el perímetro, área y diagonal de un rectángulo, a partir de su
      ancho y alto (perímetro = suma de los cuatro lados; área = base x altura; diagonal
      = hipotenusa, usando el teorema de Pitágoras). Muestra todos ellos con una cifra
      decimal.
      */
    public static void Ejercicio3() {
        double ancho = 13;
        double alto = 5;

        double perimetro = ancho * 2 + alto * 2;
        double area = ancho * alto;
        double diagonal = Math.Sqrt(ancho * ancho + alto * alto);

        Console.WriteLine("El perímetro es: " + perimetro.ToString("F1"));
        Console.WriteLine("El área es: " + area.ToString("F1"));
        Console.WriteLine("La diagonal es: " + diagonal.ToString("F1"));
    }

    //---------------------------------------EJERCICIO 4 ----------------------
    /*Ejercicio 4.
      Nombre del fichero: "PracT3_3.2.5.4.cs"
      Calcula la superficie y el volumen de una esfera, a partir de su radio
      (superficie = 4 * pi * radio al cuadrado; volumen = 4/3 * pi * radio al cubo). Usa
      datos "doble" y muestra los resultados con 5 cifras decimales.
      */
    public static void Ejercicio4() {
        double pi = 3.141592653589793238;
        double radio = 12;
        double superficie = 4 * pi * radio * radio;
        double volumen = 4 / 3 * pi * radio * radio * radio;

        Console.WriteLine("El volumen de una esfera con radio " + radio + " es: " + volumen.ToString("F5"));
        Console.WriteLine("La superficie de una esfera con radio " + radio + " es: " + superficie.ToString("F5"));
    }
}
