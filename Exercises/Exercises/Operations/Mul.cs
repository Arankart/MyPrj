using System;



namespace Exercises
{
    class Mul : Operation
    {
        public float z { get; set; }

        public Mul(float _a, float _b) : base(_a, _b)
        {
            this.z = _a * _b;
        }

        public override void Calculate() => Console.WriteLine("Mul = " + z);
    }
}


    
 

