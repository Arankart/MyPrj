using System;
using System.Collections.Generic;
using System.Text;

namespace StudentAndTeacher_v01
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int i = 0;

            var std = new Student();
            var tcher = new Teacher();
            i = Cicle(i, 4, std);

            Console.WriteLine(" ");
            i = 0;

            i = Cicle(i, 4, tcher);

            Console.ReadKey();
        }

        private static int Cicle(int i, int count, People ppl)
        {
            while (i != count)
            {
                i++;
                ppl.Who();
            }

            return i;
        }
    }
}
