using System;
using System.Collections.Generic;
using System.Text;

namespace StudentDateBasa
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Members> mem = new List<Members>();

            for (int i = 0; i < 3; i++) mem.Add(new Members() { name = Console.ReadLine(), age = Convert.ToInt32(Console.ReadLine()) });

            Console.WriteLine("———————————————————");
            Console.WriteLine("");
            Console.WriteLine("Output:");



            foreach (var people in mem)
            {
                Console.WriteLine(people.name);
                Console.WriteLine(people.age);
                Console.WriteLine("");
            }

            Console.ReadKey();
        }
    }

    public class Members
    {
        public string name;
        public int age;
    }
}
