using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Exercises
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var sum = new Sum(2, 6);
            var min = new Min(142, 36);
            var div = new Div(25, 6);
            var mul = new Mul(61, 4);

            sum.Calculate();
            min.Calculate();
            div.Calculate();
            mul.Calculate();
            Console.ReadKey();
        }
    }
}


    
 

