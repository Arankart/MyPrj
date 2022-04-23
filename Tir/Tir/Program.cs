using System;
using System.Collections.Generic;
using System.Text;

namespace Tir
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Let's play.");
            Console.WriteLine("");

            Random rnd = new Random();

            bool binar = false;
            int count = 0;
            int value = 0;
            int points = 0;

            Game1(rnd, ref binar, ref value, 90);

            Game2(rnd, ref count, ref value, ref points, 30);

            Console.ReadKey();
        }

        private static void Game1(Random rnd, ref bool binar, ref int value, int winPoint)
        {
            while (binar != true)
            {
                value = rnd.Next(0, 100);

                if (value >= winPoint)
                {
                    binar = true;
                    Console.Write("Got " + value + " points. ");
                    Console.WriteLine("Your are win!");
                    break;
                }

                Console.WriteLine("Got " + value + " points. For win you must get from 90 to 100 points");
            }
        }

        private static void Game2(Random rnd, ref int count, ref int value, ref int points, int winPoint)
        {
            Console.WriteLine("");
            Console.WriteLine("Next game. For win you must get " + winPoint + " points");

            while (points < winPoint)
            {
                value = rnd.Next(0, 100);

                if (value <= 50)
                    points++;
                else if (value > 50 && value < 70)
                    points = points + 2;
                else if (value > 70 && value < 80)
                    points = points + 3;
                else if (value > 80 && value < 90)
                    points = points + 4;
                else if (value > 90 && value <= 10)
                    points = points + 5;
                count++;

                Console.WriteLine(count + "." + "Got " + value + " number. You have " + points);
            }
        }
    }
}
